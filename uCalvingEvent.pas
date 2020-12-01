{
  Dam Groups - restrict to just Feed groups - GL request.

  Calf Groups - restrict to Batch/Feed groups - GL request.

  01/09/15 [V5.4 R8.4] /MK Bug Fix - Tab sequence was not fixed up after new components were added to the form.
                                   - Took out on KeyDown to teSearchAnimalText.
                                   - Took out mdCalvingDetail.Post on actSearchForAnimal.Execute.

  25/09/15 [V5.4 R8.8] /MK Bug Fix - GetGeneticDamNumber - If Genentic Dam Animal No does not exist then use Genetic Dam NatID.

  28/09/15 [V5.4 R9.0] /MK Bug Fix - dbCalvingDateOnEditValueChanged - Moved GetGeneticDamNumber to hear so GenticDam text now shows on CalvingDate change.
                                   - GetGeneticDamNumber - New mdCalvingHeader.DonorDamID field created and saved to from this function.
                                   - CreateCalving/UpdateCalving - Now saves DonorDamID to the animals table.
                                   - UpdateCalvingDateIfRequired/UpdateCalvingDamIfRequired - Added update of Calf.DonorDamID with these procedures.
                                   - ChangeCalfBreed - Clear CalfBreedID field before checking to see if BullBreedID > 0 as if user changes from a bull with
                                                       a breed to a bull with no breed, the first BullBreedID is associated with the calf - Tim O'Keeffe reported.

  28/10/15 [V5.4 R9.7] /MK Bug Fix - CheckCalvingInterval procedure added to show messages if animals were calved within the last 300 days
                                     like they were in the old version.
                           Change - Removed code that makes the calf name options not visible where the user does not have the pedigree module - GL/M.Cooney request.

  06/11/15 [V5.5 R0.3] /MK Change - GetCrossBreedID - Change made to add the cross breed if it doesn't exists.

  09/11/15 [V5.5 R0.4] /MK Bug Fix - AddHeaderRecord - Assign CalvingGroupID only if existing group type of cow is Feed.
                                   - CreateCalving/UpdateCalving - Do not set AllowDeletion boolean of AddToGroup as cow was being removed from
                                                                   group if it was already in the group selected.

  16/11/15 [V5.5 R0.7] /MK Bug Fix - dbBullUsedPropertiesChange - If editing and existing calving record's sire breed is 0 (missing/blank) then allow change of sire & calf breed.

  27/11/15 [V5.5 R1.4] /MK Bug Fix - dbBullUsedPropertiesChange - Change Projected Date depending on service date of service bull - GL request.

  18/12/15 [V5.5 R2.0] /MK Bug Fix - CreateCalving, UpdateCalving - Added creating of New ID Allocation event for calf if Animal Number entered.

  14/01/16 [V5.5 R2.2] /MK Bug Fix - CreateCalving - Program was not prompting the user to enter a condition score after the calving is saved - Carl Farrar (4378) reported.

  28/01/16 [V5.5 R2.4] /MK Bug Fix - GetAnimalNoFromNatIDNum - This procedure was only called with AutoGen or GenFromList of NatID.

  02/02/16 [V5.5 R2.5] /MK Change - IsDeletedFromCalving - Check for if DamID is Null and HerdID is Null is not sufficient enough to check for deleted calves.
                                                           Instead check if animal is deleted and animalid exists in DeletedCalvings table.
                           Bug Fix - dbCalvingDatePropertiesChange, dbCalvingDatePropertiesEditValueChanged
                                     - Changes made to check to see if dbCalvingDate is not null or is not <=0 so prompt for 11 months doesn't appear
                                       when the user is typing the calving date.

  05/02/16 [V5.5 R2.7] /MK Bug Fix - dbCalvingDatePropertiesChange - Program kept reverting to invalid date because PostEditValue saves future date into database
                                                                     and check was allowing posted date to be saved to calving record. Always revert to today.

  18/02/16 [V5.5 R3.9] /MK Bug Fix - dbCalvingDateOnEnter - Added a Win.PostMessage procedure to highlight the first 2 digits of the date in the Calving Date.

  22/02/16 [V5.5 R5.0] /MK Bug Fix - SetProjectedDateText - Default lProjectedDateText.Caption to blank and exit procedure is no Service Date specified.
                                                            Reported by GL where if user changes bull to a bull without a service date it wasn't blanking the projected calving date.
                                   - CreateCalving - Always trim the calf animal number before creating the animal record - SP request.
                           Change - SetProjectedDateText - Based Projected Calving date on last service rather than last PD or last service - GL/Hugh Collender request.
                           Additional Feature - dbCalvingDatePropertiesChange - If user changes the calving date and the new date differs to the projected calving date
                                                                                by more than 10 days then show the user a prompt to view the bull used list - GL/Hugh Collender request.
                                              - actSaveCalvingsExecute - Add same check for difference between actual calving date and projected calving date but
                                                                         check to see if the user has already see this message before saving - GL/SP request.

  08/03/16 [V5.5 R5.4] /MK Bug Fix - Removed CheckCalvingInterval from dbCalvingDatePropertiesEditValueChanged and added it to dbCalvingDateExit like the old calving event.
                                   - Add boolean to the form to check to see if the CalvingInterval was already checked before ValidateCalving.CheckCalvingInterval.

  10/03/16 [V5.5 R5.4] /MK Change - FormActivate - Preemptive check for a problem where the tag number of the calf was not created by the Herd Identifier of the Herd.
                                                   If this problem was found then store it in the debug log file in the database and close the form without messages
                                                   for are you sure you want to close the form.
                                                   Check this only for Irish herds but as soon as the NI users use the calving I will have to include NI in this check also.

  15/03/16 [V5.5 R5.4] /MK Additional Feature - dbStatusPropertiesChange - Set the CalfIsRegistered boolean to true if adding calving and is dead not tagged calf - GL request.
                                              - AddDetailRecord - If editing calving and CalfIsRegistered then set CalfIsRegistered to false if calf is not tagged
                                                                  so that the lCalfIsRegistered does not appear - GL request.

  16/03/16 [V5.5 R5.4] /MK Change - Fixed ordering of dam and calf groups.
                           Bug Fix - actDeleteCalvingExecute - KingData.InTransaction/StartTransaction/Commit was left out of the DeleteCalving routine as WinData.Calvings/Events
                                                               was not used at the start of the DeleteCalving routine to locate the event. WinData.Calvings/Events are still not used
                                                               here as we know the eventID coming into this form - SP suggested the KingData.InTransaction/StartTransaction/Commit should
                                                               be added back in just case there is an error in the database during the delete by SQL.
                                   - FormCloseQuery - Check to see if calving was deleted and if it was don't show "Are you sure you want to close" message.

  22/03/16 [V5.5 R5.4] /MK Bug Fix - ValidateCalf - Prompt user to select a disposal place if dead tagged selected and no disposal place selected - GL.

  04/04/16 [V5.5 R5.7] /MK Additional Feature - SetupBullTreeListView - New procedure that looks for StockBullEvents for the stock bulls and adds the the In/Out Date
                                                                        as well as the Projected Calving date from the In/Out Date.
                                                                        This new list pops up when the user clicks the drop-down-arrow for bull used.
                                                                        Bulls that have a stock bull event after the last calving date of the cow appear with + beside them
                                                                        that the user click on to show the Bull In/Out and Projected Calving Date from the In/Out date - GL request.

  04/08/16 [V5.5 R8.7] /MK Additional Feature - Add facility to save calving event to an XML file so the calving can be recreated if it needs to.
                                              - Added new objects to store the dam and calf details in the XML as the MemData set information was not updated after the transaction was posted.

  08/09/16 [V5.6 R0.0] /MK Additional Feature - Calf colour now shows for Irish herds if preference is ticked.
                                              - Changes made to allow NIreland customers to use this new calving screen.

  03/10/16 [V5.6 R0.5] /MK Additional Feature - GetIsCalvingChanged - This property was not checking FCalfAddedToModifiedCalving - Shane Lawlor.

  19/10/16 [V5.6 R2.2] /MK Bug Fix - ChangeCalfBreed - NI Herd - Only change the breed of current calf as error appeared when going through each calf.

  10/11/16 [V5.6 R3.0] /MK Bug Fix - FHUKLogInRequired should be defaulted to True so that HUKINameSerialNoViewer shows list - TGM reported.

  14/11/16 [V5.6 R3.1] /MK Bug Fix - CalfIsRegistered/TCalvingEvent.CalfReg should only set to True if AbortedTag and FCountry is Ireland.
                                     NIreland users have seperate registration for Still Births - TGM reported.
                                   - If country is NIreland don't prompt to select colour if dead not tagged calf - TGM reported.

  15/11/16 [V5.6 R3.2] /MK Change - Assign_DataSources_And_Fields - The restriction for steers not showing in suckler herds should only be applied where the country is Ireland - TGM request.

  23/11/16 [V5.6 R3.5] /MK Change - actDeleteCalving - Firstly delete the calving event from the Dam and bring back its lactno - SP request.

  06/03/17 [V5.6 R6.5] /MK Change - ShowForm - New const variable, AParlourCalvingDate, can be passed into this form for import of calvings from parlour - Johnny O'Hanlon.

  08/03/17 [V5.6 R6.6] /MK BugFix - Changed all instances of WinData.AddToGroup to WinData.GroupManager.AddToGroup - SP spotted this as a pontential problem.

  05/04/17 [V5.6 R8.0] /MK Change - AddCalving, UpdateCalving - Changed from while not(mdCalvingDetail.Eof) to for i := 0 to mdCalvingDetail.RecNo when looping through
                                                                the mdCalvingDetail table so the system can edit the mdCalvingDetail to post the CalfAnimalID after the animal is created.

  06/04/17 [V5.6 R8.0] /MK Additional Feature - Check for new preference for Default Calf Sex.
                                              - If this preference is not selected then don't default calf sex to anything and do check for calf sex in ValidateCalf.

  21/04/17 [V5.6 R8.0] /MK Change - GenerateNextNatID - Use new HerdLookup.GetNextAutoGenTagNumber function for auto-generated tag.

  24/04/17 [V5.6 R8.0] /MK Change - actCalvingOptionsExecute - Apply screen changes after Calving Options/Preferences screen closes.
                                  - GenerateNextNatID - Automatically generate the next calf nat id even if the user has entered a tag number that already exists.

  16/05/17 [V5.6 R8.1] /MK Bug Fix - actDeleteCalvingExecute - Changed the way the system checks to see if has to close out of the form before deleting the event - Catherine Kearnery.

  31/07/17 [V5.7 R1.1] /MK Change - dbStatusPropertiesChange - Set Dead Not Tagged calf as registered if country is Ireland or England.

  25/08/17 [V5.7 R2.1] /MK Bug Fix - DeleteCalvesSaleDeathEvents - A bracket after animalid line which didn't need to be there.
                                   - dbStatusPropertiesChange - sOldMortality was set to CalfMortality field not Mortality field so FCalfStatusChanged was always true.
                                                              - CalfStatusChanged was incorrectly being set if adding a calving not editing.

  12/09/17 [V5.7 R2.4] /MK Change - FormActivate - Only do this check for Irish and NIrish herds as English herds are allowed save blank tag numbers.

  07/11/17 [V5.7 R4.3] /MK Bug Fix - DeleteCalving - Removed check for NewIDAllocation Date on date of calving as NewIDAllocation event is always created
                                                     on the date that the event is entered.

  07/11/17 [V5.7 R4.3] /MK Change - CreateCalving/UpdateCalving - If tag is a 372 tag and live then set TransponderNo/ElectronicID to tag without spaces.

  27/11/17 [V5.7 R5.7] /MK Bug Fix - ChangeCalfBreed - mdCalvingHeader.CalfBreedID changed when it should be mdCalvingDetail.CalfBreedID.
                           Additional Feature - When a DonorDam is used calf breed should be assinged from Donors breed not Recipients breed - Colclough Byrne. 

  28/11/17 [V5.7 R5.7] /MK Bug Fix - Coded out dbBullUsedPropertiesChange and moved the code to dbBullUsedPropertiesCloseUp because, when editing a calving,
                                     if the use types in the bull code and clicks it, the OnChange event was not triggered - GL/Sally Anne Frawley reported.

  05/12/17 [V5.7 R5.9] /MK Change - CreateCalving - Add progress string of what sub event was created last. Added this progress string to exception error.
                                                  - Moved creation of XML data for new calvings out of sub event block.

  18/12/17 [V5.7 R6.3] /MK Bug Fix - When screen opens set dbBullUsedPropertiesChange to use same code as dbBullUsedPropertiesCloseUp.
                                   - If a stock bull event is found then set dbBullUsedPropertiesChange to nil and dbBullUsedPropertiesCloseUp to use dbBullUsedPropertiesChange.
                                     tvBullList needs dbBullUsedPropertiesChange where the standard combobox drop-down-list can use dbBullUsedPropertiesCloseUp - Milo Murphy.

  06/02/18 [V5.7 R6.8] /MK Bug Fix - ShowBullList_AfterActDate_ProjDateMsg - Changed from CalvingHeader.CalvingDate value to dbCalvingDate.Date as
                                                                             date wasn't table value wasn't changed at this point - Ellen Daly.
                           Change - Added events for dbCalvingDate.Properties OnInitPopup and OnCloseUp which sets the component font to white and then back to teal
                                    for better visibility of the dates in the calendar - Ellen Daly/SP.

  26/02/18 [V5.7 R8.2] /MK Change - CreateCalving - Seperated the sub events into different sections that individually store a log in the log file if an error occurs.

  23/03/18 [V5.7 R8.4] /MK Bug Fix - ShowForm - Don't allow cmboCalfNatID to appear if InputNatIDStyle is FromList but there is no records in the TagStore.

  04/04/18 [V5.7 R8.6] /MK Bug Fix - dbStatusPropertiesCloseUp - If user clicks into status and clicks out of it, the program crashed because it was try to clear the items
                                                                 of the status list but the item was already in use. This check only needs to be done for new calvings.
                                   - AddDetailRecord - If Country is Ireland or Nothern Ireland then check for Aborted Tag.
                                                       If Country is England then animals that are marked as aborted (Dead Not Tagged) have a blank tag number.
                                   - dbStatusPropertiesInitPopup - If editing a calving event don't allow status to be changed to Dead (Not Tagged)
                                                                   If adding a new calving then show Dead (Not Tagged) if entering first calf.

  01/06/18 [V5.8 R0.5] /MK Bug Fix - Removed clearing and re-creating of items in dbStatus OnCloseUp as it was causing a crash.
                                   - If adding a calving only allow first calf dbStatus to be changed to Dead (Not Tagged) - Sean Eggert.
                                   - Moved check for future date to dbCalvingDate OnChange not OnExit - Sean Eggert.

  05/06/18 [V5.8 R0.5] /MK Change - ChangeCalfBreed/AddDetailRecord - Set CalfIsPedigree boolean to false if calf breed is a cross breed - Cheryl Poole.
                                  - actAddCalfExecute - Added ValidateCalf to check if calf added is valid before creating a new mdCalvingDetail record.
                                  - mdCalvingHeaderBullUsedOnChange - Removed source code from this procedure and added it to the end of OnBullUsedChange_CloseUp
                                                                      as it was causing ChangeCalfBreed procedure to run twice.
                                  - SaveCalving - Moved ValidateCalving before ShowBullList_AfterActDate_ProjDateMsg and CheckDamDrugWithdrawalPeriod as it was pointless
                                                  that check for invalid tag or sex of calf appearing after ShowBullList_AfterActDate_ProjDateMsg and CheckDamDrugWithdrawalPeriod.
                                  - ValidateCalving - Added more validation for calving date versus date of birth of dam.

  06/06/18 [V5.8 R0.5] /MK Change - dbCalfSexPropertiesChange - Check for cross breed here also to set CalfIsPedigree boolean in mdCalvingDetail.

  27/06/18 [V5.8 R0.6] /MK Change - Removed OnChange property for dbBullUsed - instead calling OnBullUsedChange_CloseUp when mdCalvingHeaderBullUsed is assigned/changed.
                           Bug Fix - dbStatusPropertiesChange - Don't clear CalfSex when dbStatus is changed.

  28/06/18 [V5.8 R0.6] /MK Change - GetCalfBreedID - If dam is HO and sire is FR then calf is FR OR if dam is FR and sire is HO then calf is FR - GL/SP request.
                                  - ChangeCalfBreed - Some refactoring code changes here.

  10/09/18 [V5.8 R2.7] /MK Change - dbStatusPropertiesChange - Use the ABOR system with English herds.

  13/09/18 [V5.8 R2.8] /MK Change - Removed TCalfXMLInfo, TCalfDetails & TCalvingXMLInfo classes and their uses as they weren't being used properly and
                                    seem to be superceeded by the standalone unit uCalvingXML but were never removed.

  28/09/18 [V5.8 R3.0] /MK Change - FillBullList - Bulls In Use filter changed to be like the Service, Planned Bull and Stock Bull queries in HerdLookup i.e. check for null breed.

  22/10/18 [V5.8 R4.0] /MK Change - AddDetailRecord - Now that English are also generating ABORT tags, apply same rule to English herd as Ireland and Northern Ireland
                                                      i.e. only if the calf is dead and it has an aborted tag, on opening of a calving event, then set the
                                                      Status to Dead (Not Tagged). 
                                  - FillBullList - Changed SQL of bulls to include Left Join.
                                  - Removed mdCalvingHeaderBullUsedOnChange as it was never used.
                           Bug Fix - OnBullUsedChange_CloseUp - When editing a calving and changing the bull an Access Violation error appeared.
                                                                I added try accept here as Access Violation was caused by mdCalvingHeader not being in dsEditModes.

  23/10/18 [V5.8 R4.0] /MK Change - dbCalvingDatePropertiesChange - Give a warning message if adding an animal in an Irish herd and the date is less then 28 days from today - Peter Twoomey.

  24/10/18 [V5.8 R4.1] /MK Change - Took out all on E : Exception ShowMessage(e.Message) from try except.
                                  - FillBullList - Included PlannedBull EventType in Bullings SQL.
                                  - SetupBullTreeListView - If FSelectedBullID is assigned from StockBull events then set dbBullUsed to FSelectedBullID.
                                  - dbBullUsedPropertiesPopup - Default tvBullList (StockBull Events) to default dbBullUsed.DropDownWidth.
                                                              - If any of the items in the tvBullList have children i.e. have StockBullEvent dates, then set width to 500 to show dates.
                                  - Moved the SetupBullTreeListView to dbCalvingDatePropertiesChange so that bull list is derived from calving date change. 

   07/12/18 [V5.8 R5.7] /MK Change - FormDestroy - Added ApplicationLog.LogException and ApplicationLog.LogError in try excepts around each free in this procedure.
                                   - FormCloseQuery - Added ApplicationLog.LogException and ApplicationLog.LogError in a try except in this procedure.
                                   - These above changes were made based on call from Anne Ahern in the V5.8 R4.7 version there was an error closing out of the calving screen.

   07/02/19 [V5.8 R6.6] /MK Change - Removed AddToXMLFile code for now to see if this stops the Access Violation messages - need to look at XML code - SP.

   09/02/19 [V5.8 R6.7] /MK Change - Added ApplicationLog.LogDebugMessage to SaveCalving, CreateCalving and FormDestroy to assess Access Violation location.

   11/02/19 [V5.8 R6.8] /MK Change - Removed ApplicationLog.LogDebugMessage from SaveCalving, CreateCalving and FormDestroy to assess Access Violation location.
                                   - Added ApplicationLog.LogDebugMessage to ValidateCalving, ValidateCalf and ValidateAnimalDetails as previous version found Access Violation errors here.

   12/02/19 [V5.8 R6.9] /MK Change - GetCanShowtvBullList - Don't show TVBullList if editing a calving - James (Poplars).
                                                          - Don't show TVBullList if there are no StockBullEvents for the current herd and current lactations.
                            Bug Fix - SetProjectedDateText - Default FProjectedCalvingDate to zero before checking if AServiceDate = 0, this will stop message for
                                                             difference between calving date and projected for appearing for non service bulls.

   19/02/19 [V5.8 R6.9] /MK Change - Various changes in this form to tackle the Access Violation errors reported by customers, main changes include
                                     . checking for MemDataSet Integer field is greater than zero first check if field is null.
                                     . sepearated out the validate calf tag, check for duplicate tag/animal no in MemDataSet, check other calf details.

   21/03/19 [V5.8 R8.3] /MK Change - AddDetailRecord/ChangeCalfBreed - Default the bCalfIsPedigree to false if sire doesn't have a breed - MO.

   27/03/19 [V5.8 R8.3] /MK Change - GetCalfBreedID - Exit out of here if no SireBreedCode.
                                     AddDetailRecord/ChangeCalfBreed - Only check for cross breed if there is a CalfBreedID.

   23/04/19 [V5.8 R9.0] /MK Change - Added (F.B./Jumbo) to "Calf Number already exists in Herd" error - GL request.

   26/08/19 [V5.9 R0.1] /MK Change - ValidateCalving - Format message and make it more descriptive of what the issue with the bull is i.e no breed selected - GL/Ellen Daly.

   05/11/19 [V5.9 R1.1] /MK Bug Fix - CreateCalving - WinData.GroupManager.AddToGroup - AllowDeletion should be false as it was deleting calving cow from existing group
                                                                                        if the group wasn't changed - Milo Murphy.

   30/01/20 [V5.9 R2.1] /MK Bug Fix - dbBullUsedPropertiesPopup - Only pop up tvBullList if there are items regardless if Stock Bull events exist - Con Cremin.

   12/02/20 [V5.9 R2.2] /MK Change - dbStatusPropertiesChange - Change the aborted tag to year first as UK tags only have enough room for 2 characters after ABOR and DamTag - Mairi (Muldowneys).

   06/11/20 [V5.9 R7.2] /MK Additional Feature - Added Help button that links to new PDF file on the server.   
}

unit uCalvingEvent;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar, Db, dbTables,
   dxmdaset, ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView,
   cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxUtils,
   cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, cxTextEdit, cxDBEdit,
   cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
   cxDBLookupComboBox, cxCalendar, KRoutines, KDBRoutines, GenTypesConst, cxLookAndFeels, DateUtil,
   Mask, DBCtrls, uDefaults, uHerdLookup, Registry, uPreferences, Def,
   uHUKINameSerialNoViewer, uPedName, cxCheckBox, cxCurrencyEdit,
   cxHyperLinkEdit, uGlobalSettings, uCalvingSurvey, uCalvingSurveyForm,
   EventRecording, cxGridDBDataDefinitions, uHerdSync, uSPParser, cxGraphics,
   uAnimalSearch, DairyData, Groups, uAnimal, cxTreeView, ComCtrls,
   Contnrs, uApplicationLog, uCallToExternalProgram;

const
   cLiveDeadCalfPanelTop = 112;
   cLiveMortality = 'Live (Tagged)';
   cDeadAtBirthMortality = 'Dead (Tagged)';
   cStillBornMortality = 'Dead (Not Tagged)';
   cDefSpaceBetweenControls = 36;
   cDefCalvingHeaderHeight = 218;
   cDefLowestCalvingHeaderHeight = 142;
   cDefCalvingDetailHeight = 256;
   cDefFormHeight = 736;
   cContactAgfoodInfoText = 'You may need to contact the Dept. of Agriculture about this change.';
   cSingleTreeViewItemHeight = 28;

type
   TExistingCalvingRecord = record
      CREventDate : TDate;
      CRCalfAnimalID,
      CRCalfBreedID,
      CRCalfColourID,
      CRCalfMortalityID,
      CRCalfFeed_BatchGroupID : packed array[1..cMaxCalves] of Integer;
      CRCalfAnimalNo,
      CRCalfNatIDNum,
      CRCalfSex,
      CRCalfPedName : packed array[1..cMaxCalves] of String;
      CRCalfDead,
      CRCalfIsBreeding,
      CRCalfIsPedigree : packed array[1..cMaxCalves] of Boolean;
      CRCalfWeight : packed array[1..cMaxCalves] of Double;
      CRDamFeedGroupID,
      CRBirthType, CRSireID : Integer;
      CREventDesc : String;
   end;

   TAddAmendOrDeleteCalving = (ctAddCalving, ctAmendCalving, ctDeleteCalving);
   TfmCalvingEvent = class(TfmBaseForm)
     lSireNameText: TcxLabel;
     lDamNameText: TcxLabel;
     dbCalvingHeaderComment: TcxDBTextEdit;
     dbCalvingGroupID: TcxDBLookupComboBox;
     dbCalvingSurvey: TcxDBLookupComboBox;
     lGeneticDamNumberText: TcxLabel;
     dbCalvingDate: TcxDBDateEdit;
     bDeleteCalving: TdxBarLargeButton;
     actDeleteCalving: TAction;
     bCalvingSurvey: TdxBarLargeButton;
     actCalvingSurvey: TAction;
     dbBullUsed: TcxDBLookupComboBox;
     lProjected: TcxLabel;
     lProjectedDateText: TcxLabel;
     lCalfMortality: TcxLabel;
     lCalfNatID: TcxLabel;
     dbCalfNatID: TDBEdit;
     btnTagType: TcxButton;
     actTagType: TAction;
     cmboCalfNatID: TcxDBLookupComboBox;
     lAnimalNo: TcxLabel;
     dbCalfAnimalNo: TcxDBTextEdit;
     lCalfSex: TcxLabel;
     dbCalfSex: TcxDBComboBox;
     lCalfBreed: TcxLabel;
     lCalfBreedText: TcxLabel;
     dbCalfBreed: TcxDBLookupComboBox;
     lCalfColour: TcxLabel;
     dbCalfColour: TcxDBLookupComboBox;
     lProjectedCalfSex: TcxLabel;
     lProjectedCalfSexText: TcxLabel;
     lCalfName: TcxLabel;
     dbCalfName: TcxDBTextEdit;
     btnCalfPedName: TcxButton;
     actCalfPedName: TAction;
     pLiveCalf: TPanel;
     dbCalfIsBreeding: TcxDBCheckBox;
     dbCalfIsPedigree: TcxDBCheckBox;
     lCalfBirthWeight: TcxLabel;
     dbCalfBirthWeight: TcxDBCurrencyEdit;
     lKgsInfo: TcxLabel;
     lAssignToGroup: TcxLabel;
     dbCalfGroupID: TcxDBLookupComboBox;
     pDeadCalf: TPanel;
     lMortalityReason: TcxLabel;
     dbCalfMortality: TcxDBLookupComboBox;
     lDisposalPlace: TcxLabel;
     dbDisposalPlace: TcxDBLookupComboBox;
     lCalfNatIDNumOptions: TcxLabel;
     actAddCalf: TAction;
     actRemoveCalf: TAction;
     dbStatus: TcxDBComboBox;
     lDamSireHeader: TcxLabel;
     lCalfHeader: TcxLabel;
     lCalfIsRegistered: TcxLabel;
     teSearchAnimalText: TcxTextEdit;
     btnSearchForAnimal: TcxButton;
     actSearchForAnimal: TAction;
     lCalfNatIDNumOptionsText: TcxLabel;
     RemovedCalves: TdxMemData;
     RemovedCalvesId: TIntegerField;
     RemovedCalvesNatIdNo: TStringField;
     tvBullList: TcxTreeView;
     procedure FormCreate(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure dbCalfNatIDEnter(Sender: TObject);
     procedure dbCalfNatIDMouseDown(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: Integer);
     procedure cmboCalfNatIDPropertiesChange(Sender: TObject);
     procedure mdCalvingDetailBeforeClose(DataSet: TDataSet);
     procedure mdCalvingDetailBeforeCancel(DataSet: TDataSet);
     procedure mdCalvingDetailBeforeDelete(DataSet: TDataSet);
     procedure mdCalvingDetailBeforeInsert(DataSet: TDataSet);
     procedure dbCalfSexPropertiesChange(Sender: TObject);
     procedure actCalfPedNameExecute(Sender: TObject);
     procedure actAddCalfExecute(Sender: TObject);
     procedure actRemoveCalfExecute(Sender: TObject);
     procedure actCalvingSurveyExecute(Sender: TObject);
     procedure actTagTypeExecute(Sender: TObject);
     procedure actDeleteCalvingExecute(Sender: TObject);
     procedure actSaveCalvingsExecute(Sender: TObject);
     procedure actCalvingOptionsExecute(Sender: TObject);
     procedure actSearchForAnimalExecute(Sender: TObject);
     procedure dbStatusPropertiesChange(Sender: TObject);
     procedure dbStatusPropertiesCloseUp(Sender: TObject);
     procedure dbCalvingSurveyPropertiesChange(Sender: TObject);
     procedure dbCalvingHeaderCommentPropertiesChange(Sender: TObject);
     procedure CalvingDetailGridDBTableViewFocusedRecordChanged(
       Sender: TcxCustomGridTableView; APrevFocusedRecord,
       AFocusedRecord: TcxCustomGridRecord;
       ANewItemRecordFocusingChanged: Boolean);
     procedure dbCalvingGroupIDPropertiesChange(Sender: TObject);
     procedure dbCalfMortalityPropertiesChange(Sender: TObject);
     procedure dbDisposalPlacePropertiesChange(Sender: TObject);
     procedure teSearchAnimalTextPropertiesChange(Sender: TObject);
     procedure teSearchAnimalTextExistDamIDChanged (Sender : TObject);
     procedure dbStatusPropertiesInitPopup(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure actAddCalfUpdate(Sender: TObject);
     procedure actRemoveCalfUpdate(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
     procedure dbCalvingDateEnter(Sender: TObject);
     procedure dbBullUsedPropertiesPopup(Sender: TObject);
     procedure ActionListExecute(Action: TBasicAction;
       var Handled: Boolean);
     procedure tvBullListMouseDown(Sender: TObject; Button: TMouseButton;
       Shift: TShiftState; X, Y: Integer);
     procedure dbCalfColourPropertiesChange(Sender: TObject);
     procedure dbCalvingDatePropertiesChange(Sender: TObject);
     procedure OnBullUsedChange_CloseUp(Sender: TObject);
     procedure dbCalvingDatePropertiesInitPopup(Sender: TObject);
     procedure dbCalvingDatePropertiesCloseUp(Sender: TObject);
    procedure dbCalfBreedPropertiesChange(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
   private
     function GetIsCalvingChanged: Boolean;
     procedure GenerateCalfAnimalNo;
    function GetCanShowtvBullList: Boolean;
    procedure CheckMemDataDuplicateNatID_AnimalNo;
    procedure CheckCalfOtherDetails;
    procedure ValidateCalfTag;
   published
     bSaveCalvings: TdxBarLargeButton;
     actSaveCalvings: TAction;
     bCalvingOptions: TdxBarLargeButton;
     actCalvingOptions: TAction;
     mdCalvingHeader: TdxMemData;
     mdCalvingDetail: TdxMemData;
     pCalvingHeader: TPanel;
     pCalvingFooter: TPanel;
     CalvingDetailGridDBTableView: TcxGridDBTableView;
     CalvingDetailGridLevel: TcxGridLevel;
     CalvingDetailGrid: TcxGrid;
     dsCalvingHeader: TDataSource;
     dsCalvingDetail: TDataSource;
     pCalvingDetail: TPanel;
     pAddRemoveCancelCalf: TPanel;
     CalvingDetailGridDBTableViewAnimalNo: TcxGridDBColumn;
     CalvingDetailGridDBTableViewCalfNatID: TcxGridDBColumn;
     CalvingDetailGridDBTableViewCalfPedigreeName: TcxGridDBColumn;
     CalvingDetailGridDBTableViewCalfSex: TcxGridDBColumn;
     CalvingDetailGridDBTableViewCalfBirthWeight: TcxGridDBColumn;
     btnAddCalf: TcxButton;
     btnRemoveCalf: TcxButton;
     lAnimalNoNatIDNo: TcxLabel;
     lCalvingDate: TcxLabel;
     lBullUsed: TcxLabel;
     lGeneticDam: TcxLabel;
     lCalvingSurvey: TcxLabel;
     lCurrentGroup: TcxLabel;
     lComment: TcxLabel;
     lSireName: TcxLabel;
     lDamName: TcxLabel;
   private
     FAddAmendOrDeleteCalving : TAddAmendOrDeleteCalving;
     FCalfBatch_FeedGroups,
     FStockBullEventQuery : TQuery;
     FDSCalfBatch_FeedGroups,
     FDSAnimalQuery,
     FDSBullList : TDataSource;
     FScreenHeight,
     FModifiedCalvingDetailHeight,
     FOriginalDamID,
     FEventID,
     FShowSetupScreenForCalfID : Integer;
     FBullList : TdxMemData;
     FRollBackTag : Boolean;
     FDefaultNatIDMaskIndex : Integer;
     FNatIDGenerated,
     FHUKLogInRequired,
     FStatusItemsChanged,
     FCalvingSaved : Boolean;
     FExistingCalvingRecord : TExistingCalvingRecord;
     FCancelledCalvesSL : TStringList;
     FCalfAddedToModifiedCalving : Boolean;
     FDamIDChanged,
     FCalvingDateChanged,
     FBullUsedChanged,
     FCalvingSurveyChanged,
     FCalvingCommentChanged,
     FCalvingFeedGroupIDChanged,
     FCalfStatusChanged : Boolean;
     FSelectedDam : TAnimal;
     FSelectedDamLastCalvingDate : TDateTime;
     FCalfAnimalNumbers,
     FCalfNatIDNumbers : array of String;
     FGroupManager : TGroupManager;
     FCountry : TCountry;
     FHerdType : THerdType;
     FInputNatIDStyle : Integer;
     FProjectedCalvingDate : TDateTime;
     FDiffBetweenActAndProjDateChecked : Boolean;
     FCalvingIntervalChecked : Boolean;
     FHasFormErrors : Boolean;
     FSelectedBullID : Integer;
     FTVBullListSetup : Boolean;
     FExitWithoutSaving : Boolean;
     FTagPrefix : String;
     FParlourCalvingDate : TDateTime;
     FAddedCalvingEventID : Integer;
     FStockBullEventsExist : Boolean;
     FCallProgram : TCallPrograms;
     procedure InitForm;
     procedure Assign_DataSources_And_Fields;
     procedure AddHeaderRecord;
     procedure AddDetailRecord;
     procedure GenerateNextNatID;
     procedure ChangeTagTypeButtonColor;
     procedure FillBullList;
     procedure ClearMemDataSets;
     procedure RollBackAutoGenTagNumber;
     procedure ValidateCalfNatID(Sender: TField; const Text: String);
     procedure ChangeHyperLinkEditText;
     procedure ChangeCalfBreed;
     procedure ChangeHeaderPanelSize;
     procedure ChangeDetailPanelSize;
     procedure DeleteAssociatedDeathEvent(ACalfID : Integer);
     procedure FillFExistingCalvingRecord;
     procedure LoadDam(AAnimalID : Integer);
     procedure SetControlAsReadOnly (AReadOnly : Boolean);
     procedure CalvingDetailControlClick(Sender: TObject);
     procedure ResetChangeCalvingVariables;
     procedure ComboBoxOnPopup(Sender: TObject);
     function NatIDNumAlreadyExists(ANatIDNum: String): Boolean;
     function IsDeletedFromCalving(ANatIDNum: String): Boolean;
     function CalfNoAlreadyExists(ACalfNo: String): Boolean;
     function IsAbortedTag(ACalfNatID : String) : Boolean;
     function GetNatIDNumHerdIdentifier(AHerdID: Integer): string;
     function GetAnimalNoFromNatIDNum(ANatIDNum: String): String;
     function GetCrossBreedID(ABreedID: Integer): Integer;
     function GetCalfBreedID(ASireBreedID, ADamBreedID: Integer): Integer;
     function GetBreedName(ABreedID: Integer): String;
     function GetProjectedCalfType(AAnimalID, AAnimalLactNo: Integer): String;
     function ValidateCalfNatIDStr(ACalfNatID: String): String;
     function CalfNatIDAlreadyExists(ACalfNatID : String): Boolean;
     function GetNatIDMask : String;
     function GetPedigreeName (AAnimalID : Integer) : String;
     function GetSearchField: String;
     function GetGeneticDamNumber (ACalvingDate : TDateTime): String;

     procedure ValidateCalving();
     // Creates a new calving event
     procedure CreateCalving();
     // Changes an existing calving event.
     procedure UpdateCalving();
     procedure ValidateAnimalDetails();

     procedure CreateWeighingEvent(AAnimalID, AHerdID: Integer;
       AWeighingDate: TDateTime; AWeight: Double);
     procedure CreateDeathEvent(AAnimalID, AHerdID: Integer;
       ADeathDate: TDateTime; ADisposalPlace : Integer);
     procedure SetDefaultCalvingComment;
     procedure StoreCalfIdInCalvingsTable();
     procedure UpdateCalvingDamIfRequired();
     procedure UpdateCalvingDateIfRequired();
     procedure UpdateSireIfRequired();
     procedure SetCalfRegReminderifRequired();

     procedure DeleteExistingSaleDeathEvent(AAnimalID: Integer);
     procedure UndeleteCalfRecord;
     procedure ShowDeptWarningForRegCalves;
     function CalvingChanged: Boolean;
     procedure CheckDamDrugWithdrawalPeriod();
     procedure CheckCalvingInterval;
     procedure SetProjectedDateText ( AAnimalID, AAnimalLactNo : Integer; const AServiceDate : TDateTime = 0 );
     procedure ShowConditionScoreOrHealthPrompt;
     function ShowBullList_AfterActDate_ProjDateMsg : Boolean;
     procedure CallWinMessage(var Message: TMessage); message WM_CXDATE_ONENTER_MESSAGE;
     procedure FormControlMouseDown(Sender: TObject; Button: TMouseButton;
       Shift: TShiftState; X, Y: Integer);
     procedure HideTreeViewList;
     procedure SetupBullTreeListView;
     procedure SaveCalving;
     procedure DeleteCalving();

     property IsCalvingChanged : Boolean read GetIsCalvingChanged;

     property CanShowtvBullList : Boolean read GetCanShowtvBullList;
     { Private declarations }
   public
     class procedure ShowForm ( var ACalvingChanged : Boolean;  var AEditingCalfID : Integer;
        AAddAmendOrDeleteCalving : TAddAmendOrDeleteCalving; AAnimalID : Integer; const AEventID : Integer = 0;
        const AParlourCalvingDate : TDateTime = 0);
     { Public declarations }
   end;

var
  fmCalvingEvent: TfmCalvingEvent;

implementation

{$R *.DFM}

class procedure TfmCalvingEvent.ShowForm ( var ACalvingChanged : Boolean;  var AEditingCalfID : Integer;
   AAddAmendOrDeleteCalving : TAddAmendOrDeleteCalving; AAnimalID : Integer; const AEventID : Integer = 0;
   const AParlourCalvingDate : TDateTime = 0);
begin
   with TfmCalvingEvent.Create(nil) do
      try
         WinData.ShowCalfRegReminder := False;
         WinData.CalvingSaved := False;
         WinData.CalvingDeleted := False;
         FAddAmendOrDeleteCalving := AAddAmendOrDeleteCalving;
         FParlourCalvingDate := AParlourCalvingDate;
         AEditingCalfID := 0;
         InitForm;
         Assign_DataSources_And_Fields;
         FEventID := AEventID;
         LoadDam(AAnimalID);
         if ( FSelectedDam.ID > 0 ) then
            begin
               if ( UpperCase(GetSearchField) = 'ANIMALNO' ) then
                  teSearchAnimalText.Text := FSelectedDam.AnimalNo
               else if ( UpperCase(GetSearchField) = 'NATIDNUM' ) then
                  teSearchAnimalText.Text := FSelectedDam.NatIdNum;
               // ToDo refactor this.
            end;

         if ( not(HerdLookup.TagStore.Active) ) then
            HerdLookup.TagStore.Open;
         //   23/03/18 [V5.7 R8.4] /MK Bug Fix - Don't allow cmboCalfNatID to appear if InputNatIDStyle is FromList but there is no records in the TagStore.
         cmboCalfNatID.Visible := ( FCountry in [Ireland, NIreland] ) and
                                  ( FInputNatIDStyle = cInputNatIDStyle_ListInput ) and
                                  ( FAddAmendOrDeleteCalving = ctAddCalving ) and
                                  ( HerdLookup.TagStore.RecordCount > 0 );
         if ( cmboCalfNatID.Visible ) then
            begin
               cmboCalfNatID.Top := dbCalfNatID.Top;
               cmboCalfNatID.Properties.OnChange := nil;
               cmboCalfNatID.Properties.OnChange := cmboCalfNatIDPropertiesChange;
               cmboCalfNatID.Properties.DropDownListStyle := lsFixedList;
            end;

         dbCalfNatID.Visible := ( not(cmboCalfNatID.Visible) ) and ( dbStatus.Text <> cStillBornMortality );
         btnTagType.Visible := ( FCountry = England ) and ( dbCalfNatID.Visible ) and ( FAddAmendOrDeleteCalving = ctAddCalving );

         lCalfBreedText.Visible := ( FCountry = Ireland );
         dbCalfBreed.Visible := ( not(lCalfBreedText.Visible) );
         if ( dbCalfBreed.Visible ) then
            dbCalfBreed.Left := dbCalfAnimalNo.Left;
         HerdLookup.OpenTagStore(UserDefaultHerdID);

         ShowModal;
      finally
         ACalvingChanged := CalvingChanged;
         AEditingCalfID := FShowSetupScreenForCalfID;
         Free;
      end;
end;

procedure TfmCalvingEvent.FormCreate(Sender: TObject);
var
   i : Integer;

   procedure SetDropDownControlProperties ( AControl : TControl );
   begin
      if ( AControl is TcxDBLookupComboBox) then
         begin
            ( AControl as TcxDBLookupComboBox ).Style.LookAndFeel.Kind := lfFlat;
            ( AControl as TcxDBLookupComboBox ).Properties.DropDownListStyle := lsFixedList;
            ( AControl as TcxDBLookupComboBox ).Properties.ListOptions.GridLines := glNone;
            ( AControl as TcxDBLookupComboBox ).Properties.ListOptions.ShowHeader := False;
            ( AControl as TcxDBLookupComboBox ).OnMouseDown := FormControlMouseDown;
         end
      else if ( AControl is TcxDBComboBox) then
         begin
            ( AControl as TcxDBComboBox ).Style.LookAndFeel.Kind := lfFlat;
            ( AControl as TcxDBComboBox ).Properties.DropDownListStyle := lsFixedList;
            ( AControl as TcxDBComboBox ).OnMouseDown := FormControlMouseDown;
         end
      else if ( AControl is TcxComboBox) then
         begin
            ( AControl as TcxComboBox ).Style.LookAndFeel.Kind := lfFlat;
            ( AControl as TcxComboBox ).Properties.DropDownListStyle := lsFixedList;
            ( AControl as TcxComboBox ).OnMouseDown := FormControlMouseDown;
         end
   end;

begin
   inherited;
   with pCalvingHeader do
      begin
         OnMouseDown := FormControlMouseDown;
         for i := 0 to ControlCount-1 do
            begin
               if ( Controls[i] is TcxDBLookupComboBox ) then
                   begin
                      SetDropDownControlProperties(Controls[i]);
                      (Controls[i] as TcxDBLookupComboBox).OnMouseDown := FormControlMouseDown;
                   end
               else if ( Controls[i] is TcxDBDateEdit ) then
                   begin
                      (Controls[i] as TcxDBDateEdit).Style.LookAndFeel.Kind := lfFlat;
                      (Controls[i] as TcxDBDateEdit).OnMouseDown := FormControlMouseDown;
                   end
               else if ( Controls[i] is TcxTextEdit ) then
                  begin
                     (Controls[i] as TcxTextEdit).Style.LookAndFeel.Kind := lfFlat;
                     if ( (Controls[i] as TcxTextEdit).Name = 'teSearchAnimalText' ) then
                        (Controls[i] as TcxTextEdit).Properties.ReadOnly := True;
                     (Controls[i] as TcxTextEdit).OnMouseDown := FormControlMouseDown;
                  end
               else if ( Controls[i] is TcxLabel ) then
                  (Controls[i] as TcxLabel).OnMouseDown := FormControlMouseDown
               else if ( Controls[i] is TcxButton ) then
                  (Controls[i] as TcxButton).OnMouseDown := FormControlMouseDown;
            end;
      end;
   with pCalvingDetail do
      begin
         OnMouseDown := FormControlMouseDown;
         for i := 0 to ControlCount-1 do
            begin
               if ( Controls[i] is TcxComboBox ) then
                  begin
                     SetDropDownControlProperties(Controls[i]);
                     (Controls[i] as TcxComboBox).OnMouseDown := FormControlMouseDown;
                  end
               else if ( Controls[i] is TcxDBComboBox ) then
                  begin
                     SetDropDownControlProperties(Controls[i]);
                     (Controls[i] as TcxDBComboBox).OnMouseDown := FormControlMouseDown;
                  end
               else if ( Controls[i] is TcxDBLookupComboBox ) then
                  begin
                     SetDropDownControlProperties(Controls[i]);
                     (Controls[i] as TcxDBLookupComboBox).OnMouseDown := FormControlMouseDown;
                  end
               else if ( Controls[i] is TcxDBTextEdit ) then
                  begin
                     (Controls[i] as TcxDBTextEdit).Style.LookAndFeel.Kind := lfFlat;
                     (Controls[i] as TcxDBTextEdit).OnMouseDown := FormControlMouseDown;
                  end
               else if ( Controls[i] is TcxDBCurrencyEdit ) then
                  begin
                     (Controls[i] as TcxDBCurrencyEdit).Style.LookAndFeel.Kind := lfFlat;
                     (Controls[i] as TcxDBCurrencyEdit).OnMouseDown := FormControlMouseDown;
                  end
               else if ( Controls[i] is TcxLabel ) then
                  (Controls[i] as TcxLabel).OnMouseDown := FormControlMouseDown
               else if ( Controls[i] is TcxButton ) then
                  (Controls[i] as TcxButton).OnMouseDown := FormControlMouseDown
               else if ( Controls[i] is TPanel ) then
                  (Controls[i] as TPanel).OnMouseDown := FormControlMouseDown;
            end;
      end;
   with pLiveCalf do
      begin
         OnMouseDown := FormControlMouseDown;
         for i := 0 to ControlCount-1 do
            begin
               if ( Controls[i] is TcxDBLookupComboBox ) then
                  begin
                     SetDropDownControlProperties(Controls[i]);
                     (Controls[i] as TcxDBLookupComboBox).OnMouseDown := FormControlMouseDown;
                  end
               else if ( Controls[i] is TcxDBCheckBox ) then
                  (Controls[i] as TcxDBCheckBox).OnMouseDown := FormControlMouseDown;
            end;
      end;
   with pDeadCalf do
      begin
         OnMouseDown := FormControlMouseDown;
         for i := 0 to ControlCount-1 do
            begin
               if ( Controls[i] is TcxDBLookupComboBox ) then
                  begin
                     SetDropDownControlProperties(Controls[i]);
                     (Controls[i] as TcxDBLookupComboBox).OnMouseDown := FormControlMouseDown;
                  end
               else if ( Controls[i] is TcxDBCheckBox ) then
                  (Controls[i] as TcxDBCheckBox).OnMouseDown := FormControlMouseDown;
            end;
      end;

   FCallProgram := TCallPrograms.Create();

   lProjected.Visible := False;
   lProjectedDateText.Visible := False;

   FNatIDGenerated := False;
   FStatusItemsChanged := False;
   FCalvingSaved := False;

   ChangeTagTypeButtonColor;

   FCancelledCalvesSL := TStringList.Create;

   lCalfBreedText.Caption := '';

   lCalfIsRegistered.Visible := False;

   FBullList := TdxMemData.Create(nil);
   ClearMemDataFieldDefs(FBullList);
   CreateMemDataFieldDef(FBullList,'ID',ftAutoInc);
   CreateMemDataFieldDef(FBullList,'BullID',ftInteger);
   CreateMemDataFieldDef(FBullList,'BullNo',ftString,10);
   CreateMemDataFieldDef(FBullList,'BullBreedID',ftInteger);
   CreateMemDataFieldDef(FBullList,'EventDate',ftDateTime);

   FDSBullList := TDataSource.Create(nil);

   ResetChangeCalvingVariables;

   FCalfBatch_FeedGroups := TQuery.Create(nil);
   FDSCalfBatch_FeedGroups := TDataSource.Create(nil);
   FStockBullEventQuery := TQuery.Create(nil);

   HerdLookup.QueryCustomers();

   if ( not(HerdLookup.qFeedGroups.Active) ) then
      HerdLookup.qFeedGroups.Open;

   btnSearchForAnimal.OnClick := actSearchForAnimalExecute;
   dbCalvingGroupID.Properties.OnChange := dbCalvingGroupIDPropertiesChange;
   dbCalvingSurvey.Properties.OnChange := dbCalvingSurveyPropertiesChange;
   dbCalvingHeaderComment.Properties.OnChange := dbCalvingHeaderCommentPropertiesChange;

   dbStatus.Properties.OnChange := dbStatusPropertiesChange;
   dbStatus.Properties.OnCloseUp := dbStatusPropertiesCloseUp;
   dbStatus.Properties.OnInitPopup := dbStatusPropertiesInitPopup;
   dbCalfNatID.OnEnter := dbCalfNatIDEnter;
   dbCalfNatID.OnMouseDown := dbCalfNatIDMouseDown;
   cmboCalfNatID.Properties.OnChange := cmboCalfNatIDPropertiesChange;
   btnCalfPedName.OnClick := actCalfPedNameExecute;
   dbCalfMortality.Properties.OnChange := dbCalfMortalityPropertiesChange;
   dbDisposalPlace.Properties.OnChange := dbDisposalPlacePropertiesChange;

   FGroupManager := TGroupManager.Create();

   HerdLookup.HerdOwnerData.HerdID := UserDefaultHerdID;
   FCountry := HerdLookup.HerdOwnerData.RegisteredCountry;
   FHerdType := HerdLookup.GetHerdType(UserDefaultHerdID);

   if ( FCountry = NIreland ) and ( IsNIRolloverHerd(UserDefaultHerdID) ) then
      FInputNatIDStyle := cInputNatIDStyle_ManualInput
   else
      FInputNatIDStyle := HerdLookup.HerdOwnerData.InputNatIDStyle;

   FDiffBetweenActAndProjDateChecked := False;
   FCalvingIntervalChecked := False;

   FHasFormErrors := False;

   tvBullList.Hide;

   FSelectedBullID := 0;

   tvBullList.Top := 180;

   FTVBullListSetup := False;

   FExitWithoutSaving := False;

   FTagPrefix := GetTagPreFix(UserDefaultHerdID);

   FHUKLogInRequired := True;

   FParlourCalvingDate := 0;

   WinData.CalvingDeleted := False;

   FAddedCalvingEventID := 0;

   FStockBullEventsExist := HerdLookup.StockBullEventsExist;

   SetLength(FCalfAnimalNumbers,0);
   SetLength(FCalfNatIDNumbers,0);
end;

procedure TfmCalvingEvent.FormActivate(Sender: TObject);
begin
   inherited;
   if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
      bDeleteCalving.Visible := ivNever;
   if ( (FCountry = England) and (FAddAmendOrDeleteCalving = ctAmendCalving) ) then
      bCalvingSurvey.Visible := ivAlways
   else
      bCalvingSurvey.Visible := ivNever;
   lCalfNatIDNumOptionsText.Visible := ( FCountry in [Ireland, NIreland] ) and ( FAddAmendOrDeleteCalving = ctAddCalving );
   lCalfNatIDNumOptions.Visible := lCalfNatIDNumOptionsText.Visible;
   if ( lCalfNatIDNumOptionsText.Visible ) then
      bCalvingOptions.Visible := ivAlways
   else
      bCalvingOptions.Visible := ivNever;
   ChangeHyperLinkEditText;

   lProjectedCalfSex.Visible := ( FAddAmendOrDeleteCalving = ctAddCalving );
   lProjectedCalfSexText.Visible := lProjectedCalfSex.Visible;

   //   10/03/16 [V5.5 R5.4] /MK Change - Preemptive check for a problem where the tag number of the calf was not created by the Herd Identifier of the Herd.
   //                                     If this problem was found then store it in the debug log file in the database and close the form without messages
   //                                     for are you sure you want to close the form.
   //                                     Check this only for Irish herds but as soon as the NI users use the calving I will have to include NI in this check also.

   CheckDamDrugWithdrawalPeriod();

   //   12/09/17 [V5.7 R2.4] /MK Change - Only do this check for Irish and NIrish herds as English herds are allowed save blank tag numbers.
   if ( FFormShowing ) and ( FAddAmendOrDeleteCalving = ctAddCalving ) and ( FCountry in [Ireland, NIreland] ) then
      begin
         if ( Length(dbCalfNatID.Text) = 0 ) then
            begin
               MessageDlg('An error has been found while generating the calf tag number.'+cCRLF+
                          'The Calving screen will now close.'+cCRLF+
                          'Please retry entering the calving event for this cow.',mtError,[mbOK],0);
               AddToDebugLogFile(IncludeTrailingBackslash(DefaultDirectory)+ DataDir,'uCalvingEvent - error creating CalfNatID');
               FHasFormErrors := True;
               PostMessage(Self.Handle,wm_close,0,0);
            end;
      end;

   // Do not call active more than once
   OnActivate := nil;
end;

procedure TfmCalvingEvent.LoadDam(AAnimalID: Integer);
begin
   if ( FSelectedDam <> nil ) then
      FreeAndNil(FSelectedDam);
   FSelectedDam := GetAnimal(AAnimalID); TAnimal.Create();
   if ( FSelectedDam <> nil ) then
      FSelectedDamLastCalvingDate := WinData.BreedingDataHelper.GetLastEventDate(FSelectedDam.Id,
                                                                                 cCalvingEvent,
                                                                                 mdCalvingHeader.FieldByName('CalvingDate').AsDateTime);
end;

procedure TfmCalvingEvent.SetControlAsReadOnly(AReadOnly: Boolean);
var
   i : Integer;
begin
   with pCalvingDetail do
      for i := 0 to ControlCount-1 do
         if ( Controls[i].Name <> 'dbStatus' ) then
            begin
               if ( Controls[i] is TDBEdit ) then
                  begin
                     ( Controls[i] as TDBEdit ).OnClick := nil;
                     ( Controls[i] as TDBEdit ).ReadOnly := AReadOnly;
                     if ( AReadOnly ) and ( not(((Controls[i] as TDBEdit).Name = 'dbCalfNatID') and
                                                 (FInputNatIDStyle <> cInputNatIDStyle_ManualInput) and
                                                 (FAddAmendOrDeleteCalving = ctAddCalving)) ) then
                        ( Controls[i] as TDBEdit ).OnClick := CalvingDetailControlClick;
                  end;
               if ( Controls[i] is TcxDBTextEdit ) then
                  begin
                     ( Controls[i] as TcxDBTextEdit ).Properties.ReadOnly := AReadOnly;
                     if ( AReadOnly ) then
                        ( Controls[i] as TcxDBTextEdit ).OnClick := CalvingDetailControlClick;
                  end;
               if ( Controls[i] is TcxDBComboBox ) then
                  begin
                     ( Controls[i] as TcxDBComboBox ).Properties.ReadOnly := AReadOnly;
                     ( Controls[i] as TcxDBComboBox ).Properties.OnPopup := ComboBoxOnPopup;
                     if ( AReadOnly ) then
                        ( Controls[i] as TcxDBComboBox ).Properties.OnInitPopup := CalvingDetailControlClick;

                  end;
               if ( Controls[i] is TcxDBLookupComboBox ) then
                  begin
                     ( Controls[i] as TcxDBLookupComboBox ).Properties.ReadOnly := AReadOnly;
                     ( Controls[i] as TcxDBLookupComboBox ).Properties.OnPopup := ComboBoxOnPopup;
                     if ( AReadOnly ) then
                        ( Controls[i] as TcxDBLookupComboBox ).Properties.OnInitPopup := CalvingDetailControlClick;
                  end;
            end;
   with pLiveCalf do
      for i := 0 to ControlCount-1 do
         begin
            if ( Controls[i] is TcxDBLookupComboBox ) then
               begin
                  ( Controls[i] as TcxDBLookupComboBox ).Properties.ReadOnly := AReadOnly;
                  ( Controls[i] as TcxDBLookupComboBox ).Properties.OnPopup := ComboBoxOnPopup;
                  if ( AReadOnly ) then
                     ( Controls[i] as TcxDBLookupComboBox ).OnEnter := CalvingDetailControlClick;
               end;
            if ( Controls[i] is TcxDBCheckBox ) then
               begin
                  ( Controls[i] as TcxDBCheckBox ).Properties.ReadOnly := AReadOnly;
                  if ( AReadOnly ) then
                     ( Controls[i] as TcxDBCheckBox ).OnEnter := CalvingDetailControlClick;
               end;
            if ( Controls[i] is TcxDBCurrencyEdit ) then
               begin
                  ( Controls[i] as TcxDBCurrencyEdit ).Properties.ReadOnly := AReadOnly;
                  if ( AReadOnly ) then
                     ( Controls[i] as TcxDBCurrencyEdit ).OnEnter := CalvingDetailControlClick;
               end;
         end;
   with pDeadCalf do
      for i := 0 to ControlCount-1 do
         if ( not(FCalfStatusChanged) ) then
            if ( Controls[i] is TcxDBLookupComboBox ) then
               begin
                  ( Controls[i] as TcxDBLookupComboBox ).Properties.ReadOnly := AReadOnly;
                  ( Controls[i] as TcxDBLookupComboBox ).Properties.OnPopup := ComboBoxOnPopup;
                  if ( AReadOnly ) then
                     ( Controls[i] as TcxDBLookupComboBox ).Properties.OnInitPopup := CalvingDetailControlClick;
               end;
end;

procedure TfmCalvingEvent.CalvingDetailControlClick(Sender: TObject);
var
   bShowPrompt : Boolean;
begin
   inherited;
   bShowPrompt := False;
   if ( (Sender is TDBEdit) ) then
      bShowPrompt := ( (Sender as TDBEdit).ReadOnly );
   if ( (Sender is TcxDBTextEdit) ) then
      bShowPrompt := ( (Sender as TcxDBTextEdit).Properties.ReadOnly );
   if ( (Sender is TcxDBComboBox) ) then
      bShowPrompt := ( (Sender as TcxDBComboBox).Properties.ReadOnly );
   if ( (Sender is TcxDBLookupComboBox) ) then
       begin
          if ( (Sender as TcxDBLookupComboBox).Name = 'dbCalfMortality' ) and ( not(FCalfStatusChanged) ) then
             begin
                MessageDlg('The mortality of the calf cannot be changed here.'+cCRLF+
                           'Please exit this screen and locate the calf in Show All Animals.',mtInformation,[mbOK],0);
                Exit;
             end
          else if ( (Sender as TcxDBLookupComboBox).Name = 'dbDisposalPlace' ) and ( not(FCalfStatusChanged) ) then
             begin
                MessageDlg('The disposal place of the calf cannot be changed here.'+cCRLF+
                           'Please exit this screen and locate the calf in Show All Animals.',mtInformation,[mbOK],0);
                Exit;
             end
          else
             bShowPrompt := ( (Sender as TcxDBLookupComboBox).Properties.ReadOnly );
       end;
   if ( (Sender is TcxDBCheckBox) ) then
      bShowPrompt := ( (Sender as TcxDBCheckBox).Properties.ReadOnly );
   if ( (Sender is TcxDBCurrencyEdit) ) then
      bShowPrompt := ( (Sender as TcxDBCurrencyEdit).Properties.ReadOnly );
   if ( bShowPrompt ) and ( dbStatus.Text = cLiveMortality ) then
      begin
         if ( MessageDlg('The calf record cannot be edited here.'+cCRLF+
                         'Do you want to go to the calf record screen to make changes to the calf?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
            if ( not(mdCalvingDetail.FieldByName('CalfAnimalID').IsNull) ) and ( not(mdCalvingDetail.FieldByName('CalfDead').AsBoolean) ) then
               begin
                  FShowSetupScreenForCalfID := mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger;
                  ResetChangeCalvingVariables;
                  Close;
               end;
      end
   else if ( bShowPrompt ) and ( dbStatus.Text <> cLiveMortality ) then
      MessageDlg('This calf has been marked as dead.'+cCRLF+
                 'Please exit this screen and locate the calf in Show All Animals.',mtInformation,[mbOK],0);
end;

procedure TfmCalvingEvent.ResetChangeCalvingVariables;
begin
   FCalfAddedToModifiedCalving := False;
   FOriginalDamID := 0;
   FDamIDChanged := False;
   FCalvingDateChanged := False;
   FBullUsedChanged := False;
   FCalvingSurveyChanged := False;
   FCalvingCommentChanged := False;
   FCalvingFeedGroupIDChanged := False;
   FCalfStatusChanged := False;

   WinData.CalvingDeleted := False;
end;

procedure TfmCalvingEvent.ComboBoxOnPopup(Sender: TObject);
begin
   if ( Sender is TcxDBComboBox ) then
      if ( Sender as TcxDBComboBox ).Properties.ReadOnly then
         ( Sender as TcxDBComboBox ).DroppedDown := False;
   if ( Sender is TcxDBLookupComboBox ) then
      if ( Sender as TcxDBLookupComboBox ).Properties.ReadOnly then
         ( Sender as TcxDBLookupComboBox ).DroppedDown := False;
end;

procedure TfmCalvingEvent.DeleteExistingSaleDeathEvent(AAnimalID : Integer);
var
   iSaleDeathEventID : Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Events');
         SQL.Add('WHERE AnimalID = '+IntToStr(AAnimalID)+'');
         SQL.Add('AND EventType = '+IntToStr(CSaleDeathEvent)+'');
         try
            Open;
            if ( Fields[0].AsInteger > 0 ) then
               begin
                  iSaleDeathEventID := Fields[0].AsInteger;
                  Close;
                  SQL.Clear;
                  SQL.Add('DELETE FROM SalesDeaths');
                  SQL.Add('WHERE EventID = '+IntToStr(iSaleDeathEventID)+'');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('DELETE FROM Events');
                  SQL.Add('WHERE ID = '+IntToStr(iSaleDeathEventID)+'');
                  ExecSQL;
               end;
         except
         end;
      finally
         Free;
      end;
end;

procedure TfmCalvingEvent.actCalfPedNameExecute(Sender: TObject);
begin
   inherited;
   if ( FCountry = NIreland ) then
      TfmHUKINameSerialNoViewer.ShowForm(FHUKLogInRequired)
   else
      TfPedName.ShowForm(dbCalfName.Text);
end;

procedure TfmCalvingEvent.actAddCalfExecute(Sender: TObject);
begin
   inherited;
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) then
      begin
         if ( MessageDlg('Do you want to add another calf to this existing calving record?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
            Exit
         else
            begin
               FAddAmendOrDeleteCalving := ctAddCalving;
               if ( mdCalvingDetail.State = dsInsert ) then
                  mdCalvingDetail.Post;
               CheckCalfOtherDetails;
               ValidateCalfTag;
               CheckMemDataDuplicateNatID_AnimalNo;
               AddDetailRecord;
               FCalfAddedToModifiedCalving := True;
               FAddAmendOrDeleteCalving := ctAmendCalving;
            end;
      end
   else
      begin
         if ( mdCalvingDetail.State in dsEditModes ) then
            mdCalvingDetail.Post;
         CheckCalfOtherDetails;
         ValidateCalfTag;
         CheckMemDataDuplicateNatID_AnimalNo;
         AddDetailRecord;
      end;

   try
      if ( dbCalfNatID.Visible ) then
         dbCalfNatID.SetFocus
      else if cmboCalfNatID.Visible then
         cmboCalfNatID.SetFocus
   except

   end;
end;

procedure TfmCalvingEvent.actRemoveCalfExecute(Sender: TObject);
begin
   inherited;
   if ( MessageDlg('You are about to remove this calf from this calving event.'+cCRLF+
                   'Are you sure you want to continue?',mtWarning,[mbYes,mbNo],0) = mrNo ) then Exit;

   if ( mdCalvingDetail.State in dsEditModes ) then
       mdCalvingDetail.Post;

   if ( mdCalvingDetail.RecordCount <= 1 ) then
      begin
         MessageDlg('You cannot remove this calf. There must be at least one calf record per calving event.',mtError,[mbOK],0);
         Exit;
      end;

   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) then
      begin
         if ( not(mdCalvingDetail.FieldByName('CalfAnimalID').IsNull) ) and ( mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger > 0 ) then
            begin
               if ( not RemovedCalves.Active ) then
                  RemovedCalves.Active := True;

               RemovedCalves.Append;
               RemovedCalves.FieldByName('Id').AsInteger := mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger;
               RemovedCalves.FieldByName('NatIdNo').AsString := mdCalvingDetail.FieldByName('CalfNatID').AsString;
               RemovedCalves.Post;

               if ( mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean ) then
                  MessageDlg('This calf has been registered.' + cCRLFX2 +
                             'You may need to contact the Dept. of Agriculture about this change.',mtWarning,[mbOK],0);
            end;
      end;

   mdCalvingDetail.Delete;
   if ( mdCalvingDetail.RecordCount = 0 ) then
      AddDetailRecord;
end;

procedure TfmCalvingEvent.actCalvingSurveyExecute(Sender: TObject);
var
   CalvingSurvey : TCalvingSurvey;
   AnimalID,
   LactNo,
   EventID : Integer;
begin
   inherited;
   AnimalID := FSelectedDam.Id;
   LactNo := FSelectedDam.LactNo;
   EventID := FEventID;
   CalvingSurvey := WinData.GetCalvingSurvey(AnimalID,LactNo,EventID);
   TfmCalvingSurveyForm.ShowSurvey(CalvingSurvey);
   WinData.SaveCalvingSurvey(CalvingSurvey);
end;

procedure TfmCalvingEvent.actTagTypeExecute(Sender: TObject);
begin
  inherited;
   with TfDefaults.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
   ChangeTagTypeButtonColor;
   if ( not (mdCalvingDetail.State in dsEditModes) ) and  ( mdCalvingDetail.RecordCount > 0 )  then
      mdCalvingDetail.Edit;
   mdCalvingDetail.FieldByName('CalfNatID').Clear;
   if (FInputNatIDStyle <> cInputNatIDStyle_ListInput) then
      mdCalvingDetail.FieldByName('CalfNatID').EditMask := WinData.DefaultNatIDMask;
end;

procedure TfmCalvingEvent.actDeleteCalvingExecute(Sender: TObject);
begin
   DeleteCalving();
end;

procedure TfmCalvingEvent.actSaveCalvingsExecute(Sender: TObject);
begin
   inherited;
   SaveCalving;
   if ( FExitWithoutSaving ) then
      Close;
end;

procedure TfmCalvingEvent.actCalvingOptionsExecute(Sender: TObject);
begin
   inherited;
   TfmGlobalSettings.ShowPreferences(ListEntryED, 'Calving', True);
   //   24/04/17 [V5.6 R8.0] /MK Change - Apply screen changes after Calving Options/Preferences screen closes.
   ChangeHeaderPanelSize;
   ChangeHyperLinkEditText;
end;

procedure TfmCalvingEvent.actSearchForAnimalExecute(Sender: TObject);
var
   AnimalID,  
   AnimalLactNo : Integer;

   function CalvingEventIDIsRegistered : Boolean;
   begin
      Result := False;
      mdCalvingDetail.DisableControls;
      mdCalvingDetail.First;
      while ( not(mdCalvingDetail.Eof) ) do
         begin
            Result := ( mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean );
            if ( Result ) then
               Break;
            mdCalvingDetail.Next;
         end;
      mdCalvingDetail.EnableControls;
   end;

begin
   inherited;
   AnimalID := 0;
   AnimalLactNo := 0;
   AnimalID := TfmAnimalSearch.GetAnimal(satCalvingCows,FAddAmendOrDeleteCalving = ctAmendCalving,dbCalvingDate.Date,teSearchAnimalText.Text);
   if ( AnimalID = 0 ) then Exit;
   if ( AnimalID <> FSelectedDam.ID ) then
      begin
         if ( FAddAmendOrDeleteCalving = ctAmendCalving ) then
            FDamIDChanged := ( MessageDlg('Are you sure you want to change the dam of this calving event?',mtConfirmation,[mbYes,mbNo],0) = mrYes );
         if ( FDamIDChanged ) or ( FAddAmendOrDeleteCalving = ctAddCalving ) then
            begin
               if ( FDamIDChanged ) and ( FAddAmendOrDeleteCalving = ctAmendCalving ) then
                   FOriginalDamID := FSelectedDam.Id;
               LoadDam(AnimalID);
               GetGeneticDamNumber(dbCalvingDate.Date);
               if ( UpperCase(GetSearchField) = 'ANIMALNO' ) then
                  teSearchAnimalText.Text := FSelectedDam.AnimalNo
               else if ( UpperCase(GetSearchField) = 'NATIDNUM' ) then
                  teSearchAnimalText.Text := FSelectedDam.NatIdNum;
            end;
      end;
end;

procedure TfmCalvingEvent.dbCalfNatIDEnter(Sender: TObject);
begin
   inherited;
   if ( FInputNatIDStyle = cInputNatIDStyle_ListInput ) then Exit;
   if ( FCountry <> Ireland ) then Exit;
   if ( mdCalvingDetail.FieldByName('CalfNatID').EditMask <> WinData.DefaultNatIDMaskFromHerdIdentifierMask ) then Exit;
   if ( FInputNatIDStyle = cInputNatIDStyle_ManualInput ) then
      begin
         if ( Trim(FTagPreFix) = cTagPrefix_IE ) then
            dbCalfNatID.SelStart := 12
         else
            dbCalfNatID.SelStart := 13;
      end;
end;

procedure TfmCalvingEvent.dbCalfNatIDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   inherited;
   if ( not(Length(dbCalfNatID.Text) = 12) ) then
      if ( FInputNatIDStyle <> cInputNatIDStyle_ListInput ) then
         if ( mdCalvingDetail.FieldByName('CalfNatID').EditMask = WinData.DefaultNatIDMaskFromHerdIdentifierMask ) then
            if ( FInputNatIDStyle = cInputNatIDStyle_ManualInput ) and ( FCountry = Ireland ) then
               begin
                  if ( Trim(FTagPreFix) = cTagPrefix_IE ) then
                     dbCalfNatID.SelStart := 12
                  else
                     dbCalfNatID.SelStart := 13;
               end;
end;

procedure TfmCalvingEvent.mdCalvingDetailBeforeClose(DataSet: TDataSet);
begin
   inherited;
   RollBackAutoGenTagNumber;
end;

procedure TfmCalvingEvent.mdCalvingDetailBeforeCancel(DataSet: TDataSet);
begin
   inherited;
   RollBackAutoGenTagNumber;
end;

procedure TfmCalvingEvent.mdCalvingDetailBeforeDelete(DataSet: TDataSet);
begin
   inherited;
   RollBackAutoGenTagNumber;
end;

procedure TfmCalvingEvent.mdCalvingDetailBeforeInsert(DataSet: TDataSet);
begin
   inherited;
   if ( mdCalvingDetail.RecordCount >= cMaxCalves ) Then
      begin
         MessageDlg('Only '+IntToStr(cMaxCalves)+' Calves Allowed',mtInformation,[mbOK],0);
         SysUtils.Abort;
      end;
end;

procedure TfmCalvingEvent.cmboCalfNatIDPropertiesChange(Sender: TObject);
begin
   inherited;
   if ( FInputNatIDStyle <> cInputNatIDStyle_ListInput ) then Exit;

   if ( (Trim(cmboCalfNatID.Text) = '') and (mdCalvingDetail.State in dsEditModes) and (not(mdCalvingDetail.FieldByName('CalfDead').AsBoolean)) ) then
      begin
         mdCalvingDetail.FieldByName('CalfNatID').AsString := GetNatIDNumHerdIdentifier(FSelectedDam.HerdId) + ' ';
         if Length(mdCalvingDetail.FieldByName('CalfNatID').AsString) = 0 then
            MessageDlg('Error creating next National ID from tag drop-down-list.'+cCRLF+
                       'Contact Kingswood.',mtError,[mbOK],0);
         cmboCalfNatID.SelStart := Length(mdCalvingDetail.FieldByName('CalfNatID').AsString) + 1;
      end;
end;

procedure TfmCalvingEvent.dbCalfSexPropertiesChange(Sender: TObject);
begin
   inherited;
   if ( mdCalvingDetail.State in dsEditModes ) then
      begin
         dbCalfIsBreeding.Visible := ( Length(dbCalfSex.Text) > 0 ) and ( dbCalfSex.Text <> cSex_Steer );
         mdCalvingDetail.FieldByName('CalfIsBreeding').AsBoolean := dbCalfSex.Text = cSex_Female;
         if ( dbCalfSex.Text = cSex_Bull ) or ( dbCalfSex.Text = cSex_Steer ) then
            mdCalvingDetail.FieldByName('CalfIsBreeding').AsBoolean := WinData.GlobalSettings.DefaultMaleBreedingStatus;
         if ( FCountry = Ireland ) then
            mdCalvingDetail.FieldByName('CalfIsPedigree').AsBoolean := ( not(BreedCodeIsCrossBreed(HerdLookup.BreedDetailsByID(mdCalvingHeader.FieldByName('CalfBreedID').AsInteger,'Code'))) )
         else
            mdCalvingDetail.FieldByName('CalfIsPedigree').AsBoolean := ( not(BreedCodeIsCrossBreed(HerdLookup.BreedDetailsByID(mdCalvingDetail.FieldByName('CalfBreedID').AsInteger,'Code'))) );
      end;
end;

procedure TfmCalvingEvent.InitForm;
begin
   dbStatus.Properties.Items.Clear;
   dbStatus.Properties.Items.Add(cLiveMortality);
   dbStatus.Properties.Items.Add(cDeadAtBirthMortality);
   dbStatus.Properties.Items.Add(cStillBornMortality);

   ClearMemDataSets;

   if ( not(WinData.qBirthType.Active) ) then
      WinData.qBirthType.Active := True;

   if ( not(WinData.qMortality.Active) ) then
      WinData.qMortality.Active := True;

   if ( not(WinData.qAnimalColours.Active) ) then
      WinData.qAnimalColours.Active := True;

   if ( not(HerdLookup.BreedQuery.Active) ) then
      HerdLookup.BreedQuery.Active := True;

   // Create FCowGroups of all eligible feed or batch groups in Grps table.
   FCalfBatch_FeedGroups.DatabaseName := AliasName;
   FCalfBatch_FeedGroups.SQL.Clear;
   FCalfBatch_FeedGroups.SQL.Add('SELECT ID, Code, Description');
   FCalfBatch_FeedGroups.SQL.Add('FROM Grps');
   FCalfBatch_FeedGroups.SQL.Add('WHERE (Upper(GroupType) = "FEED")');
   FCalfBatch_FeedGroups.SQL.Add('OR    (Upper(GroupType) = "BATCH")');
   FCalfBatch_FeedGroups.SQL.Add('ORDER BY Description');
   FCalfBatch_FeedGroups.Open;

   FDSCalfBatch_FeedGroups.DataSet := FCalfBatch_FeedGroups;

   FStockBullEventQuery.DatabaseName := AliasName;
   FStockBullEventQuery.SQL.Clear;
   FStockBullEventQuery.SQL.Add('SELECT DISTINCT(A.ID) BullID, A.AnimalNo BullNo, A.PrimaryBreed BullBreedID');
   FStockBullEventQuery.SQL.Add('FROM Animals A');
   FStockBullEventQuery.SQL.Add('LEFT JOIN Events EI ON (EI.AnimalID = A.ID)');
   FStockBullEventQuery.SQL.Add('LEFT JOIN Events EO ON (EO.AnimalID = A.ID)');
   FStockBullEventQuery.SQL.Add('WHERE (A.InHerd = TRUE)');
   FStockBullEventQuery.SQL.Add('AND   (A.AnimalDeleted = FALSE)');
   FStockBullEventQuery.SQL.Add('AND   (A.HerdID = :UserDefaultHerdID)');
   FStockBullEventQuery.SQL.Add('AND   ( (EI.EventType = :SBEvent) AND (Upper(EI.EventDesc) = "STOCK BULL IN") )');
   FStockBullEventQuery.SQL.Add('AND   ( (EO.EventType = :SBEvent) AND (Upper(EO.EventDesc) = "STOCK BULL OUT") )');
   FStockBullEventQuery.SQL.Add('AND   (EventDate > "'+FormatDateTime(cUSDateStyle,IncYear(mdCalvingHeader.FieldByName('CalvingDate').AsDateTime,-1))+'")');
   FStockBullEventQuery.Params[0].AsInteger := WinData.UserDefaultHerdID;
   FStockBullEventQuery.Params[1].AsInteger := CStockBullEvent;
   FStockBullEventQuery.Open;
end;

procedure TfmCalvingEvent.Assign_DataSources_And_Fields;
begin
   // This is used to assign the datasources, datafields of all entry fields on the form.
   // Also used to assign lookupsources of lookup combo boxes.

   // Header Panel First.
   if ( UpperCase(GetSearchField) = 'ANIMALNO' ) then
      lAnimalNoNatIDNo.Caption := 'Dam Animal No.:'
   else if ( UpperCase(GetSearchField) = 'NATIDNUM' ) then
      lAnimalNoNatIDNo.Caption := 'Dam Nat ID Num.:';

   dbCalvingDate.DataBinding.DataSource := dsCalvingHeader;
   dbCalvingDate.DataBinding.DataField := 'CalvingDate';
   dbCalvingDate.OnEnter := dbCalvingDateEnter;

   dbBullUsed.DataBinding.DataSource := dsCalvingHeader;
   dbBullUsed.DataBinding.DataField := 'BullUsed';

   dbCalvingSurvey.DataBinding.DataSource := dsCalvingHeader;
   dbCalvingSurvey.DataBinding.DataField := 'CalvingSurvey';
   dbCalvingSurvey.Properties.ListSource := WinData.dsBirthType;
   dbCalvingSurvey.Properties.KeyFieldNames := 'ID';
   dbCalvingSurvey.Properties.ListFieldNames := 'Description';

   dbCalvingGroupID.DataBinding.DataSource := dsCalvingHeader;
   dbCalvingGroupID.DataBinding.DataField := 'CalvingGroupID';
   dbCalvingGroupID.Properties.ListSource := HerdLookup.dsFeedGroups;
   dbCalvingGroupID.Properties.KeyFieldNames := 'ID';
   dbCalvingGroupID.Properties.ListFieldNames := 'Code;Description';
   dbCalvingGroupID.Properties.ListColumns[0].Width := 110;
   dbCalvingGroupID.Properties.ListColumns[1].Width := 300;

   dbCalvingHeaderComment.DataBinding.DataSource := dsCalvingHeader;
   dbCalvingHeaderComment.DataBinding.DataField := 'CalvingComment';

   // Detail Panel Second.

   dbStatus.DataBinding.DataSource := dsCalvingDetail;
   dbStatus.DataBinding.DataField := 'Mortality';
   dbStatus.Properties.DropDownListStyle := lsFixedList;

   dbCalfNatID.DataSource := dsCalvingDetail;
   dbCalfNatID.DataField := 'CalfNatID';
   cmboCalfNatID.DataBinding.DataSource := dsCalvingDetail;
   cmboCalfNatID.DataBinding.DataField := 'CalfNatID';
   cmboCalfNatID.RepositoryItem := HerdLookup.erTagLookup;

   dbCalfAnimalNo.DataBinding.DataSource := dsCalvingDetail;
   dbCalfAnimalNo.DataBinding.DataField := 'CalfAnimalNo';

   dbCalfSex.DataBinding.DataSource := dsCalvingDetail;
   dbCalfSex.DataBinding.DataField := 'CalfSex';
   dbCalfSex.Properties.Items.Clear;
   dbCalfSex.Properties.Items.Add(cSex_Female);
   dbCalfSex.Properties.Items.Add(cSex_Bull);
   //   15/11/16 [V5.6 R3.2] /MK Change - The restriction for steers not showing in suckler herds should only be applied where the country is Ireland - TGM request.
   if ( not(FHerdType = htSuckler) ) or ( FCountry <> Ireland ) then
      dbCalfSex.Properties.Items.Add(cSex_Steer);

   dbCalfBreed.DataBinding.DataSource := dsCalvingDetail;
   dbCalfBreed.DataBinding.DataField := 'CalfBreedID';
   dbCalfBreed.Properties.ListSource := HerdLookup.DSBreedQuery;
   dbCalfBreed.Properties.KeyFieldNames := 'ID';
   dbCalfBreed.Properties.ListFieldNames := 'Code;Name';
   dbCalfBreed.Properties.DropDownWidth := 200;
   dbCalfBreed.Properties.DropDownListStyle := lsFixedList;
   dbCalfBreed.Properties.ListColumns[0].Width := 200;
   dbCalfBreed.Properties.ListColumns[0].Caption := 'Code';
   dbCalfBreed.Properties.ListColumns[1].Width := 400;
   dbCalfBreed.Properties.ListColumns[1].Caption := 'Name';

   dbCalfColour.DataBinding.DataSource := dsCalvingDetail;
   dbCalfColour.DataBinding.DataField := 'CalfColour';
   dbCalfColour.Properties.ListSource := WinData.dsAnimalColours;
   dbCalfColour.Properties.KeyFieldNames := 'ID';
   dbCalfColour.Properties.ListFieldNames := 'Description';
   dbCalfColour.Properties.DropDownWidth := 200;
   dbCalfColour.Properties.DropDownListStyle := lsFixedList;

   dbCalfName.DataBinding.DataSource := dsCalvingDetail;
   dbCalfName.DataBinding.DataField := 'CalfPedigreeName';

   dbCalfIsBreeding.DataBinding.DataSource := dsCalvingDetail;
   dbCalfIsBreeding.DataBinding.DataField := 'CalfIsBreeding';

   dbCalfIsPedigree.DataBinding.DataSource := dsCalvingDetail;
   dbCalfIsPedigree.DataBinding.DataField := 'CalfIsPedigree';

   dbCalfBirthWeight.DataBinding.DataSource := dsCalvingDetail;
   dbCalfBirthWeight.DataBinding.DataField := 'CalfBirthWeight';
   dbCalfBirthWeight.Properties.DisplayFormat := '0.##';
   dbCalfBirthWeight.Properties.DecimalPlaces := 2;

   dbCalfGroupID.DataBinding.DataSource := dsCalvingDetail;
   dbCalfGroupID.DataBinding.DataField := 'CalfGroupID';
   dbCalfGroupID.Properties.ListSource := FDSCalfBatch_FeedGroups;
   dbCalfGroupID.Properties.KeyFieldNames := 'ID';
   dbCalfGroupID.Properties.ListFieldNames := 'Code;Description';
   dbCalfGroupID.Properties.ListColumns[0].Width := 110;
   dbCalfGroupID.Properties.ListColumns[1].Width := 300;

   dbCalfMortality.DataBinding.DataSource := dsCalvingDetail;
   dbCalfMortality.DataBinding.DataField := 'CalfMortality';
   if ( FCountry = NIreland ) then
      begin
         dbCalfMortality.Properties.ListSource := HerdLookup.dsNIStillBornReasons;
         dbCalfMortality.Properties.DropDownWidth := 250;
      end
   else
      begin
         dbCalfMortality.Properties.ListSource := WinData.dsMortality;
         dbCalfMortality.Properties.DropDownWidth := 200;
      end;
   dbCalfMortality.Properties.KeyFieldNames := 'ID';
   dbCalfMortality.Properties.ListFieldNames := 'Description';
   dbCalfMortality.Properties.DropDownListStyle := lsFixedList;

   dbDisposalPlace.DataBinding.DataSource := dsCalvingDetail;
   dbDisposalPlace.DataBinding.DataField := 'CalfDisposalPlace';
   dbDisposalPlace.Properties.ListSource := HerdLookup.dsCustomerQuery;
   dbDisposalPlace.Properties.KeyFieldNames := 'ID';
   dbDisposalPlace.Properties.ListFieldNames := 'Name';
   dbDisposalPlace.Properties.DropDownWidth := 200;
   dbDisposalPlace.Properties.DropDownListStyle := lsFixedList;
end;

procedure TfmCalvingEvent.AddHeaderRecord;
var
   dExistingCalvingDate : TDate;
   i : Integer;
   iDamExistGroupArray : PIntegerArray;
begin
   if ( mdCalvingHeader.RecordCount > 0 ) then Exit;
   if ( FSelectedDam.Id = 0 ) then Exit;

   mdCalvingHeader.Insert;
   mdCalvingHeader.FieldByName('AnimalID').AsInteger := FSelectedDam.Id;
   mdCalvingHeader.FieldByName('AnimalLactNo').AsInteger := FSelectedDam.LactNo;
   mdCalvingHeader.FieldByName('AnimalHerdID').AsInteger := FSelectedDam.HerdId;
   mdCalvingHeader.FieldByName('AnimalBreedID').AsInteger := FSelectedDam.BreedID;
   if ( FEventID > 0 ) then
      begin
         mdCalvingHeader.FieldByName('CalvingDate').AsDateTime := FExistingCalvingRecord.CREventDate;
         mdCalvingHeader.FieldByName('CalvingSurvey').AsInteger := FExistingCalvingRecord.CRBirthType;
         mdCalvingHeader.FieldByName('CalvingComment').AsString := FExistingCalvingRecord.CREventDesc;
         mdCalvingHeader.FieldByName('BullUsed').AsInteger := FExistingCalvingRecord.CRSireID;
         OnBullUsedChange_CloseUp(nil);
         //   09/11/15 [V5.5 R0.4] /MK Bug Fix - Assign CalvingGroupID only if existing group type of cow is Feed.
         if ( HerdLookup.qFeedGroups.Locate('ID',FExistingCalvingRecord.CRDamFeedGroupID,[]) ) then
            mdCalvingHeader.FieldByName('CalvingGroupID').AsInteger := FExistingCalvingRecord.CRDamFeedGroupID;
      end
   else
      begin
         if ( FParlourCalvingDate > 0 ) then
            mdCalvingHeader.FieldByName('CalvingDate').AsDateTime := FParlourCalvingDate
         else
            mdCalvingHeader.FieldByName('CalvingDate').AsDateTime := Date;
         if ( FCountry = Ireland ) then
            mdCalvingHeader.FieldByName('CalvingSurvey').AsInteger := WinData.ICBF_NormalBirthType_ID;
         //   09/11/15 [V5.5 R0.4] /MK Bug Fix - Assign CalvingGroupID only if existing group type of cow is Feed.
         SetLength(iDamExistGroupArray,0);
         iDamExistGroupArray := FGroupManager.GetAnimalsExistGroupIDs(FSelectedDam.Id,gtFeed);
         if ( Length(iDamExistGroupArray) > 0 ) then
            if ( HerdLookup.qFeedGroups.Locate('ID',iDamExistGroupArray[0],[]) ) then
               mdCalvingHeader.FieldByName('CalvingGroupID').AsInteger := iDamExistGroupArray[0];
         mdCalvingHeader.FieldByName('CalvingComment').AsString := 'Calving';
      end;
   mdCalvingHeader.Post;

   lDamNameText.Caption := GetPedigreeName(mdCalvingHeader.FieldByName('AnimalID').AsInteger);
   ChangeHeaderPanelSize;
end;

procedure TfmCalvingEvent.AddDetailRecord;
var
   i : Integer;
   TempNatIDNo : String;
   bCalfIsPedigree : Boolean;

   procedure GetCalfAnimalRecordInfo(ACalfCount : Integer);
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AnimalNo, NatIDNum, Sex, PrimaryBreed,');
            SQL.Add('       Colour, Breeding, Pedigree, BirthWeight, Name');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE ID = '+IntToStr(FExistingCalvingRecord.CRCalfAnimalID[i])+'');
            try
               Open;
               if ( RecordCount > 0 ) then
                  begin
                     if ( Length(Fields[0].AsString) > 0 ) then
                        FExistingCalvingRecord.CRCalfAnimalNo[ACalfCount] := Fields[0].AsString;
                     FExistingCalvingRecord.CRCalfNatIDNum[ACalfCount] := Fields[1].AsString;
                     FExistingCalvingRecord.CRCalfSex[ACalfCount] := Fields[2].AsString;
                     FExistingCalvingRecord.CRCalfBreedID[ACalfCount] := Fields[3].AsInteger;
                     FExistingCalvingRecord.CRCalfColourID[ACalfCount] := Fields[4].AsInteger;
                     FExistingCalvingRecord.CRCalfIsBreeding[ACalfCount] := Fields[5].AsBoolean;
                     FExistingCalvingRecord.CRCalfIsPedigree[ACalfCount] := Fields[6].AsBoolean;
                     FExistingCalvingRecord.CRCalfWeight[ACalfCount] := Fields[7].AsFloat;
                     FExistingCalvingRecord.CRCalfPedName[ACalfCount] := Fields[8].AsString;
                  end;
            except
            end;
         finally
            Free;
         end;
   end;

   function GetCalfDisposalPlace ( ACalfID : Integer ) : Integer;
   begin
      Result := 0;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT S.Customer');
            SQL.Add('FROM SalesDeaths S');
            SQL.Add('LEFT JOIN Events E On (E.ID = S.EventID)');
            SQL.Add('WHERE (E.AnimalID = '+IntToStr(ACalfID)+')');
            SQL.Add('AND   (E.EventDate = "'+FormatDateTime(cUSDateStyle,FExistingCalvingRecord.CREventDate)+'")');
            SQL.Add('AND   (E.EventType = '+IntToStr(CSaleDeathEvent)+')');
            try
               Open;
               if ( Fields[0].AsInteger > 0 ) then
                  Result := Fields[0].AsInteger;
            except
            end;
         finally
            Free;
         end;
   end;

begin
   if ( FSelectedDam.Id = 0 ) then Exit;
   SetControlAsReadOnly(FAddAmendOrDeleteCalving = ctAmendCalving);
   FNatIDGenerated := False;

   if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
      begin
         if ( mdCalvingDetail.State = dsBrowse ) then
            mdCalvingDetail.Append;

         btnTagType.Visible := ( FCountry = England ) and ( dbCalfNatID.Visible ) and ( FAddAmendOrDeleteCalving = ctAddCalving );

         mdCalvingDetail.FieldByName('Mortality').AsString := cLiveMortality;
         if ( not(WinData.GlobalSettings.NatIDToAnimalNo) ) then
            mdCalvingDetail.FieldByName('CalfAnimalNo').AsString := '';
         mdCalvingDetail.FieldByName('CalfSortAnimalNo').AsString := '';

         if ( WinData.GlobalSettings.DefaultCalfSex ) then
            if ( Length(WinData.GlobalSettings.DefaultCalfSexType) > 0 ) then
               mdCalvingDetail.FieldByName('CalfSex').AsString := WinData.GlobalSettings.DefaultCalfSexType;

         mdCalvingDetail.FieldByName('CalfBreedID').AsInteger := 0;
         mdCalvingDetail.FieldByName('CalfColour').AsInteger := 0;
         if ( FCountry <> Ireland ) then
            begin
               if ( WinData.DefaultColour > 0 ) then
                  mdCalvingDetail.FieldByName('CalfColour').AsInteger := WinData.DefaultColour;
               if ( (not(mdCalvingHeader.FieldByName('BullUsedBreedID').IsNull)) and (mdCalvingHeader.FieldByName('BullUsedBreedID').AsInteger > 0) ) and
                  ( ((not(mdCalvingHeader.FieldByName('AnimalBreedID').IsNull))) and (mdCalvingHeader.FieldByName('AnimalBreedID').AsInteger > 0) or
                    ((not(mdCalvingHeader.FieldByName('DonorDamBreedID').IsNull))) and (mdCalvingHeader.FieldByName('DonorDamBreedID').AsInteger > 0) ) then
                  begin
                     if ( (not(mdCalvingHeader.FieldByName('DonorDamBreedID').IsNull)) and (mdCalvingHeader.FieldByName('DonorDamBreedID').AsInteger > 0) ) then
                        mdCalvingDetail.FieldByName('CalfBreedID').AsInteger := GetCalfBreedID(mdCalvingHeader.FieldByName('BullUsedBreedID').AsInteger,
                                                                                               mdCalvingHeader.FieldByName('DonorDamBreedID').AsInteger)
                     else
                        mdCalvingDetail.FieldByName('CalfBreedID').AsInteger := GetCalfBreedID(mdCalvingHeader.FieldByName('BullUsedBreedID').AsInteger,
                                                                                               mdCalvingHeader.FieldByName('AnimalBreedID').AsInteger);
                  end;
            end;

         if ( Length(HerdLookup.HerdOwnerData.HerdPrefix) > 0 ) then
            mdCalvingDetail.FieldByName('CalfPedigreeName').AsString := HerdLookup.HerdOwnerData.HerdPrefix
         else
            mdCalvingDetail.FieldByName('CalfPedigreeName').AsString := '';

         mdCalvingDetail.FieldByName('CalfDead').AsBoolean := False;
         mdCalvingDetail.FieldByName('CalfIsBreeding').AsBoolean := ( not(FHerdType = htSuckler) );

         //   21/03/19 [V5.8 R8.3] /MK Change - Default the bCalfIsPedigree to false if sire doesn't have a breed - MO.
         bCalfIsPedigree := False;
         //   27/03/19 [V5.8 R8.3] /MK Change - Only check for cross breed if there is a CalfBreedID.
         if ( mdCalvingHeader.FieldByName('CalfBreedID').AsInteger > 0 ) then
            bCalfIsPedigree := ( not(BreedCodeIsCrossBreed(HerdLookup.BreedDetailsByID(mdCalvingHeader.FieldByName('CalfBreedID').AsInteger,'Code'))) );

         mdCalvingDetail.FieldByName('CalfIsPedigree').AsBoolean := bCalfIsPedigree;
         mdCalvingDetail.FieldByName('CalfBirthWeight').Value := Null;
         mdCalvingDetail.FieldByName('CalfMortality').AsInteger := 0;
         mdCalvingDetail.FieldByName('CalfDisposalPlace').AsInteger := 0;
         mdCalvingDetail.FieldByName('CalfGroupID').AsInteger := 0;
         mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean := False;
         lCalfIsRegistered.Visible := mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean;
      end
   else
      begin
         for i := 1 to cMaxCalves do
            if ( FExistingCalvingRecord.CRCalfAnimalID[i] > 0 ) then
               begin
                  GetCalfAnimalRecordInfo(i);
                  if ( mdCalvingDetail.State in dsEditModes ) then
                     mdCalvingDetail.Post;
                  mdCalvingDetail.Insert;
                  mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger := FExistingCalvingRecord.CRCalfAnimalID[i];
                  if ( Length(FExistingCalvingRecord.CRCalfAnimalNo[i]) > 0 ) then
                     mdCalvingDetail.FieldByName('CalfAnimalNo').AsString := FExistingCalvingRecord.CRCalfAnimalNo[i];
                  mdCalvingDetail.FieldByName('CalfNatID').AsString := FExistingCalvingRecord.CRCalfNatIDNum[i];
                  mdCalvingDetail.FieldByName('CalfSex').AsString := FExistingCalvingRecord.CRCalfSex[i];
                  mdCalvingDetail.FieldByName('CalfBreedID').AsInteger := FExistingCalvingRecord.CRCalfBreedID[i];
                  mdCalvingDetail.FieldByName('CalfColour').AsInteger := FExistingCalvingRecord.CRCalfColourID[i];
                  mdCalvingDetail.FieldByName('CalfPedigreeName').AsString := FExistingCalvingRecord.CRCalfPedName[i];
                  mdCalvingDetail.FieldByName('CalfIsBreeding').AsBoolean := FExistingCalvingRecord.CRCalfIsBreeding[i];
                  mdCalvingDetail.FieldByName('CalfIsPedigree').AsBoolean := FExistingCalvingRecord.CRCalfIsPedigree[i];
                  mdCalvingDetail.FieldByName('CalfBirthWeight').Value := FExistingCalvingRecord.CRCalfWeight[i];
                  //   04/04/18 [V5.7 R8.6] /MK Bug Fix - If Country is Ireland or Nothern Ireland then check for Aborted Tag.
                  //                                      If Country is England then animals that are marked as aborted (Dead Not Tagged) have a blank tag number.
                  //   22/10/18 [V5.8 R4.0] /MK Change - Now that English are also generating ABORT tags, apply same rule to English herd as Ireland and Northern Ireland.
                  if ( (FExistingCalvingRecord.CRCalfDead[i]) and
                       (IsAbortedTag(mdCalvingDetail.FieldByName('CalfNatID').AsString)) ) then 
                        mdCalvingDetail.FieldByName('Mortality').AsString := cStillBornMortality
                  else if ( FExistingCalvingRecord.CRCalfDead[i] ) then
                     mdCalvingDetail.FieldByName('Mortality').AsString := cDeadAtBirthMortality
                  else
                     mdCalvingDetail.FieldByName('Mortality').AsString := cLiveMortality;
                  dbStatusPropertiesCloseUp(nil);
                  mdCalvingDetail.FieldByName('CalfDead').AsBoolean := FExistingCalvingRecord.CRCalfDead[i];
                  mdCalvingDetail.FieldByName('CalfMortality').AsInteger := FExistingCalvingRecord.CRCalfMortalityID[i];
                  mdCalvingDetail.FieldByName('CalfDisposalPlace').AsInteger := GetCalfDisposalPlace(FExistingCalvingRecord.CRCalfAnimalID[i]);
                  mdCalvingDetail.FieldByName('CalfGroupID').AsInteger := FExistingCalvingRecord.CRCalfFeed_BatchGroupID[i];
                  mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean := ( WinData.IsCalfRegistered_BySQL(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger) );
                  //   15/03/16 [V5.5 R5.4] /MK Additional Feature - If editing calving and CalfIsRegistered then set CalfIsRegistered to false if calf is not tagged
                  //                                                 so that the lCalfIsRegistered does not appear - GL request.
                  if ( mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean ) then
                      mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean := ( not(WinData.IsNotTaggedCalf(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger)) );
                  lCalfIsRegistered.Visible := mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean;
                  mdCalvingDetail.Post;
               end;
      end;
end;

procedure TfmCalvingEvent.GenerateNextNatID;
var
   NewID : String;
   bTagExists : Boolean;
begin
   //   24/04/17 [V5.6 R8.0] /MK Change - Automatically generate the next calf nat id even if the user has entered a tag number that already exists.
   bTagExists := True;
   while ( bTagExists ) do
      begin
         NewID := '';
         //   21/04/17 [V5.6 R8.0] /MK Change - Use new HerdLookup.GetNextAutoGenTagNumber function for auto-generated tag.
         NewID := HerdLookup.GetNextAutoGenTagNumber;
         bTagExists := WinData.LookUpDamSire.Locate('NatIDNum',NewID,[loCaseInsensitive]);
      end;
   FNatIDGenerated := ( Length(NewID) > 0 );
   if ( FNatIDGenerated ) then
      try
         mdCalvingDetail.FieldByName('CalfNatID').EditMask := '';
         mdCalvingDetail.FieldByName('CalfNatID').Value := NewID;
      finally
         MessageDlg('Nat. Id. No. has been automatically generated.'+cCRLF+
                    'Please ensure generated Nat. Id. No. is correct!',mtWarning,[mbOK],0);
         if ( WinData.GlobalSettings.NatIDToAnimalNo ) then
            begin
               mdCalvingDetail.FieldByName('CalfAnimalNo').Clear;
               GetAnimalNoFromNatIDNum(mdCalvingDetail.FieldByName('CalfNatID').AsString);
            end;
      end
   else
      begin
         MessageDlg('Unable to create auto generated tag number.',mtError,[mbOK],0);
         SysUtils.Abort;
      end;
end;

procedure TfmCalvingEvent.ChangeTagTypeButtonColor;
begin
   btnTagType.Font.Color := clBlack;
   if ( FDefaultNatIDMaskIndex <> 4 ) then
      btnTagType.Font.Color := clRed;
end;

procedure TfmCalvingEvent.FillBullList;

   function GetServiceBullNo_Date_SQLStr ( ATableName : String ) : String;
   var
      sTableIndicatorStr,
      sFieldName : String;
      iaEventTypeArray : array of Integer;
   begin
      Result := '';
      sTableIndicatorStr := '';
      sFieldName := '';
      SetLength(iaEventTypeArray,0);
      if ATableName = 'Services' then
         begin
            sTableIndicatorStr := 'S';
            sFieldName := 'ServiceBull';
            SetLength(iaEventTypeArray,1);
            iaEventTypeArray[0] := CServiceEvent;
         end
      else if ( ATableName = 'Bullings' ) then
         begin
            sTableIndicatorStr := 'B';
            sFieldName := 'PlannedBull';
            SetLength(iaEventTypeArray,2);
            iaEventTypeArray[0] := CBullingEvent;
            iaEventTypeArray[1] := CPlannedBull;
         end;
      Result := 'SELECT A.ID CalvingCow, E.EventDate ServiceDate, SB.ID ServiceBullID, SB.AnimalNo ServiceBullNo, SB.PrimaryBreed'+cCRLF+
                'FROM Animals A'+cCRLF+
                'LEFT JOIN Events E On (E.AnimalID = A.ID)'+cCRLF+
                'LEFT JOIN '+ATableName+' '+sTableIndicatorStr+' ON ('+sTableIndicatorStr+'.EventID = E.ID)'+cCRLF+
                'LEFT JOIN Animals SB ON (SB.ID = '+sTableIndicatorStr+'.'+sFieldName+')'+cCRLF+
                'WHERE A.ID = '+IntToStr(FSelectedDam.Id)+cCRLF+
                'AND E.AnimalLactNo = A.LactNo'+cCRLF+
                'AND E.EventType IN '+IntArrayToSQLInString(iaEventTypeArray)+cCRLF+
                'ORDER BY E.EventDate Desc';
   end;

   function CanBullingBeAddedToList (AEventDate : TDateTime): Boolean;
   begin
      Result := False;
      if ( AEventDate < dbCalvingDate.Date ) then
         begin
            FBullList.First;
            while ( not(FBullList.Eof) ) do
               begin
                  Result := ( AEventDate < FBullList.FieldByName('EventDate').AsDateTime );
                  FBullList.Next;
               end;
         end;
   end;

begin
   dbBullUsed.Properties.ListSource := nil;

   if ( FSelectedDam.Id = 0 ) then Exit;

   FBullList.Close;
   FBullList.Open;

   FDSBullList.DataSet := nil;

   with TQuery.Create(nil) do
      try
         try
            DatabaseName := AliasName;
            if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
               begin
                  SQL.Clear;
                  SQL.Text := GetServiceBullNo_Date_SQLStr('Services');
                  Open;
                  First;
                  if ( RecordCount > 0 ) then
                     while ( not(Eof) ) do
                        begin
                           if ( Fields[2].AsInteger > 0 ) then
                              if ( not(FBullList.Locate('BullID',Fields[2].AsInteger,[])) ) and ( Fields[1].AsDateTime < dbCalvingDate.Date ) then
                                 begin
                                    FBullList.Append;
                                    FBullList.FieldByName('BullID').AsInteger := Fields[2].AsInteger;
                                    FBullList.FieldByName('BullNo').AsString := Fields[3].AsString;
                                    FBullList.FieldByName('BullBreedID').AsInteger := Fields[4].AsInteger;
                                    FBullList.FieldByName('EventDate').AsDateTime := Fields[1].AsDateTime;
                                    FBullList.Post;
                                 end;
                           Next;
                        end;
                  Close;

                  SQL.Clear;
                  SQL.Text := GetServiceBullNo_Date_SQLStr('Bullings');
                  Open;
                  First;
                  if ( RecordCount > 0 ) then
                     while ( not(Eof) ) do
                        begin
                           if ( Fields[2].AsInteger > 0 ) then
                              if ( not(FBullList.Locate('BullID',Fields[2].AsInteger,[])) ) and ( Fields[1].AsDateTime < dbCalvingDate.Date ) then
                                 begin
                                    FBullList.Append;
                                    FBullList.FieldByName('BullID').AsInteger := Fields[2].AsInteger;
                                    FBullList.FieldByName('BullNo').AsString := Fields[3].AsString;
                                    FBullList.FieldByName('BullBreedID').AsInteger := Fields[4].AsInteger;
                                    FBullList.FieldByName('EventDate').AsDateTime := Fields[1].AsDateTime;
                                    FBullList.Post;
                                 end;
                           Next;
                        end;
                  Close;

                  if ( not(FStockBullEventQuery.Active) ) then
                     FStockBullEventQuery.Open;
                  if ( FStockBullEventQuery.RecordCount > 0 ) then
                     begin
                        FStockBullEventQuery.First;
                        while ( not(FStockBullEventQuery.Eof ) ) do
                           begin
                              if ( FStockBullEventQuery.Fields[0].AsInteger > 0 ) then
                                 if ( not(FBullList.Locate('BullID',FStockBullEventQuery.Fields[0].AsInteger,[])) ) then
                                    begin
                                       FBullList.Append;
                                       FBullList.FieldByName('BullID').AsInteger := FStockBullEventQuery.Fields[0].AsInteger;
                                       FBullList.FieldByName('BullNo').AsString := FStockBullEventQuery.Fields[1].AsString;
                                       FBullList.FieldByName('BullBreedID').AsInteger := FStockBullEventQuery.Fields[2].AsInteger;
                                       FBullList.FieldByName('EventDate').Value := Null;
                                       FBullList.Post;
                                    end;
                              FStockBullEventQuery.Next;
                           end;
                        FStockBullEventQuery.Close;
                     end;

                  //   22/10/18 [V5.8 R4.0] /MK Change - Changed SQL of bulls to include Left Join.
                  SQL.Clear;
                  SQL.Add('SELECT A.ID, A.AnimalNo, A.NatIDNum, A.Name, A.PrimaryBreed');
                  SQL.Add('FROM Animals A');
                  SQL.Add('LEFT JOIN BullSemenStk B ON (B.AnimalID = A.ID)');
                  SQL.Add('WHERE (UPPER(A.Sex)="BULL")');
                  SQL.Add('AND   (B.InUse = True)');
                  SQL.Add('AND   (A.Breeding = True)');
                  SQL.Add('AND   (A.AnimalDeleted = False)');
                  SQL.Add('AND   (A.AnimalNo Is Not Null)');
                  //   28/09/18 [V5.8 R3.0] /MK Change - Bulls In Use filter changed to be like the Service, Planned Bull and Stock Bull queries in HerdLookup i.e. check for null breed.
                  SQL.Add('AND   ((A.PrimaryBreed IS NOT NULL) OR (A.PrimaryBreed > 0))');
                  SQL.Add('ORDER BY A.AnimalNo');
                  Open;
                  First;
                  while ( not(Eof ) ) do
                     begin
                        if ( Fields[0].AsInteger > 0 ) then
                           if ( not(FBullList.Locate('BullID',Fields[0].AsInteger,[])) ) then
                              begin
                                 FBullList.Append;
                                 FBullList.FieldByName('BullID').AsInteger := Fields[0].AsInteger;
                                 FBullList.FieldByName('BullNo').AsString := Fields[1].AsString;
                                 FBullList.FieldByName('BullBreedID').AsInteger := Fields[4].AsInteger;
                                 FBullList.FieldByName('EventDate').Value := Null;
                                 FBullList.Post;
                              end;
                        Next;
                     end;
                  Close;
               end
            else
               begin
                  //   22/10/18 [V5.8 R4.0] /MK Change - Changed SQL of bulls to include Left Join.
                  SQL.Clear;
                  SQL.Add('SELECT A.ID, A.AnimalNo, A.NatIDNum, A.Name, A.PrimaryBreed');
                  SQL.Add('FROM Animals A');
                  SQL.Add('LEFT JOIN BullSemenStk B ON (B.AnimalID = A.ID)');
                  SQL.Add('WHERE (UPPER(A.Sex)="BULL")');
                  SQL.Add('AND   (A.Breeding = True)');
                  SQL.Add('AND   (A.AnimalDeleted = False)');
                  SQL.Add('AND   (A.AnimalNo Is Not Null)');
                  //   28/09/18 [V5.8 R3.0] /MK Change - Bulls In Use filter changed to be like the Service, Planned Bull and Stock Bull queries in HerdLookup i.e. check for null breed.
                  SQL.Add('AND   ((A.PrimaryBreed IS NOT NULL) OR (A.PrimaryBreed > 0))');
                  SQL.Add('ORDER BY A.AnimalNo');
                  Open;
                  while ( not(Eof ) ) do
                     begin
                        if ( Fields[0].AsInteger > 0 ) then
                           if ( not(FBullList.Locate('BullID',Fields[0].AsInteger,[])) ) then
                              begin
                                 FBullList.Append;
                                 FBullList.FieldByName('BullID').AsInteger := Fields[0].AsInteger;
                                 FBullList.FieldByName('BullNo').AsString := Fields[1].AsString;
                                 FBullList.FieldByName('BullBreedID').AsInteger := Fields[4].AsInteger;
                                 FBullList.FieldByName('EventDate').Value := Null;
                                 FBullList.Post;
                              end;
                        Next;
                     end;
                  Close;
               end;
         except
         end;
      finally
         Free;
      end;

   if ( FBullList.RecordCount > 0 ) then
      begin
         FDSBullList.DataSet := FBullList;
         mdCalvingHeader.Edit;
         if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
            mdCalvingHeader.FieldByName('BullUsed').AsInteger := 0;
         dbBullUsed.Properties.ListSource := FDSBullList;
         dbBullUsed.Properties.KeyFieldNames := 'BullID';
         dbBullUsed.Properties.ListFieldNames := 'BullNo;EventDate';
         dbBullUsed.Properties.ListColumns[0].Width := 250;
         dbBullUsed.Properties.ListColumns[0].Caption := 'Bull Code';
         dbBullUsed.Properties.ListColumns[1].Width := 250;
         dbBullUsed.Properties.ListColumns[1].Caption := 'Date';
         FBullList.First;
         if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
            begin
               mdCalvingHeader.FieldByName('BullUsed').Clear;
               if ( FBullList.FieldByName('EventDate').AsDateTime > 0 ) then
                  mdCalvingHeader.FieldByName('BullUsed').AsInteger := FBullList.FieldByName('BullID').AsInteger;
            end;
         if ( (not(mdCalvingHeader.FieldByName('BullUsed').IsNull)) and (mdCalvingHeader.FieldByName('BullUsed').AsInteger > 0) ) then
            OnBullUsedChange_CloseUp(nil);
      end;
end;

procedure TfmCalvingEvent.ClearMemDataSets;
begin
   // Create MemData Header table to store event table information.
   if ( dsCalvingHeader <> nil ) then
      dsCalvingHeader.DataSet := nil;
   if ( mdCalvingHeader.Active) then
      mdCalvingHeader.Close;

   ClearMemDataFieldDefs(mdCalvingHeader);
   CreateMemDataFieldDef(mdCalvingHeader,'ID',ftAutoInc);
   CreateMemDataFieldDef(mdCalvingHeader,'AnimalID',ftInteger);
   CreateMemDataFieldDef(mdCalvingHeader,'AnimalLactNo',ftInteger);
   CreateMemDataFieldDef(mdCalvingHeader,'AnimalHerdID',ftInteger);
   CreateMemDataFieldDef(mdCalvingHeader,'AnimalBreedID',ftInteger);
   CreateMemDataFieldDef(mdCalvingHeader,'CalvingDate',ftDate);
   CreateMemDataFieldDef(mdCalvingHeader,'DonorDamID',ftInteger);
   CreateMemDataFieldDef(mdCalvingHeader,'DonorDamBreedID',ftInteger);
   CreateMemDataFieldDef(mdCalvingHeader,'BullUsed',ftInteger);
   CreateMemDataFieldDef(mdCalvingHeader,'BullUsedBreedID',ftInteger);
   CreateMemDataFieldDef(mdCalvingHeader,'CalvingSurvey',ftInteger);
   CreateMemDataFieldDef(mdCalvingHeader,'CalvingGroupID',ftInteger);
   CreateMemDataFieldDef(mdCalvingHeader,'CalvingComment',ftString,30);
   CreateMemDataFieldDef(mdCalvingHeader,'CalfBreedId',ftInteger);

   mdCalvingHeader.Open;
   dsCalvingHeader.DataSet := mdCalvingHeader;

   // Create MemData Detail table to store calvings table information.
   if ( dsCalvingDetail <> nil ) then
      dsCalvingDetail.DataSet := nil;
   if ( mdCalvingDetail.Active) then
      mdCalvingDetail.Close;
   ClearMemDataFieldDefs(mdCalvingDetail);
   CreateMemDataFieldDef(mdCalvingDetail,'ID',ftAutoInc);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfAnimalID',ftInteger);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfLactNo',ftInteger);
   CreateMemDataFieldDef(mdCalvingDetail,'Mortality',ftString,20);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfNatID',ftString,20);
   mdCalvingDetail.FieldByName('CalfNatID').OnSetText := ValidateCalfNatID;
   CreateMemDataFieldDef(mdCalvingDetail,'CalfSortNatID',ftString,20);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfAnimalNo',ftString,10);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfSortAnimalNo',ftString,10);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfSex',ftString,10);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfBreedID',ftInteger);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfColour',ftInteger);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfPedigreeName',ftString,40);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfDead',ftBoolean);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfIsBreeding',ftBoolean);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfIsPedigree',ftBoolean);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfBirthWeight',ftFloat);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfMortality',ftInteger);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfDisposalPlace',ftInteger);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfGroupID',ftInteger);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfMortalityReason',ftInteger);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfIsRegistered',ftBoolean);
   CreateMemDataFieldDef(mdCalvingDetail,'CalfStatusChanged',ftBoolean);
   mdCalvingDetail.Open;
   dsCalvingDetail.DataSet := mdCalvingDetail;
end;

procedure TfmCalvingEvent.RollBackAutoGenTagNumber;
begin
   if ( FInputNatIDStyle = cInputNatIDStyle_AutoGenInput ) and ( FNatIDGenerated ) then
      begin
         HerdLookup.HerdOwnerData.NextNatID := HerdLookup.HerdOwnerData.NextNatID-1;
         FRollBackTag := True;
         FNatIDGenerated := False;
      end;
end;

procedure TfmCalvingEvent.ValidateCalfNatID(Sender: TField; const Text: String);
var
   TempStr : String;
begin
   TempStr := ValidateCalfNatIDStr(Text);
   if ( CalfNatIDAlreadyExists(TempStr) ) then
      begin
         MessageDlg('Calf national id number already in use.',mtError,[mbOK],0);
         if cmboCalfNatID.Visible then
            cmboCalfNatID.SetFocus
         else
            dbCalfNatID.SetFocus;
      end
   else
      begin
         (Sender as TField).AsString := TempStr;
         GenerateCalfAnimalNo;
      end;
end;

procedure TfmCalvingEvent.ChangeHyperLinkEditText;
begin
   if ( FInputNatIDStyle <> 0 ) then
      lCalfNatIDNumOptionsText.Caption := HerdLookup.InputStyleAsString(FInputNatIDStyle)
   else
      lCalfNatIDNumOptionsText.Caption := 'Manual Input'
end;

procedure TfmCalvingEvent.ChangeCalfBreed;
var
   bCalfIsPedigree : Boolean;
   i : Integer;
begin
   if ( not(mdCalvingHeader.State in dsEditModes) ) then Exit;
   mdCalvingHeader.FieldByName('CalfBreedId').Clear;
   if ( (not(mdCalvingHeader.FieldByName('BullUsedBreedID').IsNull)) and (mdCalvingHeader.FieldByName('BullUsedBreedID').AsInteger > 0) ) and
      ( ((not(mdCalvingHeader.FieldByName('AnimalBreedID').IsNull))) and (mdCalvingHeader.FieldByName('AnimalBreedID').AsInteger > 0) or
        ((not(mdCalvingHeader.FieldByName('DonorDamBreedID').IsNull))) and (mdCalvingHeader.FieldByName('DonorDamBreedID').AsInteger > 0) ) then
      try
         if ( (not(mdCalvingHeader.FieldByName('DonorDamBreedID').IsNull)) and (mdCalvingHeader.FieldByName('DonorDamBreedID').AsInteger > 0) ) and
            ( (not(mdCalvingHeader.FieldByName('BullUsedBreedID').IsNull)) and (mdCalvingHeader.FieldByName('BullUsedBreedID').AsInteger > 0) ) then
            mdCalvingHeader.FieldByName('CalfBreedID').AsInteger :=
               GetCalfBreedID(mdCalvingHeader.FieldByName('BullUsedBreedID').AsInteger, mdCalvingHeader.FieldByName('DonorDamBreedID').AsInteger)
         else if ( (not(mdCalvingHeader.FieldByName('BullUsedBreedID').IsNull)) and (mdCalvingHeader.FieldByName('BullUsedBreedID').AsInteger > 0) ) and
                 ( (not(mdCalvingHeader.FieldByName('AnimalBreedID').IsNull)) and (mdCalvingHeader.FieldByName('AnimalBreedID').AsInteger > 0) ) then
            mdCalvingHeader.FieldByName('CalfBreedID').AsInteger :=
               GetCalfBreedID(mdCalvingHeader.FieldByName('BullUsedBreedID').AsInteger, mdCalvingHeader.FieldByName('AnimalBreedID').AsInteger);

         if ( FCountry = Ireland ) then
            begin
               lCalfBreedText.Caption := '';
               lCalfBreedText.Caption := GetBreedName(mdCalvingHeader.FieldByName('CalfBreedId').AsInteger);
            end;

         //   21/03/19 [V5.8 R8.3] /MK Change - Default the bCalfIsPedigree to false if sire doesn't have a breed - MO.
         bCalfIsPedigree := False;
         //   27/03/19 [V5.8 R8.3] /MK Change - Only check for cross breed if there is a CalfBreedID.
         if ( mdCalvingHeader.FieldByName('CalfBreedID').AsInteger > 0 ) then
            bCalfIsPedigree := ( not(BreedCodeIsCrossBreed(HerdLookup.BreedDetailsByID(mdCalvingHeader.FieldByName('CalfBreedID').AsInteger,'Code'))) );
         if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
            begin
               if ( not(mdCalvingDetail.State in dsEditModes) ) then
                  mdCalvingDetail.Edit;
               mdCalvingDetail.FieldByName('CalfIsPedigree').AsBoolean := bCalfIsPedigree;
               mdCalvingDetail.FieldByName('CalfBreedId').AsInteger := mdCalvingHeader.FieldByName('CalfBreedID').AsInteger;
            end;
         if ( mdCalvingDetail.RecordCount > 0 ) then
            for i := 1 to mdCalvingDetail.RecordCount do
               begin
                  mdCalvingDetail.RecNo := i;
                  mdCalvingDetail.Edit;
                  mdCalvingDetail.FieldByName('CalfIsPedigree').AsBoolean := bCalfIsPedigree;
                  mdCalvingDetail.FieldByName('CalfBreedId').AsInteger := mdCalvingHeader.FieldByName('CalfBreedId').AsInteger;
                  mdCalvingDetail.Post;
               end;
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('Error in changing calf breed.');
            end;
      end;
end;

procedure TfmCalvingEvent.ChangeHeaderPanelSize;
begin
   lGeneticDam.Top := 144;
   lGeneticDamNumberText.Top := 144;
   lCurrentGroup.Top := 180;
   dbCalvingGroupID.Top := 178;
   pCalvingHeader.Height := cDefCalvingHeaderHeight;

   lGeneticDamNumberText.Top := lGeneticDam.Top;
   lSireName.Visible := Def.Definition.dUsePedigree;
   lSireNameText.Visible := lSireName.Visible;
   lDamName.Visible := lSireName.Visible;
   lDamNameText.Visible := lSireName.Visible;
   lComment.Visible := WinData.GlobalSettings.CalvingShowCommentControl;
   dbCalvingHeaderComment.Visible := lComment.Visible;
   lCurrentGroup.Visible := WinData.GlobalSettings.CalvingShowGroupControls;
   dbCalvingGroupID.Visible := lCurrentGroup.Visible;

   FScreenHeight := cDefFormHeight;
   if ( (lGeneticDam.Visible) and (lCurrentGroup.Visible) and (not(lComment.Visible)) ) or
      ( (lGeneticDam.Visible) and (not(lCurrentGroup.Visible)) and (lComment.Visible) ) then
      begin
         lCurrentGroup.Top := ( lGeneticDam.Top + cDefSpaceBetweenControls );
         dbCalvingGroupID.Top := ( lGeneticDamNumberText.Top + 4 + cDefSpaceBetweenControls );
         pCalvingHeader.Height := cDefCalvingHeaderHeight;
      end
   else if ( (not(lGeneticDam.Visible)) and (lSireName.Visible) and (lCurrentGroup.Visible) and (not(lComment.Visible)) ) or
           ( (not(lGeneticDam.Visible)) and (not(lSireName.Visible)) and (lCurrentGroup.Visible) and (lComment.Visible) ) or
           ( (not(lGeneticDam.Visible)) and (not(lSireName.Visible)) and (lCurrentGroup.Visible) and (not(lComment.Visible)) ) then
      begin
         lCurrentGroup.Top := lGeneticDam.Top;
         dbCalvingGroupID.Top := lGeneticDamNumberText.Top;
         pCalvingHeader.Height := ( cDefCalvingHeaderHeight - cDefSpaceBetweenControls );
      end
   else if ( (not(lGeneticDam.Visible)) and (lSireName.Visible) and (not(lCurrentGroup.Visible)) and (lComment.Visible) ) then
      pCalvingHeader.Height := cDefCalvingHeaderHeight
   else if ( (not(lGeneticDam.Visible)) and (not(lSireName.Visible)) and (not(lCurrentGroup.Visible)) and (lComment.Visible) ) then
      pCalvingHeader.Height := ( cDefCalvingHeaderHeight - cDefSpaceBetweenControls );

   if ( (lCurrentGroup.Visible) and (lComment.Visible) ) then
      begin
         lComment.Top := lCurrentGroup.Top;
         dbCalvingHeaderComment.Top := dbCalvingGroupID.Top;
      end
   else if ( not(lComment.Visible) ) and ( not(lCurrentGroup.Visible) ) then
      begin
         if ( not(lGeneticDam.Visible) ) and ( not(lSireName.Visible) ) then
            pCalvingHeader.Height := cDefLowestCalvingHeaderHeight
         else if ( (lGeneticDam.Visible) or (lSireName.Visible) ) then
            pCalvingHeader.Height := ( cDefCalvingHeaderHeight - cDefSpaceBetweenControls );
      end
   else if ( lComment.Visible ) then
      begin
         if ( (lGeneticDam.Visible) and (not(lSireName.Visible)) ) then
            begin
               lComment.Top := lGeneticDam.Top;
               dbCalvingHeaderComment.Top := lGeneticDam.Top;
               pCalvingHeader.Height := ( pCalvingHeader.Height - cDefSpaceBetweenControls );
            end
         else if ( (lGeneticDam.Visible) and (lSireName.Visible) ) then
            begin
               lComment.Top := ( lDamName.Top + cDefSpaceBetweenControls );
               dbCalvingHeaderComment.Top := ( lDamNameText.Top + cDefSpaceBetweenControls );
            end
         else if ( (not(lGeneticDam.Visible)) and (not(lSireName.Visible)) ) then
            begin
               lComment.Top := lBullUsed.Top;
               dbCalvingHeaderComment.Top := dbBullUsed.Top;
               pCalvingHeader.Height := cDefLowestCalvingHeaderHeight;
            end;
      end;

   if ( pCalvingHeader.Height <> cDefCalvingHeaderHeight ) then
      begin
         FScreenHeight := ( FScreenHeight - cDefSpaceBetweenControls );
         if ( pCalvingHeader.Height = cDefLowestCalvingHeaderHeight ) then
            FScreenHeight := ( FScreenHeight - cDefSpaceBetweenControls );
      end;

   Height := FScreenHeight;

   Update;

   ChangeDetailPanelSize;
end;

procedure TfmCalvingEvent.ChangeDetailPanelSize;
begin
   lCalfColour.Visible := ( FCountry = NIreland ) or ( WinData.GlobalSettings.CalvingShowCalfColour );
   dbCalfColour.Visible := lCalfColour.Visible;
   lCalfNatIDNumOptions.Visible := ( FAddAmendOrDeleteCalving = ctAddCalving );
   lCalfNatIDNumOptionsText.Visible := lCalfNatIDNumOptions.Visible;

   lAssignToGroup.Visible := WinData.GlobalSettings.CalvingShowGroupControls;
   dbCalfGroupID.Visible := lAssignToGroup.Visible;
   lCalfBirthWeight.Visible := WinData.GlobalSettings.CalvingShowBirthWeightControls;
   dbCalfBirthWeight.Visible := lCalfBirthWeight.Visible;
   lKgsInfo.Visible := lCalfBirthWeight.Visible;
   CalvingDetailGridDBTableViewCalfBirthWeight.Visible := lCalfBirthWeight.Visible;

   if ( (not(lCalfBirthWeight.Visible)) and (lAssignToGroup.Visible) ) then
      begin
         lAssignToGroup.Top := ( dbCalfIsBreeding.Top + cDefSpaceBetweenControls );
         dbCalfGroupID.Top := lAssignToGroup.Top;
      end;

   FModifiedCalvingDetailHeight := cDefCalvingDetailHeight;
   if ( not(lCalfColour.Visible) ) or
      ( (not(lCalfColour.Visible)) and (not(lAssignToGroup.Visible)) ) then
      begin
         FModifiedCalvingDetailHeight := FModifiedCalvingDetailHeight - cDefSpaceBetweenControls;
         FScreenHeight := ( FScreenHeight - cDefSpaceBetweenControls );
      end;
   pCalvingDetail.Height := FModifiedCalvingDetailHeight;

   Height := FScreenHeight;

   Update;
end;

procedure TfmCalvingEvent.DeleteAssociatedDeathEvent(ACalfID : Integer);
var
   iDeathEventID : Integer;
begin
   if ( ACalfID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT E.ID');
            SQL.Add('FROM Events E');
            SQL.Add('WHERE (E.AnimalID = '+IntToStr(ACalfID)+')');
            SQL.Add('AND   (E.EventType = '+IntToStr(CSaleDeathEvent)+')');
            Open;
            if ( RecordCount = 0 ) then Exit;
            if ( Fields[0].AsInteger = 0 ) then Exit;
            iDeathEventID := Fields[0].AsInteger;
            Close;

            SQL.Clear;
            SQL.Add('DELETE FROM SalesDeaths');
            SQL.Add('WHERE EventID = '+IntToStr(iDeathEventID)+'');
            ExecSQL;

            SQL.Clear;
            SQL.Add('DELETE FROM Events');
            SQL.Add('WHERE ID = '+IntToStr(iDeathEventID)+'');
            ExecSQL;

            SQL.Clear;
            SQL.Add('UPDATE Animals');
            SQL.Add('SET InHerd = True');
            SQL.Add('WHERE ID = '+IntToStr(ACalfID)+'');
            ExecSQL;

         except
         end;

      finally
         Free;
      end;
end;

procedure TfmCalvingEvent.FillFExistingCalvingRecord;
var
   i,
   iDamID : Integer;

   function GetSireID ( ACalfID : Integer ) : Integer;
   begin
      Result := 0;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT SireID');
            SQl.Add('FROM Animals');
            SQL.Add('WHERE ID = '+IntToStr(ACalfID)+'');
            try
               Open;
               if ( Fields[0].AsInteger > 0 ) then
                  Result := Fields[0].AsInteger;
            except
            end;
         finally
            Free;
         end;
   end;

   function GetFeed_BatchGroupIDFromAnimalID (AAnimalID : Integer; AGroupType : String) : Integer;
   begin
      Result := 0;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT GroupID, DateJoined');
            SQL.Add('FROM GrpLinks');
            SQL.Add('WHERE (GroupID IN (SELECT ID FROM Grps WHERE Upper(GroupType) = "'+AGroupType+'"))');
            SQL.Add('AND   (AnimalID = '+IntToStr(AAnimalID)+')');
            SQL.Add('ORDER BY DateJoined DESC');
            try
               Open;
               if ( RecordCount > 0 ) then
                  if ( Fields[0].AsInteger > 0 ) then
                     Result := Fields[0].AsInteger;
            except
            end;
         finally
            Free;
         end;
   end;

begin
   if ( FEventID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.AnimalID, E.EventDate, E.EventDesc,');
         SQL.Add('       C.ID1 CalfID1, C.ID2 CalfID2, C.ID3 CalfID3, C.ID4 CalfID4, C.BirthType,');
         SQL.Add('       C.CalfDead1, C.CalfDead2, C.CalfDead3, C.CalfDead4,');
         SQL.Add('       C.CalfMortality1, C.CalfMortality2, C.CalfMortality3, C.CalfMortality4');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Calvings C ON (C.EventID = E.ID)');
         SQL.Add('WHERE E.ID = '+IntToStr(FEventID)+'');
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  if ( Fields[0].AsInteger > 0 ) then
                     iDamID := Fields[0].AsInteger;
                  if ( Fields[1].AsDateTime > 0 ) then
                     FExistingCalvingRecord.CREventDate := Fields[1].AsDateTime;
                  if ( Length(Fields[2].AsString) > 0 ) then
                     FExistingCalvingRecord.CREventDesc := Fields[2].AsString
                  else
                     FExistingCalvingRecord.CREventDesc := 'Calving';
                  if ( FieldByName('BirthType').AsInteger > 0 ) then
                     FExistingCalvingRecord.CRBirthType := FieldByName('BirthType').AsInteger;

                  for i := 1 to cMaxCalves do
                     begin
                        if ( FieldByName('CalfID'+IntToStr(i)).AsInteger > 0 ) then
                           begin
                              FExistingCalvingRecord.CRCalfAnimalID[i] := FieldByName('CalfID'+IntToStr(i)).AsInteger;
                              FExistingCalvingRecord.CRCalfDead[i] := FieldByName('CalfDead'+IntToStr(i)).AsBoolean;
                              FExistingCalvingRecord.CRCalfMortalityID[i] := FieldByName('CalfMortality'+IntToStr(i)).AsInteger;
                           end;
                     end;

                  for i := 1 to cMaxCalves do
                     begin
                        if ( FExistingCalvingRecord.CRCalfAnimalID[i] > 0 ) then
                           begin
                              FExistingCalvingRecord.CRSireID := GetSireID(FExistingCalvingRecord.CRCalfAnimalID[i]);
                              Break;
                           end;
                     end;
               end;
         except
         end;

         if ( iDamID > 0 ) then
            begin
               FExistingCalvingRecord.CRDamFeedGroupID := GetFeed_BatchGroupIDFromAnimalID(iDamID,'FEED');
               for i := 1 to Length(FExistingCalvingRecord.CRCalfAnimalID) do
                  if ( FExistingCalvingRecord.CRCalfAnimalID[i] > 0 ) then
                     begin
                        FExistingCalvingRecord.CRCalfFeed_BatchGroupID[i] := GetFeed_BatchGroupIDFromAnimalID(FExistingCalvingRecord.CRCalfAnimalID[i],'BATCH');
                        if ( FExistingCalvingRecord.CRCalfFeed_BatchGroupID[i] = 0 ) then
                           FExistingCalvingRecord.CRCalfFeed_BatchGroupID[i] := GetFeed_BatchGroupIDFromAnimalID(FExistingCalvingRecord.CRCalfAnimalID[i],'FEED');
                     end;
            end;
      finally
         Free;
      end;
end;

function TfmCalvingEvent.NatIDNumAlreadyExists ( ANatIDNum : String ) : Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ((NatIDNum = "'+ANatIDNum+'")');
         SQL.Add('        OR (SearchNatID LIKE "%'+StripAllSpaces(ANatIDNum)+'%"))');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
         end;
      finally
         Free;
      end;
end;

function TfmCalvingEvent.IsDeletedFromCalving ( ANatIDNum : String ) : Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ((NatIDNum = "'+ANatIDNum+'")');
         SQL.Add('        OR (SearchNatID LIKE "%'+StripAllSpaces(ANatIDNum)+'%"))');
         SQL.Add('AND   (AnimalDeleted = TRUE)');
         //   02/02/16 [V5.5 R2.5] /MK Change - Check for if DamID is Null and HerdID is Null is not sufficient enough to check for deleted calves.
         //                                     Instead check if animal is deleted and animalid exists in DeletedCalvings table.  
         SQL.Add('AND   ((ID IN (SELECT CalfID1');
         SQL.Add('  		 FROM DeletedCalvings)');
         SQL.Add('	  OR ID IN (SELECT CalfID2');
         SQL.Add('		    FROM DeletedCalvings)');
         SQL.Add('	  OR ID IN (SELECT CalfID3');
         SQL.Add('		    FROM DeletedCalvings)');
         SQL.Add('	  OR ID IN (SELECT CalfID4');
         SQL.Add('  		    FROM DeletedCalvings)))');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
         end;
      finally
         Free;
      end;
end;

function TfmCalvingEvent.CalfNoAlreadyExists(ACalfNo: String): Boolean;
begin
   Result := False;
   if ( IsDeletedFromCalving(mdCalvingDetail.FieldByName('CalfNatID').AsString) ) then Exit;
   ACalfNo := UpperCase(ACalfNo);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE Upper(AnimalNo) = "'+ACalfNo+'"');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
         end;
      finally
         Free;
      end;
end;

function TfmCalvingEvent.IsAbortedTag(ACalfNatID: String): Boolean;
begin
  Result := ( Copy(UpperCase(StripAllSpaces(ACalfNatID)),0,4) = 'ABOR' );
end;

function TfmCalvingEvent.GetNatIDNumHerdIdentifier(AHerdID: Integer): string;
var
   tResult : string;
   i : Integer;
begin
   Result := '';
   tResult := Trim(UserDefaultHerdIdentifier);
   if ( FCountry = Ireland ) then
      begin
         tResult := 'IE '+tResult;
         Insert(' ',tResult, 6);
      end
   else if ( FCountry = NIreland ) then
      tResult := 'UK 9 '+tResult;
   if ( Length(tResult) > 0 ) then
      Result := tResult
   else
      MessageDlg('Error creating herd identifier for tag number.'+cCRLF+
                 'Contact Kingswood.',mtError,[mbOK],0);
end;

function TfmCalvingEvent.GetAnimalNoFromNatIDNum(ANatIDNum : String) : String;
var
   sHerdIdentifier,
   sNewAnimalNo : String;
   iPos : Integer;
begin
   Result := '';
   if ( Length(ANatIDNum) = 0 ) then Exit;
   if ( Length(mdCalvingDetail.FieldByName('CalfAnimalNo').AsString) = 0 ) then
      begin
         if ( WhatStyleNatID(ANatIDNum, False) in [StyleEID,Style1999] ) then
            begin
               sNewAnimalNo := ANatIDNum;
               sNewAnimalNo := StripAllSpaces(sNewAnimalNo);
               sNewAnimalNo := Copy(sNewAnimalNo, Length(sNewAnimalNo)-3, 4);
            end
         else if ( IsNINatID(ANatIDNum) ) then
            begin
               sNewAnimalNo := StripAllSpaces(ANatIDNum);
               sHerdIdentifier := UserDefaultHerdIdentifier;
               if ( sHerdIdentifier <> '' ) then
                  begin
                     iPos := Pos(sHerdIdentifier,sNewAnimalNo);
                     if ( iPos > 0 ) then
                        begin
                           sNewAnimalNo := Copy(sNewAnimalNo, iPos + Length(sHerdIdentifier), MaxInt);
                           if ( Length(sNewAnimalNo) > 0 ) then
                              Delete(sNewAnimalNo, Length(sNewAnimalNo), 1);
                        end;
                  end;
            end;
         if ( CalfNoAlreadyExists(sNewAnimalNo) ) then
            MessageDlg(Format('The program generated calf number "%s" cannot be used.'+cCRLF+
                       'Calf number (F.B./Jumbo) "%s" is already in use.',[sNewAnimalNo,sNewAnimalNo]), mtInformation,[mbOK],0)
         else
            mdCalvingDetail.FieldByName('CalfAnimalNo').AsString := sNewAnimalNo;
      end;
end;

function TfmCalvingEvent.GetCrossBreedID (ABreedID : Integer) : Integer;
var
   sBreedCode : String;

   procedure AddBreed ( ABreedCode : String );
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('INSERT INTO Breeds (Code, Name, GestationPeriod, EligibleForPremium, InUse)');
            SQL.Add('VALUES ("'+ABreedCode+'", "'+ABreedCode+'", 283, FALSE, TRUE)');
            try
               ExecSQL;
            except
            end;
         finally
            Free;
         end;
   end;

begin
   Result := 0;
    with TQuery.Create(nil) do
       try
          try
             DatabaseName := AliasName;
             SQL.Clear;
             SQL.Add('SELECT ID, Code');
             SQL.Add('FROM Breeds');
             SQL.Add('WHERE ID = '+IntToStr(ABreedID)+'');
             Open;
             if ( RecordCount = 0 ) then Exit;
             sBreedCode := UpperCase(Fields[1].AsString);
             if ( Length(sBreedCode) > 0 ) then
                begin
                   if ( sBreedCode[Length(sBreedCode)] = 'X' ) then
                      Result := Fields[0].AsInteger
                   else
                      begin
                         Close;
                         SQL.Clear;
                         SQL.Add('SELECT ID');
                         SQL.Add('FROM Breeds');
                         SQL.Add('WHERE Code = "'+sBreedCode+'X'+'"');
                         Open;
                         if ( Fields[0].AsInteger > 0 ) then
                            Result := Fields[0].AsInteger;
                         Close;
                         //   06/11/15 [V5.5 R0.3] /MK Change - Change made to add the cross breed if it doesn't exists.
                         if ( Result = 0 ) then
                            begin
                               AddBreed(UpperCase(sBreedCode+'X'));
                               Open;
                               if ( Fields[0].AsInteger > 0 ) then
                                  Result := Fields[0].AsInteger;
                            end;
                      end;
                end;
             if ( Active ) then
             Close;
          except
          end;
       finally
          Free;
       end;
end;

function TfmCalvingEvent.GetCalfBreedID (ASireBreedID,  ADamBreedID: Integer): Integer;
var
   sSireBreedCode,
   sDamBreedCode : String;
begin
   Result := 0;
   if ( ASireBreedID = 0 ) and ( ADamBreedID = 0 ) then Exit;
   try
      //   27/03/19 [V5.8 R8.3] /MK Change - Exit out of here if no SireBreedCode.
      sSireBreedCode := UpperCase(HerdLookup.BreedDetailsByID(ASireBreedID,'Code'));
      if ( Length(sSireBreedCode) = 0 ) or ( sSireBreedCode = '0' ) then Exit;
      sDamBreedCode := UpperCase(HerdLookup.BreedDetailsByID(ADamBreedID,'Code'));
      if ( Length(sDamBreedCode) = 0 ) or ( sDamBreedCode = '0' ) then Exit;

      //   28/06/18 [V5.8 R0.6] /MK Change - If dam is HO and sire is FR then calf is FR OR if dam is FR and sire is HO then calf is FR - GL/SP request.
      if ( (sSireBreedCode = 'HO') and (sDamBreedCode = 'FR') or
           (sSireBreedCode = 'FR') and (sDamBreedCode = 'HO') ) then
         begin
            if ( sSireBreedCode = 'FR' ) then
               Result := ASireBreedID
            else if ( sDamBreedCode = 'FR' ) then
               Result := ADamBreedID;
         end
      else if ( sSireBreedCode <> sDamBreedCode ) then
         Result := GetCrossBreedID(ASireBreedID)
      else
         Result := ASireBreedID;
   except
      on e : Exception do
         begin
            ApplicationLog.LogException(e);
            ApplicationLog.LogError(Format('Error in GetCalfBreedID SireBreedID %d DamBreedID %d.',[ASireBreedID, ADamBreedID]));
         end;
   end;
end;

function TfmCalvingEvent.GetBreedName ( ABreedID : Integer ) : String;
begin
   Result := '';
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Name');
         SQL.Add('FROM Breeds');
         SQL.Add('WHERE ID = :BreedID');
         Params[0].AsInteger := ABreedID;
         try
            Open;
            Result := Fields[0].AsString;
         except
         end;
      finally
         Free;
      end;
end;

function TfmCalvingEvent.GetProjectedCalfType (AAnimalID, AAnimalLactNo : Integer ) : String;
var
   qPDEvents : TQuery;
begin
   Result := '';
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.EventDate, P.CalfType');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN PregnancyDiag P ON (P.EventID = E.ID)');
         SQL.Add('WHERE (E.EventType = '+IntToStr(CPregDiagEvent)+')');
         SQL.Add('AND   (E.AnimalID = '+IntToStr(AAnimalID)+')');
         SQL.Add('AND   (E.AnimalLactNo = '+IntToStr(AAnimalLactNo)+')');
         SQL.Add('ORDER BY E.EventDate DESC');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            First;
            Result := Fields[1].AsString;
         except
         end;
      finally
         Free;
      end;
end;

function TfmCalvingEvent.ValidateCalfNatIDStr (ACalfNatID: String): String;
var
   UpperTxt : String;
   FormattedStr : String;
   nPos : Integer;
begin
   Result := '';
   UpperTxt := UpperCase(ACalfNatID);
   FormattedStr := '';
   if ( not(CheckNatID(UpperTxt, FormattedStr, TRUE)) ) then   //Checks for a valid NatID Number format
      raise ErrorMsg.CreateFmt(cInvalid_NatIdNo,[nil])
   else if ( IsNINatID(UpperTxt)) then
      if ( not(CheckNINatID(UpperTxt, FormattedStr)) ) then
         raise ErrorMsg.CreateFmt(cInvalid_NatIdNo,[nil]);
   if ( Length(FormattedStr) > 0 ) then
      Result := FormattedStr;
end;

function TfmCalvingEvent.GetNatIDMask : String;
var
   sHerdIdentifier,
   NewMask : string;
begin
   Result := '';
   sHerdIdentifier := UserDefaultHerdIdentifier;
   if ( FCountry = Ireland ) then
      begin
         NewMask := 'IE 00 00000';
         if ( Length(NewMask) = 0 ) or ( Length(sHerdIdentifier) = 0 ) then Exit;
         if ( StringAllNumbers(sHerdIdentifier) ) then
            begin
               ReplaceChar(NewMask, sHerdIdentifier[1], 4);
               ReplaceChar(NewMask, sHerdIdentifier[2], 5);
               ReplaceChar(NewMask, sHerdIdentifier[3], 7);
               ReplaceChar(NewMask, sHerdIdentifier[4], 8);
               ReplaceChar(NewMask, sHerdIdentifier[5], 9);
               ReplaceChar(NewMask, sHerdIdentifier[6], 10);
               ReplaceChar(NewMask, sHerdIdentifier[7], 11);
            end;
         if ( Length(NewMask) > 0 ) then
            Result := NewMask
      end
   else if ( FCountry = NIreland ) then
      begin
         NewMask := 'UK 9 000000';
         if ( Length(NewMask) = 0 ) or ( Length(sHerdIdentifier) = 0 ) then Exit;
         if ( StringAllNumbers(sHerdIdentifier) ) then
            begin
               ReplaceChar(NewMask, sHerdIdentifier[1], 6);
               ReplaceChar(NewMask, sHerdIdentifier[2], 7);
               ReplaceChar(NewMask, sHerdIdentifier[3], 8);
               ReplaceChar(NewMask, sHerdIdentifier[4], 9);
               ReplaceChar(NewMask, sHerdIdentifier[5], 10);
               ReplaceChar(NewMask, sHerdIdentifier[6], 11);
               ReplaceChar(NewMask, sHerdIdentifier[7], 12);
            end;
         if ( Length(NewMask) > 0 ) then
            Result := NewMask
      end;
end;

function TfmCalvingEvent.GetPedigreeName (AAnimalID : Integer) : String;
begin
   Result := '';
   if ( AAnimalID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Name');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID = '+IntToStr(AAnimalID)+'');
         try
            Open;
            if ( Length(Fields[0].AsString) > 0 ) then
               Result := Fields[0].AsString;
         except
         end;
      finally
         Free;
      end;
end;

function TfmCalvingEvent.GetSearchField : String;
begin
   Result := 'AnimalNo';
   with TQuery.Create(nil) do
      try
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT SearchField');
            SQL.Add('FROM Owners');
            SQL.Add('WHERE ID = '+IntToStr(UserDefaultHerdID)+'');
            Open;
            if ( Fields[0].Value <> Null ) then
               Result := Fields[0].AsString
            else
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT SearchField');
                  SQL.Add('FROM Owners');
                  SQL.Add('WHERE ID = '+IntToStr(NoneHerdID)+'');
                     Open;
                     if ( Fields[0].Value <> Null ) then
                        Result := Fields[0].AsString
               end;
         except
         end;
      finally
         Free;
      end;
end;

function TfmCalvingEvent.GetGeneticDamNumber (ACalvingDate : TDateTime): String;
var
   qEmbryoEvent : TQuery;
begin
   Result := '';
   if ( mdCalvingHeader.FieldByName('AnimalID').AsInteger = 0 ) then Exit;

   if ( not(mdCalvingHeader.State in dsEditModes) ) then
      mdCalvingHeader.Edit;
   mdCalvingHeader.FieldByName('DonorDamID').AsInteger := 0;

   qEmbryoEvent := TQuery.Create(nil);
   with qEmbryoEvent do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.AnimalID, E.AnimalLactNo, E.EventDate AS LastService,');
         SQL.Add('	 G.Description AS ServiceType,  A.AnimalNo AS ServiceBull ,');
         SQL.Add('	 S.GeneticDam AS GenDamID, AA.AnimalNo AS GenDamAnimalNo, ');
         SQL.Add('       AA.Name AS GenDamName, AA.NatIDNum AS GenDamNatID,');
         SQL.Add('       AA.PrimaryBreed AS GenDamBreedID');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Services S ON (S.EventID = E.ID)');
         SQL.Add('LEFT JOIN GenLook G  ON (G.ID = S.ServiceType)');
         SQL.Add('LEFT JOIN Animals A  ON (A.ID = S.ServiceBull)');
         SQL.Add('LEFT JOIN Animals AA ON (AA.ID = S.GeneticDam)');
         SQL.Add('WHERE E.EventType = '+IntToStr(cServiceEvent));
         SQL.Add('AND   E.AnimalID = '+IntToStr(FSelectedDam.ID));
         SQL.Add('ORDER BY E.EventDate desc');
         try
            Open;
            First;
            if ( RecordCount > 0 ) then
               begin
                  // Check last service is within one year and genetic dam was used.
                  if ( (ACalvingDate - FieldByName('LastService').AsDateTime) < 365 ) and
                       ( FieldByName('GenDamID').AsInteger > 0 ) then
                     // assign genetic dam details
                     begin
                        if ( Length(FieldByName('GenDamName').AsString) > 0 ) then
                           lDamNameText.Caption := FieldByName('GenDamName').AsString + ' (Donor Dam)';
                        lGeneticDam.Visible := ( FieldByName('GenDamID').AsInteger > 0 );
                        if ( lGeneticDam.Visible ) then
                           begin
                              //   24/09/15 [V5.4 R8.8] /MK Bug Fix - If Genentic Dam Animal No does not exist then use Genetic Dam NatID.
                              lGeneticDamNumberText.Visible := lGeneticDam.Visible;
                              if ( Length(FieldByName('GenDamAnimalNo').AsString) > 0 ) then
                                 lGeneticDamNumberText.Caption := FieldByName('GenDamAnimalNo').AsString
                              else if ( Length(FieldByName('GenDamNatID').AsString) > 0 ) then
                                 lGeneticDamNumberText.Caption := FieldByName('GenDamNatID').AsString;
                              mdCalvingHeader.FieldByName('DonorDamID').AsInteger := FieldByName('GenDamID').AsInteger;
                              mdCalvingHeader.FieldByName('DonorDamBreedID').AsInteger := FieldByName('GenDamBreedID').AsInteger;
                           end;
                     end;
               end;
         except
         end;
      finally
         Free;
      end;
end;

procedure TfmCalvingEvent.ValidateCalving;
var
   dDamSaleDate : TDateTime;
begin
   ApplicationLog.LogDebugMessage('ValidateCalving Start');

   ValidateAnimalDetails();

   ApplicationLog.LogDebugMessage('Check age of dam 4 month');
   if ( dbCalvingDate.Date <= IncMonth(FSelectedDam.DateOfBirth,4)) then
      begin
         MessageDlg('Calving date is too far in the past. Please check the dams date of birth.',mtError,[mbOK],0);
         dbCalvingDate.SetFocus;
         SysUtils.Abort;
      end;

   ApplicationLog.LogDebugMessage('Check age of dam 12 18 & 24 month');
   if ( FSelectedDam.DateOfBirth > IncMonth(dbCalvingDate.Date, -12)) then
      begin
         dbCalvingDate.SetFocus;
         raise ErrorMsg.CreateFmt(cCalvingAnimalUnder12Mths,[FSelectedDam.NatIdNum, 12, FormatDate(dbCalvingDate.Date,dsIrish)]);
      end
   else if ( FSelectedDam.DateOfBirth > IncMonth(dbCalvingDate.Date, -18)) then
      begin
         if MessageDlg(Format(cCalvingAnimalUnder18Mths,[FSelectedDam.NatIdNum, 18, FormatDate(dbCalvingDate.Date,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
            Abort;
      end
   else if ( FSelectedDam.DateOfBirth > IncMonth(dbCalvingDate.Date, -22)) then
      begin
         if MessageDlg(Format(cCalvingAnimalUnder22Mths,[FSelectedDam.NatIdNum, 22, FormatDate(dbCalvingDate.Date,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
            begin
               dbCalvingDate.SetFocus;
               Abort;
            end;
      end
   else if ( FSelectedDam.DateOfBirth > IncMonth(dbCalvingDate.Date, -24)) then
      begin
         if MessageDlg(Format(cCalvingAnimalUnder24Mths,[FSelectedDam.NatIdNum, 24, FormatDate(dbCalvingDate.Date,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
            begin
               dbCalvingDate.SetFocus;
               Abort;
            end;
      end;

   dDamSaleDate := WinData.BreedingDataHelper.GetLastEventDate(FSelectedDam.Id, CSaleDeathEvent);
   if ( dDamSaleDate > 0 ) and ( dbCalvingDate.Date > dDamSaleDate ) then
      begin
         MessageDlg(Format('Calving date, %s, cannot be after the Dam''s sale date, %s.',[FormatDate(dbCalvingDate.Date,dsIrish),FormatDate(dDamSaleDate,dsIrish)]),mtError,[mbOK],0);
         dbCalvingDate.Date := Date;
         SysUtils.Abort;
      end;

   //   08/03/16 [V5.5 R5.4] /MK Bug Fix - Check to see if the Calving Interval i.e. days between this calving and last calving date, was checked.
   ApplicationLog.LogDebugMessage('CheckCalvingInterval');
   if ( not(FCalvingIntervalChecked) ) then
      CheckCalvingInterval;

   ApplicationLog.LogDebugMessage('Valid DamID Check');
   if ( mdCalvingHeader.FieldByName('AnimalID').AsInteger <= 0 ) then
      begin
         MessageDlg('A valid dam must be selected before saving this calving.',mtWarning,[mbOK],0);
         dbBullUsed.SetFocus;
         SysUtils.Abort;
      end;

   if ( FCountry = Ireland ) then
      begin
         ApplicationLog.LogDebugMessage('Valid Sire Check');
         if ( mdCalvingHeader.FieldByName('BullUsed').AsInteger <= 0 ) then
            begin
               MessageDlg('A valid sire must be selected before saving this calving.',mtWarning,[mbOK],0);
               dbBullUsed.SetFocus;
               SysUtils.Abort;
            end;

         ApplicationLog.LogDebugMessage('Valid Breed Check');
         if ( mdCalvingHeader.FieldByName('CalfBreedId').AsInteger <= 0 ) then
            begin
               //   26/08/19 [V5.9 R0.1] /MK Change - Format message and make it more descriptive of what the issue with the bull is i.e no breed selected - GL/Ellen Daly.
               MessageDlg(Format('No breed found for the selected bull "%s".',[dbBullUsed.Text]),mtError,[mbOK],0);
               dbBullUsed.SetFocus;
               SysUtils.Abort;
            end
      end;

   ApplicationLog.LogDebugMessage('ValidateCalving End');
end;

procedure TfmCalvingEvent.CreateCalving;
var
   ECalving : TCalvingEvent;
   DeathEvent : TSaleDeathEvent;
   ENewIDEvent : TNewIDEvent;
   CalfIndex : Integer;
   FormattedStr,
   sNewComment,
   UpperTxt : String;
   i,
   iCalfID,
   iCalfLactNo,
   iCalfHerdID : Integer;
   qCalf : TQuery;
   GroupType : TGroupType;
begin
   try
      Screen.Cursor := crHourGlass;

      iCalfID := 0;
      iCalfLactNo := 0;
      iCalfHerdID := 0;

      CalfIndex := 1;
      if ( ECalving <> nil ) then
         FreeAndNil(ECalving);

      ECalving := TCalvingEvent.Create('NEWCLVEV');
      ECalving.Database.StartTransaction;
      try
         try
            mdCalvingDetail.DisableControls;
            for i := 1 to mdCalvingDetail.RecordCount do
               begin
                  mdCalvingDetail.RecNo := i;
                  if ( (not(mdCalvingDetail.FieldByName('CalfAnimalID').IsNull)) and (mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger > 0) ) and
                     ( IsDeletedFromCalving(mdCalvingDetail.FieldByName('CalfNatID').AsString) ) then
                        begin
                           UndeleteCalfRecord();
                           ECalving.CalfRecord.ID := mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger;
                        end
                  else
                     begin
                        ECalving.CalfRecord.Add;
                        ECalving.CalfRecord.ValidateIdTags := ( FCountry in [Ireland, NIreland] );

                        ECalving.CalfRecord.HerdID := mdCalvingHeader.FieldByName('AnimalHerdID').AsInteger;

                        ECalving.CalfRecord.NatIDNum := mdCalvingDetail.FieldByName('CalfNatID').AsString;

                        //   07/11/17 [V5.7 R4.3] /MK Change - If tag is a 372 tag and live then set TransponderNo/ElectronicID to tag without spaces.
                        if ( Is372Tag(mdCalvingDetail.FieldByName('CalfNatID').AsString) ) and
                           ( not(mdCalvingDetail.FieldByName('CalfDead').AsBoolean) ) then
                           ECalving.CalfRecord.TransponderNo := StripAllSpaces(mdCalvingDetail.FieldByName('CalfNatID').AsString);

                        //   22/02/16 [V5.5 R4.1] /MK Bug Fix - Always trim the calf animal number before creating the animal record - SP request.
                        ECalving.CalfRecord.AnimalNo := Trim(mdCalvingDetail.FieldByName('CalfAnimalNo').AsString);

                        ECalving.CalfRecord.DateOfBirth := mdCalvingHeader.FieldByName('CalvingDate').AsDateTime;
                        ECalving.CalfRecord.Sex := mdCalvingDetail.FieldByName('CalfSex').AsString;

                        if ( FCountry = Ireland ) then
                           ECalving.CalfRecord.PrimaryBreed := mdCalvingHeader.FieldByName('CalfBreedID').AsInteger
                        else
                           begin
                              if ( (not(mdCalvingDetail.FieldByName('CalfBreedID').IsNull)) and (mdCalvingDetail.FieldByName('CalfBreedID').AsInteger > 0) ) then
                                 ECalving.CalfRecord.PrimaryBreed := mdCalvingDetail.FieldByName('CalfBreedID').AsInteger
                              else if ( (not(mdCalvingHeader.FieldByName('CalfBreedID').IsNull)) and (mdCalvingHeader.FieldByName('CalfBreedID').AsInteger > 0) ) then
                                 ECalving.CalfRecord.PrimaryBreed := mdCalvingHeader.FieldByName('CalfBreedID').AsInteger;
                           end;

                        ECalving.CalfRecord.Colour := mdCalvingDetail.FieldByName('CalfColour').AsInteger;
                        ECalving.CalfRecord.DamID := mdCalvingHeader.FieldByName('AnimalID').AsInteger;
                        ECalving.CalfRecord.SireID := mdCalvingHeader.FieldByName('BullUsed').AsInteger;
                        ECalving.CalfRecord.DonorDamID := mdCalvingHeader.FieldByName('DonorDamID').AsInteger;
                        ECalving.CalfRecord.Breeding := mdCalvingDetail.FieldByName('CalfIsBreeding').AsBoolean;
                        ECalving.CalfRecord.Pedigree := mdCalvingDetail.FieldByName('CalfIsPedigree').AsBoolean;
                        ECalving.CalfRecord.Name := mdCalvingDetail.FieldByName('CalfPedigreeName').AsString;
                        ECalving.CalfRecord.BirthWeight := mdCalvingDetail.FieldByName('CalfBirthWeight').AsFloat;
                        ECalving.CalfRecord.IsSynchronized := False;
                        ECalving.CalfRecord.Save;
                     end;

                  ECalving.CalfID[CalfIndex] := ECalving.CalfRecord.ID;
                  ECalving.CalfReg[CalfIndex] := ( IsAbortedTag(mdCalvingDetail.FieldByName('CalfNatID').AsString) and (FCountry = Ireland) );
                  if ( mdCalvingDetail.FieldByName('CalfDead').AsBoolean ) then
                     begin
                        ECalving.CalfMortality[CalfIndex] := mdCalvingDetail.FieldByName('CalfMortality').AsInteger;
                        ECalving.CalfDead[CalfIndex] := True;
                     end;

                  if ( not(mdCalvingDetail.State in [dsInsert, dsEdit]) ) then
                     mdCalvingDetail.Edit;
                  mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger := ECalving.CalfRecord.ID;
                  mdCalvingDetail.FieldByName('CalfLactNo').AsInteger := ECalving.CalfRecord.LactNo;

                  if ( FInputNatIDStyle = cInputNatIDStyle_ListInput ) then
                     try
                        HerdLookup.RemoveFromTagStore(mdCalvingHeader.FieldByName('AnimalHerdID').AsInteger,
                                                      mdCalvingDetail.FieldByName('CalfNatID').AsString);
                     except
                        on e : exception do
                           begin
                              MessageDlg(cErrorContact_2 + cCRLFx2 + E.Message,mtError,[mbOk],0);
                           end;
                     end;

                  Inc(CalfIndex);
               end;
            mdCalvingDetail.EnableControls;

            ECalving.Append;
            ECalving.AnimalID := mdCalvingHeader.FieldByName('AnimalID').AsInteger;
            ECalving.EventDate := mdCalvingHeader.FieldByName('CalvingDate').AsDateTime;
            ECalving.AnimalLactNo := mdCalvingHeader.FieldByName('AnimalLactNo').AsInteger+1;
            ECalving.AnimalHerdID := mdCalvingHeader.FieldByName('AnimalHerdID').AsInteger;
            if ( Length(mdCalvingHeader.FieldByName('CalvingComment').AsString) > 0 ) then
               begin
                  sNewComment := mdCalvingHeader.FieldByName('CalvingComment').AsString;
                  if ( Pos('CALVING',UpperCase(mdCalvingHeader.FieldByName('CalvingComment').AsString)) > 0 ) then
                     case mdCalvingDetail.RecordCount of
                        2 : sNewComment := 'Calving/Twin';
                        3 : sNewComment := 'Calving/Triplet';
                        4 : sNewComment := 'Calving/Quad';
                     end;
               end;
            ECalving.EventComment := sNewComment;
            ECalving.EventSource := sNEW_CALVINGEVENTSCR;
            ECalving.BirthType := mdCalvingHeader.FieldByName('CalvingSurvey').AsInteger;
            ECalving.Post;

            FAddedCalvingEventID := ECalving.EventID;

         except
            on e : Exception do
               begin
                  if ECalving.Database.InTransaction then
                     ECalving.Database.Rollback;
                  ApplicationLog.LogException(e);
                  ApplicationLog.LogError('Calving Event - Error creating calving');
                  MessageDlg(cErrorCalvingCreatingCalving,mtError,[mbOK],0);
               end;
         end;
      finally
         if ( ECalving <> nil ) then
            begin
               if ECalving.Database.InTransaction then
                  ECalving.Database.Commit;
               FCalvingSaved := True;
               FreeAndNil(ECalving);
            end;
      end;

      if ( mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger = 1 ) then
         ApplicationLog.LogError('Failed to create ID for calf of dam '+IntToStr(FSelectedDam.Id));

      //   05/12/17 [V5.7 R5.9] /MK Change - Add progress string of what sub event was created last. Added this progress string to exception error.
      //   26/02/18 [V5.7 R8.2] /MK Change - Seperated the sub events into different sections that individually store a log in the log file if an error occurs.

      // Calving Sub Events - Groups, New ID Allocation, Weighing Events & Death Event.
      mdCalvingDetail.First;
      mdCalvingDetail.DisableControls;
      while ( not(mdCalvingDetail.Eof) ) do
         begin
            if ( (not(mdCalvingDetail.FieldByName('CalfAnimalID').IsNull)) and (mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger > 0) ) then
               begin
                  if ( not(mdCalvingDetail.FieldByName('CalfGroupID').IsNull) ) and ( mdCalvingDetail.FieldByName('CalfGroupID').AsInteger > 0 ) then
                     try
                        WinData.GroupManager.AddToGroup(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger,
                                                        mdCalvingDetail.FieldByName('CalfGroupID').AsInteger,
                                                        False,
                                                        mdCalvingHeader.FieldByName('CalvingDate').AsDateTime,
                                                        mdCalvingDetail.FieldByName('CalfNatID').AsString);
                     except
                        on e : Exception do
                           ApplicationLog.LogError('Calving - Error adding calf to group.');
                     end;

                  if ( Length(mdCalvingDetail.FieldByName('CalfAnimalNo').AsString) > 0 ) and ( FCountry = Ireland ) then
                     begin
                        ENewIDEvent := TNewIDEvent.Create('NEWIDCLV');
                        with ENewIDEvent do
                           try
                              try
                                 Append;
                                 EventType := TNewID;
                                 EventDate := Date;
                                 AnimalID := mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger;
                                 AnimalLactNo := mdCalvingDetail.FieldByName('CalfLactNo').AsInteger;
                                 AnimalHerdID := UserDefaultHerdID;
                                 EventSource := sNEW_CALVINGEVENTSCR;
                                 Post;
                              except
                                 on e : Exception do
                                    begin
                                       Cancel;
                                       ApplicationLog.LogError('Error creating New ID Allocation event for calf '+IntToStr(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger));
                                    end;
                              end;
                           finally
                              FreeAndNil(ENewIDEvent);
                           end;
                     end;

                  if ( mdCalvingDetail.FieldByName('CalfBirthWeight').AsFloat > 0 ) then
                     try
                        CreateWeighingEvent(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger,
                                            UserDefaultHerdID,
                                            mdCalvingHeader.FieldByName('CalvingDate').AsDateTime,
                                            mdCalvingDetail.FieldByName('CalfBirthWeight').AsFloat);
                     except
                        on e : Exception do
                           ApplicationLog.LogError('Calving - Error creating weighing event for calf '+IntToStr(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger));
                     end;

                  if ( mdCalvingDetail.FieldByName('CalfDead').AsBoolean ) then
                     begin
                        if ( (WinData.EventDataHelper.GetAnimalDeathEventDate(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger) = 0) and
                             (WinData.EventDataHelper.GetAnimalSaleEventDate(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger) = 0) ) then
                           begin
                              DeathEvent := TSaleDeathEvent.Create('CALFDEATH');
                              with DeathEvent do
                                 try
                                    try
                                       Append;
                                       EventType := TSaleDeath;
                                       AnimalID := mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger;
                                       AnimalLactNo := 0;
                                       AnimalHerdID := mdCalvingHeader.FieldByName('AnimalHerdID').AsInteger;
                                       EventDate := mdCalvingHeader.FieldByName('CalvingDate').AsDateTime;
                                       EventComment := 'Died at birth';
                                       Sold := False;
                                       Customer := mdCalvingDetail.FieldByName('CalfDisposalPlace').AsInteger;
                                       Notified := False;
                                       PreSale := False;
                                       Slaughter := False;
                                       EventSource := sNEW_CALVINGEVENTSCR;
                                       if ( FCountry = England ) then
                                          CTSReg := True;
                                       Post;
                                    except
                                       on e : Exception do
                                          begin
                                             Cancel;
                                             ApplicationLog.LogError('Error saving death event for calf '+IntToStr(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger));
                                          end;
                                    end;
                                 finally
                                    FreeAndNil(DeathEvent);
                                 end;
                           end
                     end;
               end;
            mdCalvingDetail.Next;
         end;
      mdCalvingDetail.EnableControls;

      //   09/11/15 [V5.5 R0.4] /MK Bug Fix - Do not set AllowDeletion boolean as cow was being removed from group if it was already in the group selected.
      if ( not(mdCalvingHeader.FieldByName('CalvingGroupID').IsNull) ) and ( mdCalvingHeader.FieldByName('CalvingGroupID').AsInteger > 0 ) then
         begin
            try
               WinData.GroupManager.AddToGroup(FSelectedDam.Id,
                                               mdCalvingHeader.FieldByName('CalvingGroupID').AsInteger,
                                               False,
                                               mdCalvingHeader.FieldByName('CalvingDate').AsDateTime,
                                               FSelectedDam.NatIdNum);
            except
               on e : Exception do
                  ApplicationLog.LogError('Calving - Error moving Dam to group' + ' - ' + e.Message);
            end;

            try
               GroupType := WinData.GroupManager.GetGroupIDGroupType(mdCalvingHeader.FieldByName('CalvingGroupID').AsInteger);
            except
               on e : Exception do
                  ApplicationLog.LogError('Error retreiving group type for GroupID : '+IntToStr(mdCalvingHeader.FieldByName('CalvingGroupID').AsInteger));
            end;

            //   22/09/17 [V5.7 R3.0] /MK Change - If Dam group is a feed group then start the cow on feed regime, if any, on calving date.
            if ( GroupType = gtFeed ) then
               try
                  WinData.FeedManager.CreateFeedsForAnimal(FSelectedDam.Id,
                                                           mdCalvingHeader.FieldByName('CalvingGroupID').AsInteger,
                                                           mdCalvingHeader.FieldByName('CalvingDate').AsDateTime);
               except
                  on e : Exception do
                     ApplicationLog.LogError('Calving - Error creating feed events.');
               end;
         end;

      //   14/01/16 [V5.5 R3.1] /MK Bug Fix - Program was not prompting the user to enter a condition score after the calving is saved - Carl Farrar (4378) reported
      ShowConditionScoreOrHealthPrompt;

   finally
      Screen.Cursor := crDefault;
      Close;
   end;
end;

procedure TfmCalvingEvent.UpdateCalving;
var
   EDeathEvent : TSaleDeathEvent;
   CalfRecord : TAnimalRecord;
   ENewIDEvent : TNewIDEvent;
   i, j,
   iCalfNewBreedID : Integer;
   sUpdateFieldName,
   sNewComment,
   sLine,
   FormattedStr,
   UpperTxt : String;
   slNewCalfIDs : TStringList;

   procedure UpdateExistingCalvingCalfDeadStatus(ACalfID, AHerdID, ADisposalPlace, AMortalityID : Integer;
      ACalfDead : Boolean; ACalvingDate : TDateTime);
   var
      i, iSaleDeathEventID : Integer;
      qUpdateCalvings : TQuery;
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE Animals');
            if ( ACalfDead ) then
               SQL.Add('SET InHerd = False')
            else
               SQL.Add('SET InHerd = True');
            SQL.Add('WHERE ID = '+IntToStr(ACalfID)+'');
            try
               ExecSQL;

               if ( ACalfDead ) then
                  begin
                     try
                        EDeathEvent := TSaleDeathEvent.Create('TCALFS');
                        with EDeathEvent do
                           try
                              Append;
                              EventType := TSaleDeath;
                              AnimalID := ACalfID;
                              AnimalLactNo := 0;
                              AnimalHerdID := AHerdID;
                              EventDate := ACalvingDate;
                              EventComment := 'Died at birth';
                              Sold := False;
                              Customer := ADisposalPlace;
                              Notified := False;
                              PreSale := False;
                              Slaughter := False;
                              EventSource := sNEW_CALVINGEVENTSCR;
                              if ( FCountry = England ) then
                                 CTSReg := True;
                              Post;
                           except
                              Cancel;
                           end;
                     finally
                        FreeAndNil(EDeathEvent);
                     end;
                  end
               else
                  DeleteExistingSaleDeathEvent(ACalfID);

               SQL.Clear;
               SQL.Add('SELECT ID1, ID2, ID3, ID4');
               SQL.Add('FROM Calvings');
               SQL.Add('WHERE EventID = '+IntToStr(FEventID)+'');
               Open;

               if ( RecordCount > 0 ) then
                  begin
                     for i := 1 to cMaxCalves do
                        if ( FieldByName(Format('ID%d',[i])).AsInteger = ACalfID ) then
                           begin
                              qUpdateCalvings := TQuery.Create(nil);
                              with qUpdateCalvings do
                                 try
                                    DatabaseName := AliasName;
                                    SQL.Clear;
                                    SQL.Add('UPDATE Calvings');
                                    if ( ACalfDead ) then
                                       begin
                                          SQL.Add('SET CalfDead'+IntToStr(i)+' = TRUE,');
                                          SQL.Add('    CalfMortality'+IntToStr(i)+' = '+IntToStr(AMortalityID)+'');
                                       end
                                    else
                                       begin
                                          SQL.Add('SET CalfDead'+IntToStr(i)+' = FALSE,');
                                          SQL.Add('    CalfMortality'+IntToStr(i)+' = 0');
                                       end;
                                    SQL.Add('WHERE EventID = '+IntToStr(FEventID)+'');
                                    ExecSQL;
                                 finally
                                    Free;
                                 end;
                           end;
                  end;
               Close;
            except
            end;
         finally
            Free;
         end;
   end;

begin
   // Check for removed calves
   if ( (RemovedCalves.Active) and (RemovedCalves.RecordCount>0) ) then
      begin
         RemovedCalves.First;
         while not RemovedCalves.eof do
            begin
               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;
                     SQL.Clear;
                     if ( IsAbortedTag(RemovedCalves.FieldByName('NatIdNo').AsString) ) then
                        begin
                           SQL.Add('DELETE FROM Animals');
                           SQL.Add('WHERE (ID = '+RemovedCalves.FieldByName('Id').AsString+')');
                        end
                     else
                        begin
                           SQL.Add('UPDATE Animals');
                           SQL.Add('SET DamID = Null, AnimalDeleted = TRUE, HerdID = Null,');
                           SQL.Add('    IsSynchronized = FALSE');
                           SQL.Add('WHERE (ID = '+RemovedCalves.FieldByName('Id').AsString+')');
                        end;
                     ExecSQL;

                     SQL.Clear;
                     SQL.Add('SELECT *');
                     SQL.Add('FROM Calvings');
                     SQL.Add('WHERE EventID = '+IntToStr(FEventID)+'');
                     Open;
                     try
                        First;
                        sUpdateFieldName := '';
                        for j := 0 to FieldCount-1 do
                           if ( Fields[j].AsVariant = RemovedCalves.FieldByName('Id').AsInteger ) then
                              begin
                                 sUpdateFieldName := UpperCase(Fields[j].FieldName);
                                 Break;
                              end;
                     finally
                        Close;
                     end;

                     if ( Length(sUpdateFieldName) > 0 ) and
                         ((sUpdateFieldName = 'ID1') or (sUpdateFieldName = 'ID2') or
                          (sUpdateFieldName = 'ID3') or (sUpdateFieldName = 'ID4')) then
                        begin
                           SQL.Clear;
                           SQL.Add('UPDATE Calvings');
                           SQL.Add('SET '+sUpdateFieldName+' = 0');
                           SQL.Add('WHERE EventID = '+IntToStr(FEventID)+'');
                           ExecSQL;

                           SQL.Clear;
                           SQL.Add('SELECT *');
                           SQL.Add('FROM DeletedCalvings');
                           SQL.Add('WHERE EventID = '+IntToStr(FEventID)+'');
                           Open;
                           if ( RecordCount = 0 ) then
                              begin
                                 Close;
                                 SQL.Clear;
                                 SQL.Add('INSERT INTO DeletedCalvings (EventID, DamID, DamLactNo, Calf'+sUpdateFieldName+', DeleteDate, FullCalvingDeleted)');
                                 SQL.Add('VALUES ('+IntToStr(FEventID)+', '+IntToStr(FSelectedDam.Id)+', '+IntToStr(FSelectedDam.LactNo)+',');
                                 SQL.Add('        '+RemovedCalves.FieldByName('Id').AsString+', "'+FormatDateTime(cUSDateStyle,Date)+'", FALSE)');
                                 ExecSQL;
                              end
                           else if ( RecordCount > 0 ) then
                              begin
                                 Close;
                                 SQL.Clear;
                                 SQL.Add('UPDATE DeletedCalvings');
                                 SQL.Add('SET Calf'+sUpdateFieldName+' = '+RemovedCalves.FieldByName('Id').AsString+', DeleteDate = "'+FormatDateTime(cUSDateStyle,Date)+'", FullCalvingDeleted = FALSE');
                                 SQL.Add('WHERE EventID = '+IntToStr(FEventID)+'');
                                 ExecSQL;
                              end;
                        end;
                  finally
                     Free;
                  end;
               RemovedCalves.Next;
            end;
      end;

   mdCalvingDetail.DisableControls;
   try
      for i := 1 to mdCalvingDetail.RecordCount do
         begin
            mdCalvingDetail.RecNo := i;
            if ( mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger = 0 ) then
               begin
                  CalfRecord := TAnimalRecord.Create('');
                  try
                     CalfRecord.Add;
                     CalfRecord.ValidateIdTags := ( FCountry in [Ireland, NIreland] );
                     CalfRecord.HerdID := mdCalvingHeader.FieldByName('AnimalHerdID').AsInteger;
                     CalfRecord.NatIDNum := mdCalvingDetail.FieldByName('CalfNatID').AsString;

                     //   07/11/17 [V5.7 R4.3] /MK Change - If tag is a 372 tag and live then set TransponderNo/ElectronicID to tag without spaces.
                     if ( Is372Tag(mdCalvingDetail.FieldByName('CalfNatID').AsString) ) and
                        ( not(mdCalvingDetail.FieldByName('CalfDead').AsBoolean) ) then
                        CalfRecord.TransponderNo := StripAllSpaces(mdCalvingDetail.FieldByName('CalfNatID').AsString);

                     CalfRecord.AnimalNo := mdCalvingDetail.FieldByName('CalfAnimalNo').AsString;
                     CalfRecord.DateOfBirth := mdCalvingHeader.FieldByName('CalvingDate').AsDateTime;
                     CalfRecord.Sex := mdCalvingDetail.FieldByName('CalfSex').AsString;
                     if ( FCountry = Ireland ) then
                        CalfRecord.PrimaryBreed := mdCalvingHeader.FieldByName('CalfBreedID').AsInteger
                     else
                        begin
                           if ( (not(mdCalvingDetail.FieldByName('CalfBreedID').IsNull)) and (mdCalvingDetail.FieldByName('CalfBreedID').AsInteger > 0) ) then
                              CalfRecord.PrimaryBreed := mdCalvingDetail.FieldByName('CalfBreedID').AsInteger
                           else if ( (not(mdCalvingHeader.FieldByName('CalfBreedID').IsNull)) and (mdCalvingHeader.FieldByName('CalfBreedID').AsInteger > 0) ) then
                              CalfRecord.PrimaryBreed := mdCalvingHeader.FieldByName('CalfBreedID').AsInteger;
                        end;
                     CalfRecord.Colour := mdCalvingDetail.FieldByName('CalfColour').AsInteger;
                     CalfRecord.DamID := mdCalvingHeader.FieldByName('AnimalID').AsInteger;
                     CalfRecord.DonorDamID := mdCalvingHeader.FieldByName('DonorDamID').AsInteger;
                     CalfRecord.SireID := mdCalvingHeader.FieldByName('BullUsed').AsInteger;
                     CalfRecord.Breeding := mdCalvingDetail.FieldByName('CalfIsBreeding').AsBoolean;
                     CalfRecord.Pedigree := mdCalvingDetail.FieldByName('CalfIsPedigree').AsBoolean;
                     CalfRecord.Name := mdCalvingDetail.FieldByName('CalfPedigreeName').AsString;
                     CalfRecord.BirthWeight := mdCalvingDetail.FieldByName('CalfBirthWeight').AsFloat;
                     CalfRecord.IsSynchronized := False;

                     // TODO: Check if other calves should be saved from this point on
                     if ( not(CalfRecord.Save) ) then
                        Continue;

                     if ( not(mdCalvingDetail.State in [dsInsert, dsEdit]) ) then
                        mdCalvingDetail.Edit;
                     mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger := CalfRecord.ID;
                     mdCalvingDetail.FieldByName('CalfLactNo').AsInteger := CalfRecord.LactNo;
                     mdCalvingDetail.Post;

                  finally
                     FreeAndNil(CalfRecord);
                  end;

                if ( mdCalvingDetail.FieldByName('CalfDead').AsBoolean ) then
                   CreateDeathevent(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger,
                                    mdCalvingHeader.FieldByName('AnimalHerdID').AsInteger,
                                    mdCalvingHeader.FieldByName('CalvingDate').AsDateTime,
                                    mdCalvingDetail.FieldByName('CalfDisposalPlace').AsInteger);

                // Create weighing event where applicable
                if ( mdCalvingDetail.FieldByName('CalfBirthWeight').AsFloat > 0 ) then
                    CreateWeighingEvent(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger,
                                        mdCalvingHeader.FieldByName('AnimalHerdID').AsInteger,
                                        mdCalvingHeader.FieldByName('CalvingDate').AsDateTime,
                                        mdCalvingDetail.FieldByName('CalfBirthWeight').AsFloat);

                // Remove tag from tag store
                if ( FInputNatIDStyle = cInputNatIDStyle_ListInput ) then
                   try
                      HerdLookup.RemoveFromTagStore(mdCalvingHeader.FieldByName('AnimalHerdID').AsInteger,
                                                    mdCalvingDetail.FieldByName('CalfNatID').AsString);
                   except
                      on e : exception do
                         MessageDlg(cErrorContact_2 + cCRLFx2 + E.Message,mtError,[mbOk],0);
                   end;

                if ( Length(mdCalvingDetail.FieldByName('CalfAnimalNo').AsString) > 0 ) and ( FCountry = Ireland ) then
                   begin
                      ENewIDEvent := TNewIDEvent.Create('NEWIDCLV');
                      with ENewIDEvent do
                         try
                            Append;
                            EventType := TNewID;
                            EventDate := Date;
                            AnimalID := mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger;
                            AnimalLactNo := mdCalvingDetail.FieldByName('CalfLactNo').AsInteger;
                            AnimalHerdID := UserDefaultHerdID;
                            EventSource := sNEW_CALVINGEVENTSCR;
                            Post;
                         finally
                            FreeAndNil(ENewIDEvent);
                         end;
                   end;

                if ( (not(mdCalvingDetail.FieldByName('CalfGroupID').IsNull)) and (mdCalvingDetail.FieldByName('CalfGroupID').AsInteger > 0) ) then
                   WinData.GroupManager.AddToGroup(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger,
                                                   mdCalvingDetail.FieldByName('CalfGroupID').AsInteger,
                                                   False,
                                                   mdCalvingHeader.FieldByName('CalvingDate').AsDateTime,
                                                   mdCalvingDetail.FieldByName('CalfNatID').AsString);

               end
            else if ( IsDeletedFromCalving(mdCalvingDetail.FieldByName('CalfNatID').AsString) ) then
               UndeleteCalfRecord();
         end;
   finally
      mdCalvingDetail.EnableControls;
   end;

   try
      SetDefaultCalvingComment();

      StoreCalfIdInCalvingsTable();

      UpdateCalvingDamIfRequired();

      UpdateCalvingDateIfRequired();

      UpdateSireIfRequired();

      if ( FCalvingSurveyChanged ) then
         begin
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('UPDATE Calvings');
                  SQL.Add('SET BirthType = '+IntToStr(dbCalvingSurvey.EditValue)+'');
                  SQL.Add('WHERE EventID = '+IntToStr(FEventID)+'');
                  ExecSQL;
               finally
                  Free;
               end;
         end;

      if ( FCalvingCommentChanged ) then
         begin
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('UPDATE Events');
                  SQL.Add('SET EventDesc = "'+dbCalvingHeaderComment.Text+'"');
                  SQL.Add('WHERE ID = '+IntToStr(FEventID)+'');
                  ExecSQL;
               finally
                  Free;
               end;
         end;

      if ( FCalfStatusChanged ) then
         begin
            mdCalvingDetail.First;
            mdCalvingDetail.DisableControls;
            while ( not(mdCalvingDetail.Eof) ) do
               begin
                  if ( mdCalvingDetail.FieldByName('CalfStatusChanged').AsBoolean ) then
                     // Only allow the calf status to be changed from Live Tagged to Dead Tagged - GL Request.
                     if ( not(IsAbortedTag(mdCalvingDetail.FieldByName('CalfNatID').AsString)) ) then
                        UpdateExistingCalvingCalfDeadStatus(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger,
                                                            mdCalvingHeader.FieldByName('AnimalHerdID').AsInteger,
                                                            mdCalvingDetail.FieldByName('CalfDisposalPlace').AsInteger,
                                                            mdCalvingDetail.FieldByName('CalfMortality').AsInteger,
                                                            mdCalvingDetail.FieldByName('CalfDead').AsBoolean,
                                                            mdCalvingHeader.FieldByName('CalvingDate').AsDateTime);
                  mdCalvingDetail.Next;
               end;
            mdCalvingDetail.EnableControls;
         end;

      //   09/11/15 [V5.5 R0.4] /MK Bug Fix - Do not set AllowDeletion boolean as cow was being removed from group if it was already in the group selected.
      if ( FCalvingFeedGroupIDChanged ) then
         begin
            WinData.GroupManager.AddToGroup(FSelectedDam.Id,
                                            dbCalvingGroupID.EditValue,
                                            True,
                                            mdCalvingHeader.FieldByName('CalvingDate').AsDateTime,
                                            FSelectedDam.NatIdNum);
         end;

      OnCloseQuery := nil;
      Close;
   except
   end;
end;

procedure TfmCalvingEvent.CreateWeighingEvent(AAnimalID, AHerdID : Integer;
   AWeighingDate : TDateTime; AWeight : Double);
var
   EWeighing : TWeighingEvent;
begin
   EWeighing := TWeighingEvent.Create('NEWCLVWE');
   with EWeighing do
      try
         try
            Append;
            AnimalID := AAnimalID;
            AnimalLactNo := 0;
            AnimalHerdID := AHerdID;
            EventDate := AWeighingDate;
            EventType := TWeight;
            Weight := AWeight;
            EventComment := 'Weighing';
            EventSource := sNEW_CALVINGEVENTSCR;
            Post;
         except
            Cancel;
         end;
      finally
         FreeAndNil(EWeighing);
      end;
end;

function TfmCalvingEvent.CalfNatIDAlreadyExists(ACalfNatID: String): Boolean;
type
   TDeletedCalfRecord = record
      AnimalNo,
      Sex,
      Name : String;
      AnimalID,
      PrimaryBreed,
      Colour,
      HerdID,
      SireID : Integer;
      InHerd : Boolean;
      BirthWeight : Double;
   end;
var
   DeletedCalfRecord : TDeletedCalfRecord;
begin
   Result := False;
   if ( Length(ACalfNatID) > 0 ) then
      begin
         // We might have a calf who has been orphaned due to Delete Calving Facility.
         // We have found NatIDNum, and animal is marked as deleted.
         // lets now determine if animal was actually deleted from calving event.
         with TQuery.Create(nil) do
            try
               try
                  Databasename := AliasName;
                  SQL.Clear;
                  SQL.Add('SELECT ID, AnimalNo, PrimaryBreed, Sex, Colour, Name, BirthWeight,');
                  SQL.Add('       HerdID, InHerd, AnimalDeleted, SireID');
                  SQL.Add('FROM Animals');
                  SQL.Add('WHERE ((NatIDNum = "'+ACalfNatID+'")');
                  SQL.Add('        OR (SearchNatID LIKE "%'+StripAllSpaces(ACalfNatID)+'%"))');
                  Open;
                  Result := ( RecordCount > 0 ) and ( FieldByName('ID').AsInteger > 0 ) and ( not(FieldByName('AnimalDeleted').AsBoolean) );
                  if ( not(Result) ) then
                     if ( RecordCount > 0 ) then
                        begin
                           if ( FieldByName('AnimalDeleted').AsBoolean ) then
                              begin
                                 DeletedCalfRecord.AnimalNo := '';
                                 DeletedCalfRecord.Sex := '';
                                 DeletedCalfRecord.Name := '';
                                 DeletedCalfRecord.AnimalID := 0;
                                 DeletedCalfRecord.PrimaryBreed := 0;
                                 DeletedCalfRecord.Colour := 0;
                                 DeletedCalfRecord.SireID := 0;
                                 DeletedCalfRecord.BirthWeight := 0;
                                 DeletedCalfRecord.InHerd := True;

                                 if ( FieldByName('ID').AsInteger > 0 ) then
                                    DeletedCalfRecord.AnimalID := FieldByName('ID').AsInteger;
                                 if ( Length(FieldByName('AnimalNo').AsString) > 0 ) then
                                    DeletedCalfRecord.AnimalNo := FieldByName('AnimalNo').AsString;
                                 if ( Length(FieldByName('Sex').AsString) > 0 ) then
                                    DeletedCalfRecord.Sex := FieldByName('Sex').AsString;
                                 if ( Length(FieldByName('Name').AsString) > 0 ) then
                                    DeletedCalfRecord.Name := FieldByName('Name').AsString;
                                 if ( FieldByName('ID').AsInteger > 0 ) then
                                    DeletedCalfRecord.AnimalID := FieldByName('ID').AsInteger;
                                 if ( FieldByName('PrimaryBreed').AsInteger > 0 ) then
                                    DeletedCalfRecord.PrimaryBreed := FieldByName('PrimaryBreed').AsInteger;
                                 if ( FieldByName('Colour').AsInteger > 0 ) then
                                    DeletedCalfRecord.Colour := FieldByName('Colour').AsInteger;
                                 if ( FieldByName('SireID').AsInteger > 0 ) then
                                    DeletedCalfRecord.SireID := FieldByName('SireID').AsInteger;
                                 if ( FieldByName('BirthWeight').AsInteger > 0 ) then
                                    DeletedCalfRecord.BirthWeight := FieldByName('BirthWeight').AsFloat;
                                 DeletedCalfRecord.InHerd := FieldByName('InHerd').AsBoolean;

                                 if ( DeletedCalfRecord.AnimalID = 0 ) then Exit;

                                 Close;

                                 SQL.Clear;
                                 SQL.Add('SELECT EventID');
                                 SQL.Add('FROM DeletedCalvings');
                                 SQL.Add('WHERE ( CalfID1 = :CID )');
                                 SQL.Add('OR    ( CalfID2 = :CID )');
                                 SQL.Add('OR    ( CalfID3 = :CID )');
                                 SQL.Add('OR    ( CalfID4 = :CID )');
                                 Params.ParamByName('CID').AsInteger := DeletedCalfRecord.AnimalID;
                                 Open;

                                 if ( FieldByName('EventID').AsInteger > 0 ) then
                                    begin
                                       if MessageDlg('NOTE: This calf record already exists in the database. '+ ^j +
                                                     'Do you want to use this calf''s details?',mtInformation,[mbYes,mbNo],0) = idYes then
                                          begin
                                             if ( DeletedCalfRecord.AnimalID > 0 ) then
                                                mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger := DeletedCalfRecord.AnimalID;
                                             if ( Length(DeletedCalfRecord.AnimalNo) > 0 ) then
                                                mdCalvingDetail.FieldByName('CalfAnimalNo').AsString := DeletedCalfRecord.AnimalNo;
                                             if ( Length(DeletedCalfRecord.Sex) > 0 ) then
                                                mdCalvingDetail.FieldByName('CalfSex').AsString := DeletedCalfRecord.Sex;
                                             if ( Length(DeletedCalfRecord.Name) > 0 ) then
                                                mdCalvingDetail.FieldByName('CalfPedigreeName').AsString := DeletedCalfRecord.Name;
                                             if ( DeletedCalfRecord.PrimaryBreed > 0 ) then
                                                mdCalvingDetail.FieldByName('CalfBreedID').AsInteger := DeletedCalfRecord.PrimaryBreed;
                                             if ( mdCalvingHeader.FieldByName('BullUsed').AsInteger <= 0 ) then
                                                if ( DeletedCalfRecord.SireID > 0 ) then
                                                   begin
                                                      mdCalvingHeader.FieldByName('BullUsed').OnChange := nil;
                                                      mdCalvingHeader.Edit;
                                                      mdCalvingHeader.FieldByName('BullUsed').AsInteger := DeletedCalfRecord.SireID;
                                                      mdCalvingHeader.Post;
                                                   end;
                                             if ( DeletedCalfRecord.Colour > 0 ) then
                                                mdCalvingDetail.FieldByName('CalfColour').AsInteger := DeletedCalfRecord.Colour;
                                             if ( DeletedCalfRecord.BirthWeight > 0 ) then
                                                mdCalvingDetail.FieldByName('CalfBirthWeight').AsFloat := DeletedCalfRecord.BirthWeight;
                                             if ( DeletedCalfRecord.InHerd ) then
                                                mdCalvingDetail.FieldByName('Mortality').AsString := cLiveMortality
                                             else
                                                mdCalvingDetail.FieldByName('Mortality').AsString := cDeadAtBirthMortality;
                                          end;
                                    end;
                              end
                        end;
                  except
                  end;
            finally
               Free;
            end;
      end;
end;

procedure TfmCalvingEvent.dbStatusPropertiesChange(Sender: TObject);
var
   sMortality,
   sOldMortality,
   DeadCalfNatIDValue : String;
   i : Integer;

   procedure CreateCalfNatID;
   begin
      mdCalvingDetail.FieldByName('CalfNatID').EditMask := '';
      mdCalvingDetail.FieldByName('CalfNatID').AsString := '';
      if ( FCountry in [Ireland, NIreland] ) then
         begin
            if ( FInputNatIDStyle = cInputNatIDStyle_AutoGenInput ) and ( not(FNatIDGenerated) ) then
                begin
                   GenerateNextNatID;
                   dbCalfNatID.ReadOnly := True;
                end
            else
                begin
                   dbCalfNatID.ReadOnly := False;
                   mdCalvingDetail.FieldByName('CalfNatID').EditMask := WinData.DefaultNatIDMaskFromHerdIdentifierMask;
                   if Length(mdCalvingDetail.FieldByName('CalfNatID').EditMask) = 0 then
                      MessageDlg('Error creating mask from herd identifier.'+cCRLF+
                                 'Contact Kingswood.',mtError,[mbOK],0);
                   if ( FInputNatIDStyle = cInputNatIDStyle_ManualInput ) and ( FCountry = Ireland ) then
                      begin
                         if ( Trim(FTagPreFix) = cTagPrefix_IE ) and ( FCountry = Ireland ) then
                            dbCalfNatID.SelStart := 12
                         else
                            dbCalfNatID.SelStart := 13;
                      end;
                end;
           end
      else
         mdCalvingDetail.FieldByName('CalfNatID').EditMask := WinData.DefaultNatIDMask;
   end;

   procedure ShowHideButtons ( AVisible : Boolean );
   var
      sProjectedCalfType : String;
   begin
      lCalfNatID.Visible := AVisible;
      dbCalfNatID.Visible := AVisible;
      lAnimalNo.Visible := AVisible;
      dbCalfAnimalNo.Visible := AVisible;
      lCalfSex.Visible := AVisible;
      dbCalfSex.Visible := AVisible;
      lProjectedCalfSex.Visible := ( AVisible ) and ( FAddAmendOrDeleteCalving = ctAddCalving );
      lProjectedCalfSexText.Visible := ( AVisible ) and ( FAddAmendOrDeleteCalving = ctAddCalving );
      if ( lProjectedCalfSexText.Visible ) then
         begin
            sProjectedCalfType := '';
            if ( (not(mdCalvingHeader.FieldByName('AnimalID').IsNull)) and (mdCalvingHeader.FieldByName('AnimalID').AsInteger > 0) ) and
               ( mdCalvingHeader.FieldByName('AnimalLactNo').AsInteger > -1 ) then
               sProjectedCalfType := GetProjectedCalfType(mdCalvingHeader.FieldByName('AnimalID').AsInteger,
                                                          mdCalvingHeader.FieldByName('AnimalLactNo').AsInteger);
            if ( sProjectedCalfType = '' ) then
               lProjectedCalfSexText.Caption := 'N/A'
            else
            lProjectedCalfSexText.Caption := sProjectedCalfType;
         end;
      lCalfBreed.Visible := AVisible;
      lCalfBreedText.Visible := ( AVisible ) and ( FCountry = Ireland );
      dbCalfBreed.Visible := ( AVisible ) and ( FCountry <> Ireland );
      lCalfNatIDNumOptions.Visible := ( AVisible ) and ( FAddAmendOrDeleteCalving = ctAddCalving );
      lCalfNatIDNumOptionsText.Visible := lCalfNatIDNumOptions.Visible;
      lCalfName.Visible := ( AVisible );
      dbCalfName.Visible := ( AVisible );
      btnCalfPedName.Visible := ( AVisible );
   end;

begin
   inherited;
   sMortality := dbStatus.Text;
   if ( Length(sMortality) = 0 ) then Exit;

   ShowHideButtons(sMortality <> cStillBornMortality);
   pLiveCalf.Visible := (sMortality = cLiveMortality);
   pDeadCalf.Visible := ( not(pLiveCalf.Visible) );

   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) then
      begin
         //   25/08/17 [V5.7 R2.1] /MK Bug Fix - sOldMortality was set to CalfMortality field not Mortality field so FCalfStatusChanged was always true.
         sOldMortality := mdCalvingDetail.FieldByName('Mortality').AsString;
         if ( Length(sOldMortality) > 0 ) then
            FCalfStatusChanged := ( sMortality <> sOldMortality );
         if ( FCalfStatusChanged ) then
            begin
               with pDeadCalf do
                  for i := 0 to ControlCount-1 do
                     if ( Controls[i] is TcxDBLookupComboBox ) then
                        ( Controls[i] as TcxDBLookupComboBox ).Properties.ReadOnly := False;
            end;
      end;

   cmboCalfNatID.Visible := ( FCountry in [Ireland, NIreland] ) and
                            ( FInputNatIDStyle = cInputNatIDStyle_ListInput ) and
                            ( (sMortality = cLiveMortality) or (sMortality = cDeadAtBirthMortality) );
   dbCalfNatID.Visible := ( (sMortality = cLiveMortality) or (sMortality = cDeadAtBirthMortality) ) and ( FInputNatIDStyle <> cInputNatIDStyle_ListInput );

   if ( mdCalvingDetail.State in dsEditModes ) then
      begin
         mdCalvingDetail.FieldByName('Mortality').AsString := sMortality;
         mdCalvingDetail.FieldByName('CalfDead').AsBoolean := ( (sMortality = cDeadAtBirthMortality) or (sMortality = cStillBornMortality) );

         //   15/03/16 [V5.6 R9.0] /MK Bug Fix - Because of new feature to not default the calf sex we have to default the calf sex if the calf is still born
         //                                      for it to save to the database which requires a sex for the animal.
         if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
            begin
               if ( (sMortality = cLiveMortality) or (sMortality = cDeadAtBirthMortality) ) then // Alive
                  begin
                     if ( Length(mdCalvingDetail.FieldByName('CalfNatID').AsString) = 0 ) or
                        ( IsAbortedTag(mdCalvingDetail.FieldByName('CalfNatID').AsString) ) then
                        CreateCalfNatID;
                  end
               else if ( sMortality = cStillBornMortality ) then // Still Born Calf
                  begin
                     //   10/09/18 [V5.8 R2.7] /MK Change - Use the ABOR system with English herds.
                     if ( FCountry in [Ireland, NIreland] ) then
                        if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
                           RollBackAutoGenTagNumber;
                     DeadCalfNatIDValue := StripAllNomNumAlpha(FSelectedDam.NatIdNum);
                     if ( Copy(DeadCalfNatIDValue, 1,2) = 'IE' ) then
                        Delete(DeadCalfNatIDValue,1,2);

                     //   12/02/20 [V5.9 R2.2] /MK Change - Change the aborted tag to year first as UK tags only have enough room for 2 characters after ABOR and DamTag - Mairi (Muldowneys).
                     DeadCalfNatIDValue := 'ABOR' + DeadCalfNatIDValue + FormatDateTime('yymm',dbCalvingDate.Date);
                     if ( Length(DeadCalfNatIDValue) > 20 ) then
                        DeadCalfNatIDValue := Copy(DeadCalfNatIDValue, 1, 20);

                     mdCalvingDetail.FieldByName('CalfAnimalNo').AsString := '';
                     mdCalvingDetail.FieldByName('CalfNatID').EditMask := '';
                     mdCalvingDetail.FieldByName('CalfNatID').AsString := '';
                     mdCalvingDetail.FieldByName('CalfNatID').AsString := DeadCalfNatIDValue;
                  end;

               if ( sMortality = cStillBornMortality ) then
                  mdCalvingDetail.FieldByName('CalfSex').AsString := cSex_Female
               else
                  begin
                     //   27/06/18 [V5.8 R0.6] /MK Bug Fix - Don't clear CalfSex when dbStatus is changed.
                     {
                     mdCalvingDetail.FieldByName('CalfSex').AsString := '';
                     if ( WinData.GlobalSettings.DefaultCalfSex ) then
                        if ( Length(WinData.GlobalSettings.DefaultCalfSexType) > 0 ) then
                           mdCalvingDetail.FieldByName('CalfSex').AsString := WinData.GlobalSettings.DefaultCalfSexType;
                     }
                  end;
            end;

         //   25/08/17 [V5.7 R2.1] /MK Bug Fix - CalfStatusChanged was incorrectly being set if adding a calving not editing.
         if ( FAddAmendOrDeleteCalving = ctAmendCalving ) and
            ( (not(mdCalvingDetail.FieldByName('CalfAnimalID').IsNull)) and (mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger > 0) ) then
            mdCalvingDetail.FieldByName('CalfStatusChanged').AsBoolean := FCalfStatusChanged;

         //   15/03/16 [V5.5 R5.4] /MK Additional Feature - Set the CalfIsRegistered boolean to true if adding calving and is dead not tagged calf - GL request.
         //   31/07/17 [V5.7 R1.1] /MK Change - Set Dead Not Tagged calf as registered if country is Ireland or England.
         if ( FAddAmendOrDeleteCalving = ctAddCalving ) and ( mdCalvingDetail.State in dsEditModes ) and ( FCountry in [Ireland, England] ) then
            mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean := ( sMortality = cStillBornMortality );

      end;

  btnTagType.Visible := ( FCountry = England ) and ( dbCalfNatID.Visible ) and ( FAddAmendOrDeleteCalving = ctAddCalving ) and ( sMortality <> cStillBornMortality );
end;

procedure TfmCalvingEvent.dbStatusPropertiesCloseUp(Sender: TObject);
var
   sMortality : String;
begin
   inherited;
   dbStatus.Properties.OnChange := nil;
   Height := FScreenHeight;
   pCalvingDetail.Height := FModifiedCalvingDetailHeight;
   pDeadCalf.Top := pLiveCalf.Top;
   sMortality := mdCalvingDetail.FieldByName('Mortality').AsString;
   //   04/04/18 [V5.7 R8.6] /MK Bug Fix - If user clicks into status and clicks out of it, the program crashed because it was try to clear the items
   //                                      of the status list but the item was already in use. This check only needs to be done for new calvings.
   {
   if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
      if ( sMortality = cLiveMortality ) or ( sMortality = cDeadAtBirthMortality ) then
         begin
            dbStatus.Properties.Items.Add(cLiveMortality);
            dbStatus.Properties.Items.Add(cDeadAtBirthMortality);
         end;
   }
   dbStatus.Enabled := ( FAddAmendOrDeleteCalving = ctAddCalving ) or
                       ( (FAddAmendOrDeleteCalving = ctAmendCalving) and (sMortality <> cStillBornMortality) );
   pAddRemoveCancelCalf.Visible := ( sMortality <> cStillBornMortality );
   if ( not(pAddRemoveCancelCalf.Visible) ) then
       begin
          pDeadCalf.Top := 28;
          pCalvingDetail.Height := 140;
          Height := ( FScreenHeight - 116 ); 
       end;
   if ( dbStatus.ItemIndex < 0 ) then
      dbStatus.ItemIndex := 0;
   dbStatus.Properties.OnChange := dbStatusPropertiesChange;
end;

procedure TfmCalvingEvent.dbCalvingSurveyPropertiesChange(Sender: TObject);
begin
   inherited;
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) then
      FCalvingSurveyChanged := ( dbCalvingSurvey.EditValue <> FExistingCalvingRecord.CRBirthType );
end;

procedure TfmCalvingEvent.dbCalvingHeaderCommentPropertiesChange(Sender: TObject);
begin
   inherited;
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) then
      FCalvingCommentChanged := ( dbCalvingHeaderComment.Text <> FExistingCalvingRecord.CREventDesc );
end;

procedure TfmCalvingEvent.CalvingDetailGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
   inherited;
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) then
      lCalfIsRegistered.Visible := mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean;
end;

procedure TfmCalvingEvent.dbCalvingGroupIDPropertiesChange(
  Sender: TObject);
begin
   inherited;
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) then
      FCalvingFeedGroupIDChanged := ( dbCalvingGroupID.EditValue <> FExistingCalvingRecord.CRDamFeedGroupID );
end;

procedure TfmCalvingEvent.dbCalfMortalityPropertiesChange(Sender: TObject);
begin
   inherited;
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) and
      ( (dbCalfMortality.EditValue <> Null) and (dbCalfMortality.EditValue <> 0) ) then
      if ( dbCalfMortality.EditValue <> mdCalvingDetail.FieldByName('CalfMortality').AsInteger ) then
         begin
            if ( not(mdCalvingDetail.State in dsEditModes) ) then
               mdCalvingDetail.Edit;
            mdCalvingDetail.FieldByName('CalfMortality').AsInteger := dbCalfMortality.EditValue;
         end;
end;

procedure TfmCalvingEvent.dbDisposalPlacePropertiesChange(Sender: TObject);
begin
   inherited;
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) and
      ( (not(dbDisposalPlace.EditValue = Null)) and (dbDisposalPlace.EditValue <> 0) ) then
         if ( dbDisposalPlace.EditValue <> mdCalvingDetail.FieldByName('CalfDisposalPlace').AsInteger ) then
            begin
               if ( not(mdCalvingDetail.State in dsEditModes) ) then
                 mdCalvingDetail.Edit;
               mdCalvingDetail.FieldByName('CalfDisposalPlace').AsInteger := dbDisposalPlace.EditValue;
            end;
end;

procedure TfmCalvingEvent.teSearchAnimalTextPropertiesChange(Sender: TObject);
begin
   inherited;
   ClearMemDataSets;
   lDamNameText.Caption := '';
   lSireNameText.Caption := '';
   lGeneticDam.Visible := False;
   lGeneticDamNumberText.Visible := False;
   lGeneticDamNumberText.Caption := '';
   FillFExistingCalvingRecord;
   AddHeaderRecord;
   FillBullList;
   AddDetailRecord;
   if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
      teSearchAnimalText.Properties.OnChange := teSearchAnimalTextPropertiesChange
   else
      teSearchAnimalText.Properties.OnChange := teSearchAnimalTextExistDamIDChanged;
   CheckDamDrugWithdrawalPeriod();
end;

procedure TfmCalvingEvent.teSearchAnimalTextExistDamIDChanged(Sender: TObject);
begin
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) and ( FOriginalDamID > 0 ) and
      ( FSelectedDam.Id <> FOriginalDamID ) then
      begin
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT ID, AnimalNo, NatIDNum, SortAnimalNo, SortNatID');
               SQL.Add('FROM Animals');
               SQL.Add('WHERE InHerd = True');
               SQL.Add('AND AnimalDeleted = False');
               SQL.Add('AND HerdID = :UserDefaultHerdID');
               SQL.Add('AND Upper(Sex) = "FEMALE"');
               SQL.Add('AND DateOfBirth <= :DateOfBirth');
               SQL.Add('AND ID NOT IN (SELECT AnimalID');
               SQL.Add('               FROM Events');
               SQL.Add('               WHERE (EventType = '+IntToStr(CCalvingEvent)+')');
               SQL.Add('               AND   (EventDate BETWEEN "'+FormatDateTime(cUSDateStyle,IncMonth(Date,-3))+'" AND "'+FormatDateTime(cUSDateStyle,Date)+'"))');
               SQL.Add('AND ID = '+IntToStr(FSelectedDam.ID)+'');
               Params[0].AsInteger := UserDefaultHerdID;
               Params[1].AsDateTime := IncMonth(Date,-12);
               try
                  Open;
                  if ( RecordCount = 0 ) then
                     begin
                        MessageDlg('This dam has already been calved in the last 3 months.'+cCRLF+
                                   'Please select another dam.',mtError,[mbOK],0);
                        if ( UpperCase(GetSearchField) = 'ANIMALNO' ) then
                           teSearchAnimalText.Text := FSelectedDam.AnimalNo
                        else
                           teSearchAnimalText.Text := FSelectedDam.NatIdNum;
                        Exit;
                     end;
               except
               end;
            finally
               Free;
            end;
      end;
end;

procedure TfmCalvingEvent.dbStatusPropertiesInitPopup(Sender: TObject);
begin
   inherited;
   //   04/04/18 [V5.7 R8.6] /MK Change - If editing a calving event don't allow status to be changed to Dead (Not Tagged)
   //                                     If adding a new calving then show Dead (Not Tagged) if entering first calf.
   dbStatus.Properties.OnChange := nil;
   dbStatus.Properties.Items.Clear;
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) then
      begin
         dbStatus.Properties.Items.Add(cLiveMortality);
         dbStatus.Properties.Items.Add(cDeadAtBirthMortality);
      end
   else
      begin
         dbStatus.Properties.Items.Add(cLiveMortality);
         dbStatus.Properties.Items.Add(cDeadAtBirthMortality);
         if ( mdCalvingDetail.RecordCount <= 1 ) then
            dbStatus.Properties.Items.Add(cStillBornMortality);
      end;
   dbStatus.Properties.OnChange := dbStatusPropertiesChange;
end;

procedure TfmCalvingEvent.FormDestroy(Sender: TObject);
begin
   inherited;
   if ( FAddAmendOrDeleteCalving = ctAddCalving ) and ( FNatIDGenerated ) and ( not(FCalvingSaved) ) then
      try
         if ( mdCalvingDetail.State in dsEditModes ) then
            mdCalvingDetail.Cancel;
         mdCalvingDetail.First;
         mdCalvingDetail.DisableControls;
         while ( not(mdCalvingDetail.Eof) ) do
            begin
               FNatIDGenerated := ( FInputNatIDStyle = cInputNatIDStyle_AutoGenInput );
               mdCalvingDetail.Delete;
            end;
         mdCalvingDetail.EnableControls;
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('Error closing calving - moving through mdCalvingDetail');
            end;
      end;

   if ( FBullList <> nil ) then
      try
         if ( FBullList.Active ) then
            FBullList.Active := False;
         FreeAndNil(FBullList);
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('Error closing calving - free FBullList');
            end;
      end;

   if ( FDSBullList <> nil ) then
      try
         FreeAndNil(FDSBullList);
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('Error closing calving - free FDSBullList');
            end;
      end;

   if ( FCalfBatch_FeedGroups <> nil ) then
      try
         if ( FCalfBatch_FeedGroups.Active ) then
            FCalfBatch_FeedGroups.Active := False;
         FreeAndNil(FCalfBatch_FeedGroups);
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('Error closing calving - free FCalfBatch_FeedGroups');
            end;
      end;

   if ( FDSCalfBatch_FeedGroups <> nil ) then
      try
         FreeAndNil(FDSCalfBatch_FeedGroups);
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('Error closing calving - free FDSCalfBatch_FeedGroups');
            end;
      end;

   if ( FStockBullEventQuery <> nil ) then
      try
         if ( FStockBullEventQuery.Active ) then
            FStockBullEventQuery.Close;
         FreeAndNil(FStockBullEventQuery);
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('Error closing calving - free FStockBullEventQuery');
            end;
      end;

   if ( FGroupManager <> nil ) then
      try
         FreeAndNil(FGroupManager);
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('Error closing calving - free FGroupManager');
            end;
      end;

   if ( FSelectedDam <> nil ) then
      try
         FreeAndNil(FSelectedDam);
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('Error closing calving - free FSelectedDam');
            end;
      end;

   if ( FCancelledCalvesSL <> nil ) then
      try
         FreeAndNil(FCancelledCalvesSL);
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('Error closing calving - free FCancelledCalvesSL');
            end;
      end;

   if ( FCallProgram <> nil ) then
      FreeAndNil(FCallProgram);
      
   try
      HerdLookup.OpenTagStore(0);
   except
      on e : Exception do
         begin
            ApplicationLog.LogException(e);
            ApplicationLog.LogError('Error closing calving - HerdLookup.OpenTagStore');
         end;
   end;

   if ( HerdLookup.qFeedGroups.Active ) then
      HerdLookup.qFeedGroups.Close;

   RemovedCalves.Active := False;
end;

procedure TfmCalvingEvent.CreateDeathEvent(AAnimalID, AHerdID: Integer;
   ADeathDate: TDateTime; ADisposalPlace : Integer);
var
   EDeathEvent : TSaleDeathEvent;
begin
   try
      EDeathEvent := TSaleDeathEvent.Create('TCALFS');
      with EDeathEvent do
         try
            Append;
            EventType := TSaleDeath;
            AnimalID := AAnimalID;
            AnimalHerdID := AHerdId;
            EventDate := ADeathDate;
            EventComment := 'Died at birth';
            Sold := False;
            Customer := ADisposalPlace;
            Notified := False;
            PreSale := False;
            Slaughter := False;
            EventSource := sNEW_CALVINGEVENTSCR;
            if ( FCountry = England ) then
               CTSReg := True;
            Post;
         except
            Cancel;
         end;
   finally
      FreeAndNil(EDeathEvent);
   end;
end;

procedure TfmCalvingEvent.SetDefaultCalvingComment;
var
   EventComment : string;
begin
   if (FAddAmendOrDeleteCalving = ctAmendCalving) then
      begin
         EventComment := mdCalvingHeader.FieldByName('CalvingComment').AsString;
          if ( EventComment = 'Calving') or
             ( EventComment = 'Calving/Twin') or
             ( EventComment = 'Calving/Triplet') or
             ( EventComment = 'Calving/Quad') then
             begin
                // The default comment remains - now we shoyld attempt to set the new comment based on number of calves
                EventComment := 'Calving';
                case mdCalvingDetail.RecordCount of
                   2 : EventComment := 'Calving/Twin';
                   3 : EventComment := 'Calving/Triplet';
                   4 : EventComment := 'Calving/Quad';
                end;

                with TQuery.Create(nil) do
                try
                   DatabaseName := AliasName;
                   SQL.Clear;
                   SQL.Add('UPDATE Events');
                   SQL.Add('SET EventDesc = "'+EventComment+'"');
                   SQL.Add('WHERE ID = '+IntToStr(FEventID)+'');
                   try
                      ExecSQL;
                   except

                   end;
                finally
                   Free;
                end;
             end;
      end;
end;

// Reassociate calves to calving event where calves were deleted as part of calf or full calving event deletion.
procedure TfmCalvingEvent.StoreCalfIdInCalvingsTable();
var
   j, iCalfID : Integer;
   sFieldName : string;
   qLookupCalving,
   qUpdateCalving : TQuery;
begin
   qLookupCalving := TQuery.Create(nil);
   try
      mdCalvingDetail.DisableControls;
      mdCalvingDetail.First;
      while ( not(mdCalvingDetail.Eof) ) do
         begin
            iCalfID := mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger;
            with qLookupCalving do
               begin
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('SELECT ID1, ID2, ID3, ID4');
                  SQL.Add('FROM Calvings');
                  SQL.Add('WHERE EventID = '+IntToStr(FEventID)+'');
                  SQL.Add('AND ( ( (ID1 = 0) OR (ID1 IS NULL) )  ');
                  SQL.Add('OR    ( (ID2 = 0) OR (ID2 IS NULL) )  ');
                  SQL.Add('OR    ( (ID3 = 0) OR (ID3 IS NULL) )  ');
                  SQL.Add('OR    ( (ID4 = 0) OR (ID4 IS NULL) ) )');
                  Open;
                  try
                     if ( iCalfID <> qLookupCalving.FieldByName('ID1').AsInteger ) and
                        ( iCalfID <> qLookupCalving.FieldByName('ID2').AsInteger ) and
                        ( iCalfID <> qLookupCalving.FieldByName('ID3').AsInteger ) and
                        ( iCalfID <> qLookupCalving.FieldByName('ID4').AsInteger ) then
                        begin
                           for j := 0 to qLookupCalving.FieldCount-1 do
                             begin
                                sFieldName := UpperCase(qLookupCalving.Fields[j].FieldName);
                                if ((sFieldName = 'ID1') or (sFieldName = 'ID2') or
                                    (sFieldName = 'ID3') or (sFieldName = 'ID4')) and
                                    ( qLookupCalving.Fields[j].AsInteger = 0 ) then
                                 begin
                                    qUpdateCalving := TQuery.Create(nil);
                                    with qUpdateCalving do
                                       try
                                          DatabaseName := AliasName;
                                          SQL.Clear;
                                          SQL.Add('UPDATE Calvings');
                                          SQL.Add('SET '+sFieldName+' =:CalfID,');
                                          SQL.Add('    CalfDead'+Copy(sFieldName,3,1)+' =:CalfDead');
                                          SQL.Add('WHERE EventID =:EventId');
                                          Params[0].AsInteger := iCalfID;
                                          Params[1].AsBoolean := mdCalvingDetail.FieldByName('CalfDead').AsBoolean;
                                          Params[2].AsInteger := FEventID;
                                          ExecSQL;
                                       finally
                                          Free;
                                       end;
                                    // Animal found and updated. Break and move through next mdCalvingRecord.
                                    Break;
                                 end;
                             end;
                        end;
                  finally
                     Close;
                  end;
               end;
            mdCalvingDetail.Next;
         end;
      mdCalvingDetail.EnableControls;
   finally
      FreeAndNil(qLookupCalving);
   end;
end;

procedure TfmCalvingEvent.UpdateCalvingDamIfRequired;
begin
  if ( not(FDamIDChanged) ) or ( FOriginalDamID <= 0 ) then Exit;
  with TQuery.Create(nil) do
     try
        DatabaseName := AliasName;
        mdCalvingDetail.DisableControls;
        mdCalvingDetail.First;
        while ( not(mdCalvingDetail.Eof) ) do
           begin
              SQL.Clear;
              SQL.Add('UPDATE Animals');
              SQL.Add('SET DamID = '+IntToStr(FSelectedDam.ID)+',');
              SQL.Add('    DonorDamID = '+IntToStr(mdCalvingHeader.FieldByName('DonorDamID').AsInteger)+',');
              SQL.Add('    IsSynchronized = FALSE');
              SQL.Add('WHERE ID = '+IntToStr(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger)+'');
              ExecSQL;
              mdCalvingDetail.Next;
           end;

        SQL.Clear;
        SQL.Add('UPDATE Events');
        SQL.Add('SET AnimalID = '+IntToStr(FSelectedDam.ID)+',');
        SQL.Add('    AnimalLactNo = '+IntToStr(FSelectedDam.LactNo+1)+'');
        SQL.Add('WHERE ID = '+IntToStr(FEventID)+'');
        ExecSQL;

        SQL.Clear;
        SQL.Add('UPDATE Animals');
        SQL.Add('SET LactNo = LactNo+1');
        SQL.Add('WHERE ID = '+IntToStr(FSelectedDam.ID)+'');
        ExecSQL;

        SQL.Clear;
        SQL.Add('UPDATE Animals');
        SQL.Add('SET LactNo = LactNo-1');
        SQL.Add('WHERE ID = '+IntToStr(FOriginalDamID)+'');
        ExecSQL;
     finally
        mdCalvingDetail.EnableControls;
        Free;
     end;
end;

procedure TfmCalvingEvent.UpdateCalvingDateIfRequired;
begin
   if not ( FCalvingDateChanged ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE Events');
         SQL.Add('SET EventDate = "'+FormatDateTime(cUSDateStyle,dbCalvingDate.Date)+'"');
         SQL.Add('WHERE ID = '+IntToStr(FEventID)+'');
         ExecSQL;

         mdCalvingDetail.First;
         mdCalvingDetail.DisableControls;
         while ( not(mdCalvingDetail.Eof) ) do
            begin
               SQL.Clear;
               SQL.Add('UPDATE Animals');
               SQL.Add('SET DateOfBirth = "'+FormatDateTime(cUSDateStyle,dbCalvingDate.Date)+'", ');
               SQL.Add('    DonorDamID = '+IntToStr(mdCalvingHeader.FieldByName('DonorDamID').AsInteger)+'');
               SQL.Add('WHERE ID = '+IntToStr(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger)+'');
               ExecSQL;
               mdCalvingDetail.Next;
            end;
         mdCalvingDetail.EnableControls;
      finally
         Free;
      end;
end;

procedure TfmCalvingEvent.UpdateSireIfRequired;
var
   iCalfNewBreedID : Integer;
begin
   if not ( FBullUsedChanged ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         mdCalvingDetail.DisableControls;
         mdCalvingDetail.First;
         while ( not(mdCalvingDetail.Eof) ) do
            begin
               // Update SireID of the calf/calves of this calving.
               SQL.Clear;
               SQL.Add('UPDATE Animals');
               SQL.Add('SET SireID = '+IntToStr(dbBullUsed.EditValue)+'');
               SQL.Add('WHERE ID = '+IntToStr(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger)+'');
               ExecSQL;

               // If changing of the sire has resulted in the breed of the calf changing then update the calf breed in the animals table.
               SQL.Clear;
               SQL.Add('SELECT NatIDNum, PrimaryBreed');
               SQL.Add('FROM Animals');
               SQL.Add('WHERE ID = '+IntToStr(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger)+'');
               try
                  Open;
                  // If tag is aborted tag the don't update breed of calf as aborted tags are not valid tags and won't be registered.
                  if ( not(IsAbortedTag(Fields[0].AsString)) ) and ( Fields[1].AsInteger > 0 ) then
                     begin
                        if ( (not(mdCalvingHeader.FieldByName('DonorDamBreedID').IsNull)) and (mdCalvingHeader.FieldByName('DonorDamBreedID').AsInteger > 0) ) then
                           iCalfNewBreedID := GetCalfBreedID(mdCalvingHeader.FieldByName('BullUsedBreedID').AsInteger,
                                                             mdCalvingHeader.FieldByName('DonorDamBreedID').AsInteger)
                        else
                           iCalfNewBreedID := GetCalfBreedID(mdCalvingHeader.FieldByName('BullUsedBreedID').AsInteger,
                                                             mdCalvingHeader.FieldByName('AnimalBreedID').AsInteger);
                        if ( Fields[1].AsInteger <> iCalfNewBreedID ) then
                           begin
                              SQL.Clear;
                              SQL.Add('UPDATE Animals');
                              SQL.Add('SET PrimaryBreed = '+IntToStr(iCalfNewBreedID)+'');
                              SQL.Add('WHERE ID = '+IntToStr(mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger)+'');
                              ExecSQL;
                           end;
                     end;
                  mdCalvingDetail.Next;
              finally
                  Close;
              end;
            end;
      finally
         mdCalvingDetail.EnableControls;
         Free;
      end;
end;

procedure TfmCalvingEvent.UndeleteCalfRecord;
var
   EUndeletedCalving : TUnDeletedAnimal;
begin
   EUndeletedCalving := TUnDeletedAnimal.Create();
   with EUndeletedCalving do
      try
        ID := mdCalvingDetail.FieldByName('CalfAnimalID').AsInteger;
        HerdID := UserDefaultHerdID;
        AnimalNo := mdCalvingDetail.FieldByName('CalfAnimalNo').AsString;
        SortAnimalNo := WinData.SortAnimalNoString(mdCalvingDetail.FieldByName('CalfAnimalNo').AsString);
        DateOfBirth := mdCalvingHeader.FieldByName('CalvingDate').AsDateTime;
        if ( FCountry = Ireland ) then
           PrimaryBreed := mdCalvingHeader.FieldByName('CalfBreedID').AsInteger
        else
           begin
              if ( (not(mdCalvingDetail.FieldByName('CalfBreedID').IsNull)) and (mdCalvingDetail.FieldByName('CalfBreedID').AsInteger > 0) ) then
                 PrimaryBreed := mdCalvingDetail.FieldByName('CalfBreedID').AsInteger
              else if ( (not(mdCalvingHeader.FieldByName('CalfBreedID').IsNull)) and (mdCalvingHeader.FieldByName('CalfBreedID').AsInteger > 0) ) then
                 PrimaryBreed := mdCalvingHeader.FieldByName('CalfBreedID').AsInteger;
           end;
        if ( FCountry = NIreland ) and
           ( (not(mdCalvingDetail.FieldByName('CalfColour').IsNull)) and (mdCalvingDetail.FieldByName('CalfColour').AsInteger > 0) ) then
           Colour := mdCalvingDetail.FieldByName('CalfColour').AsInteger;
        if ( Length(mdCalvingDetail.FieldByName('CalfPedigreeName').AsString) > 0 ) then
           PedigreeName := mdCalvingDetail.FieldByName('CalfPedigreeName').AsString;
        Sex := mdCalvingDetail.FieldByName('CalfSex').AsString;
        Breeding := mdCalvingDetail.FieldByName('CalfIsBreeding').AsBoolean;
        Pedigree := mdCalvingDetail.FieldByName('CalfIsPedigree').AsBoolean;
        InHerd := ( not(mdCalvingDetail.FieldByName('CalfDead').AsBoolean) );
        if ( mdCalvingDetail.FieldByName('CalfBirthWeight').AsFloat > 0 ) then
           BirthWeight := mdCalvingDetail.FieldByName('CalfBirthWeight').AsFloat;
        SireID := mdCalvingHeader.FieldByName('BullUsed').AsInteger;
        DamID := mdCalvingHeader.FieldByName('AnimalID').AsInteger;
        UnDelete;
      finally
         FreeAndNil(EUndeletedCalving);
      end;
end;

procedure TfmCalvingEvent.SetCalfRegReminderIfRequired;
begin
   if not ( WinData.GlobalSettings.ShowCalfReg ) then Exit;

   mdCalvingDetail.First;
   mdCalvingDetail.DisableControls;
   while ( not(mdCalvingDetail.Eof) ) do
      begin
         WinData.ShowCalfRegReminder := ( not(mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean) );
         if ( WinData.ShowCalfRegReminder ) then
            Break;
         mdCalvingDetail.Next;
      end;
   mdCalvingDetail.EnableControls;
end;

procedure TfmCalvingEvent.ShowDeptWarningForRegCalves;
begin
   // Show warning on update of calving if any calves were registered and the calving was changed.
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) and ( CalvingChanged ) then
      begin
         mdCalvingDetail.First;
         mdCalvingDetail.DisableControls;
         while ( not(mdCalvingDetail.Eof) ) do
            begin
               if ( mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean ) then
                  begin
                     MessageDlg('Changes have been made to registered calf/calves.'+cCRLF+
                                'You may need to contact the Dept about these changes.',mtInformation,[mbOK],0);
                     Break;
                  end;
               mdCalvingDetail.Next;
            end;
         mdCalvingDetail.EnableControls;
      end;
end;

procedure TfmCalvingEvent.ShowConditionScoreOrHealthPrompt;
var
   CalvingSurvey : TCalvingSurvey;

   function IsAbortedCalving : Boolean;
   begin
      Result := False;
      mdCalvingDetail.First;
      mdCalvingDetail.DisableControls;
      while ( not(mdCalvingDetail.Eof) ) do
         begin
            Result := ( mdCalvingDetail.FieldByName('Mortality').AsString = cStillBornMortality );
            if ( Result ) then
               Break;
            mdCalvingDetail.Next;
         end;
      mdCalvingDetail.EnableControls;
   end;

begin
   if ( Preferences.ValueAsBoolean[cGSCalving_RecordCScore]) or (Preferences.ValueAsBoolean[cGSCalving_RecordHealth]) then
      begin
         CalvingSurvey := TCalvingSurvey.Create;
         with CalvingSurvey do
            try
               Clear;
               AnimalId := mdCalvingHeader.FieldByName('AnimalID').AsInteger;
               LactNo := mdCalvingHeader.FieldByName('AnimalLactNo').AsInteger+1;
               HerdId := mdCalvingHeader.FieldByName('AnimalHerdID').AsInteger;
               CalvingDate := mdCalvingHeader.FieldByName('CalvingDate').AsDateTime;
               EventId := WinData.NextEventID;
               AbortedCalving := IsAbortedCalving;
               AssistedCalvingModerate := True;
               AssistedCalvingSerious := False;
               MilkFever := False;
               RetainedCleansing := False;
               DisplacedAbomasums := False;
               ConditionScore := Null;
               ConditionScoreComment := 'Condition Score';
               ShowCSInfo := Preferences.ValueAsBoolean[cGSCalving_RecordCScore];
               ShowBirthTypeInfo := Preferences.ValueAsBoolean[cGSCalving_RecordHealth];
               RegisterCalves := WinData.GlobalSettings.ShowCalfReg;

               TfmCalvingSurveyForm.ShowSurvey(CalvingSurvey);
               WinData.SaveCalvingSurvey(CalvingSurvey);
            finally
               FreeAndNil(CalvingSurvey);
            end;
      end;
end;

function TfmCalvingEvent.CalvingChanged : Boolean;
begin
   Result := ( FDamIDChanged ) or ( FCalvingDateChanged ) or
             ( FBullUsedChanged ) or ( FCalvingCommentChanged ) or
             ( WinData.CalvingDeleted ) or ((RemovedCalves.Active) and (RemovedCalves.RecordCount>0)) or ( FCalfStatusChanged );
end;

procedure TfmCalvingEvent.ValidateAnimalDetails;
var
   TempNatIdNo, TempAnimalNo : string;
begin
   ApplicationLog.LogDebugMessage('ValidateAnimalDetails Start');

   CheckCalfOtherDetails;
   CheckMemDataDuplicateNatID_AnimalNo;

   if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
      begin
         if ( FCountry <> England ) then
            if ( mdCalvingDetail.FieldByName('CalfNatID').IsNull ) and ( Length(mdCalvingDetail.FieldByName('CalfNatID').AsString) = 0 ) then
               begin
                  MessageDlg(Format('Calf tag number cannot be blank.',[mdCalvingDetail.FieldByName('CalfNatID').AsString]),mtError,[mbOK],0);
                  SysUtils.Abort;
               end;

         TempNatIdNo := mdCalvingDetail.FieldByName('CalfNatID').AsString;
         ApplicationLog.LogDebugMessage(Format('Validate tag : %s',[TempNatIdNo]));
         ApplicationLog.LogDebugMessage('Tag Already Exists Check');
            if ( NatIDNumAlreadyExists(mdCalvingDetail.FieldByName('CalfNatID').AsString) ) then
               if ( not(IsDeletedFromCalving(mdCalvingDetail.FieldByName('CalfNatID').AsString)) ) then
                  raise ErrorMsg.CreateFmt('Nat. Id. No. has already been entered.',[nil]);

         ApplicationLog.LogDebugMessage('Calf Number Exists Check');
         TempAnimalNo := mdCalvingDetail.FieldByName('CalfAnimalNo').AsString;
         if ( Length(TempAnimalNo) > 0 ) then
            if ( CalfNoAlreadyExists(TempAnimalNo) ) then
               if ( not(IsDeletedFromCalving(TempAnimalNo)) ) then
                  raise ErrorMsg.CreateFmt('Calf Number (F.B./Jumbo) %s has already been used in this herd.',[TempAnimalNo]);
      end;

   ValidateCalfTag;

   ApplicationLog.LogDebugMessage('ValidateAnimalDetails Start');
end;

procedure TfmCalvingEvent.actAddCalfUpdate(Sender: TObject);
begin
   inherited;
   case CalvingDetailGridDBTableView.DataController.RowCount of
      1 : actAddCalf.Caption := 'Add Twin';
      2 : actAddCalf.Caption := 'Add Triplet';
      3 : actAddCalf.Caption := 'Add Quadruplet';
   end;
   actAddCalf.Enabled := ( CalvingDetailGridDBTableView.DataController.RowCount <= 3 );
end;

procedure TfmCalvingEvent.actRemoveCalfUpdate(Sender: TObject);
begin
   inherited;
   actRemoveCalf.Enabled := ( CalvingDetailGridDBTableView.DataController.RowCount > 1 );
end;

procedure TfmCalvingEvent.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   inherited;
   //   16/03/16 [V5.5 R5.4] /MK Bug Fix - Check to see if calving was deleted and if it was don't show "Are you sure you want to close" message.
   try
      if ( WinData.CalvingDeleted ) or ( FCalvingSaved ) or ( FHasFormErrors ) then
         CanClose := True
      else
         CanClose := ( MessageDlg('Are you sure you want to close?'+cCRLF+
                                  'Any changes made will be lost!',mtConfirmation,[mbYes,mbNo],0) = mrYes );
   except
      on e : Exception do
         begin
            ApplicationLog.LogException(e);
            ApplicationLog.LogError('Error closing calving - FormCloseQuery');
         end;
   end;
end;

// SP 22/10/2015
procedure TfmCalvingEvent.CheckDamDrugWithdrawalPeriod;
begin
   // Exit if the form is not yet visible.
   if ( not(FFormShowing) ) then Exit;
   if ( not(ValidDate(dbCalvingDate.Date)) ) then Exit;
   if ( (not(mdCalvingHeader.FieldByName('AnimalID').IsNull)) and (mdCalvingHeader.FieldByName('AnimalID').AsInteger > 0) ) then
      HerdLookup.QueryAnimalWithdrawal(cCalvingEvent, mdCalvingHeader.FieldByName('AnimalID').AsInteger, dbCalvingDate.Date);
end;

procedure TfmCalvingEvent.CheckCalvingInterval;
var
   LastCalvDate : TDateTime;
begin
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) or ( not(FFormShowing) ) then Exit;

   if ( mdCalvingHeader.FieldByName('CalvingDate').AsDateTime <= 0 ) then Exit;

   if ( not(ValidDate(mdCalvingHeader.FieldByName('CalvingDate').AsDateTime)) ) then Exit; 

   if ( dbStatus.Text <> cDeadAtBirthMortality ) then
      begin
         LastCalvDate := 0;
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT MAX(E.EventDate)');
               SQL.Add('FROM Events E');
               SQL.Add('WHERE E.AnimalID = '+IntToStr(mdCalvingHeader.FieldByName('AnimalID').AsInteger)+'');
               SQL.Add('AND   E.EventType = '+IntToStr(cCalvingEvent));
               try
                  Open;
                  if ( RecordCount > 0 ) then
                     if ( Fields[0].AsDateTime > 0 ) then
                        LastCalvDate := Fields[0].AsDateTime;
               except
               end;
            finally
               Free;
            end;
         if ( (mdCalvingHeader.FieldByName('CalvingDate').AsDateTime - LastCalvDate) < 300 ) then
            MessageDlg(Format('It is less than 300 days (%d days), since the last calving!',[Trunc(mdCalvingHeader.FieldByName('CalvingDate').AsDateTime - LastCalvDate)]),mtWarning,[mbOK],0)
         else if ( (mdCalvingHeader.FieldByName('CalvingDate').AsDateTime - LastCalvDate) < 335 ) then
            MessageDlg(Format('It is less than 11 months (%d days), since the last calving!',[Trunc(mdCalvingHeader.FieldByName('CalvingDate').AsDateTime - LastCalvDate)]),mtWarning,[mbOK],0);
         FCalvingIntervalChecked := True;
      end;
end;

procedure TfmCalvingEvent.SetProjectedDateText ( AAnimalID, AAnimalLactNo : Integer; const AServiceDate : TDateTime = 0 );
begin
   lProjectedDateText.Caption := '';
   //   12/02/19 [V5.8 R6.9] /MK Bug Fix - Default FProjectedCalvingDate to zero before checking if AServiceDate = 0, this will stop message for
   //                                      difference between calving date and projected for appearing for non service bulls.
   FProjectedCalvingDate := 0;

   //   22/02/16 [V5.5 R4.1] /MK Bug Fix - Default lProjectedDateText.Caption to blank and exit procedure is no Service Date specified.
   if ( AServiceDate = 0 ) then Exit;

   //   22/02/16 [V5.5 R4.1] /MK Change - Based Projected Calving date on last service rather than last PD or last service - GL/Hugh Collender request.
   FProjectedCalvingDate := GetProjCalvingDate_FromServOnly_BySQL(mdCalvingHeader.FieldByName('AnimalID').AsInteger,
                                                                  mdCalvingHeader.FieldByName('AnimalLactNo').AsInteger,
                                                                  AServiceDate);
   lProjected.Visible := ( FProjectedCalvingDate > 0 );
   lProjectedDateText.Visible := lProjected.Visible;
   if ( lProjectedDateText.Visible ) then
      lProjectedDateText.Caption := FormatDateTime('dd/mm/yy',FProjectedCalvingDate);
end;

procedure TfmCalvingEvent.dbCalvingDateEnter(Sender: TObject);
begin
   inherited;
   PostMessage(Handle, WM_CXDATE_ONENTER_MESSAGE, Integer(Sender), 0);
end;

procedure TfmCalvingEvent.CallWinMessage(var Message: TMessage);
begin
   TcxDateEdit(Message.WParam).SelStart := 0;
   TcxDateEdit(Message.WParam).SelLength := 2;
end;

function TfmCalvingEvent.ShowBullList_AfterActDate_ProjDateMsg : Boolean;
var
   iProjDateDiff : Integer;
begin
   Result := False;
   if ( FFormShowing ) then
      if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
         if ( not(FDiffBetweenActAndProjDateChecked) ) then
            if ( FProjectedCalvingDate > 0 ) then
               begin
                  iProjDateDiff := 0;
                  //   06/02/18 [V5.7 R8.0] /MK Bug Fix - Changed from CalvingHeader.CalvingDate value to dbCalvingDate.Date as date wasn't table value wasn't changed at this point - Ellen Daly.
                  if ( FProjectedCalvingDate > dbCalvingDate.Date ) then
                     iProjDateDiff := Trunc(FProjectedCalvingDate - dbCalvingDate.Date)
                  else if ( dbCalvingDate.Date > FProjectedCalvingDate ) then
                     iProjDateDiff := Trunc(dbCalvingDate.Date - FProjectedCalvingDate);
                  if ( iProjDateDiff > 10 ) then
                     begin
                        FDiffBetweenActAndProjDateChecked := True;
                        Result := ( MessageDlg('Your Actual Calving Date differs from Projected Calving Date (based on last service) by more than 10 days.'+cCRLF+
                                               'Do you wish to review the cow''s service record?',mtWarning,[mbYes,mbNo],0) = mrYes );
                        if ( Result ) then
                           begin
                              dbBullUsed.SetFocus;
                              if ( not(FTVBullListSetup) ) and ( not(CanShowtvBullList) ) then
                                 dbBullUsed.DroppedDown := True;
                           end;
                     end;
               end;
end;

procedure TfmCalvingEvent.dbBullUsedPropertiesPopup(Sender: TObject);
var
   i : Integer;
begin
   inherited;
   if ( FAddAmendOrDeleteCalving = ctAmendCalving ) then Exit;
   if ( not(CanShowtvBullList) ) then Exit;
   //   30/01/20 [V5.9 R2.1] /MK Bug Fix - Only pop up tvBullList if there are items regardless if Stock Bull events exist - Con Cremin.
   if ( tvBullList.Items.Count = 0 ) then Exit;

   try
     keybd_event( VK_ESCAPE, Mapvirtualkey( VK_ESCAPE, 0 ), 0, 0);
     tvBullList.Left := dbBullUsed.Left;
     //   24/10/18 [V5.8 R4.1] /MK Change - Default tvBullList (StockBull Events) to default dbBullUsed.DropDownWidth.
     tvBullList.Width := 200;
     for i := 0 to tvBullList.Items.Count-1 do
        begin
           //   24/10/18 [V5.8 R4.1] /MK Change - If any of the items in the tvBullList have children i.e. have StockBullEvent dates, then set width to 500 to show dates.
           if ( tvBullList.Items[i].HasChildren ) then
              begin
                 tvBullList.Width := 550;
                 Exit;
              end
           else
              begin
                 tvBullList.Hide;
                 Exit;
              end;
        end;
  finally
     if ( not(tvBullList.Visible) ) then
        tvBullList.Show
     else
        tvBullList.Hide;
  end;
end;

procedure TfmCalvingEvent.FormControlMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   inherited;
   HideTreeViewList;
end;

procedure TfmCalvingEvent.HideTreeViewList;
begin
   if ( tvBullList.Visible ) then
      tvBullList.Hide;
end;

procedure TfmCalvingEvent.ActionListExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
   inherited;
   HideTreeViewList;
end;

procedure TfmCalvingEvent.SetupBullTreeListView;
var
   Node,
   ChildNode : TTreeNode;
   qStockBullEvents : TQuery;
   dBullInDate,
   dBullOutDate : TDateTime;
   sChildNodeTxt : String;
   iBullID : Integer;
   dCheckDate : TDateTime;
begin
   dBullInDate := 0;
   dBullOutDate := 0;
   sChildNodeTxt := '';
   iBullID := 0;
   try
      if ( FBullList.RecordCount = 0 ) then Exit;
      if ( FBullList.RecordCount >= 7 ) then
         tvBullList.Height := cSingleTreeViewItemHeight * 7
      else
         tvBullList.Height := cSingleTreeViewItemHeight * FBullList.RecordCount;

      qStockBullEvents := TQuery.Create(nil);
      try
         qStockBullEvents.DatabaseName := AliasName;
         qStockBullEvents.SQL.Clear;
         qStockBullEvents.SQL.Add('SELECT ID, AnimalID, EventDesc, EventDate');
         qStockBullEvents.SQL.Add('FROM Events');
         qStockBullEvents.SQL.Add('WHERE (EventType = :StockBullEvent)');
         if ( mdCalvingHeader.FieldByName('AnimalLactNo').AsInteger > 0 ) then
            dCheckDate := WinData.BreedingDataHelper.GetLastEventDate(mdCalvingHeader.FieldByName('AnimalID').AsInteger,
                                                                      cCalvingEvent,
                                                                      mdCalvingHeader.FieldByName('CalvingDate').AsDateTime)
         else
            dCheckDate := IncYear(mdCalvingHeader.FieldByName('CalvingDate').AsDateTime,-1);
         qStockBullEvents.SQL.Add('AND   (EventDate BETWEEN "'+FormatDateTime(cUSDateStyle,dCheckDate)+'" AND "'+FormatDateTime(cUSDateStyle,mdCalvingHeader.FieldByName('CalvingDate').AsDateTime)+'")');
         qStockBullEvents.SQL.Add('AND   ((Upper(EventDesc) = "STOCK BULL IN") OR (Upper(EventDesc) = "STOCK BULL OUT"))');
         qStockBullEvents.SQL.Add('ORDER BY ID, EventDate');
         qStockBullEvents.Params[0].AsInteger := CStockBullEvent;
         qStockBullEvents.Open;

         FBullList.First;
         tvBullList.Items.BeginUpdate;
         tvBullList.Items.Clear;
         while ( not(FBullList.Eof) ) do
            begin
               iBullID := 0;
               iBullID := FBullList.FieldByName('BullID').AsInteger;
               if ( FSelectedBullID = 0 ) then
                  FSelectedBullID := iBullID;
               if ( FBullList.FieldByName('EventDate').AsDateTime > 0 ) then
                  Node := tvBullList.Items.AddChild(nil,FBullList.FieldByName('BullNo').AsString+' '+DateToStr(FBullList.FieldByName('EventDate').AsDateTime))
               else
                  Node := tvBullList.Items.AddChild(nil,FBullList.FieldByName('BullNo').AsString);
               Node.Data := Pointer(iBullID);
               if ( not(FStockBullEventQuery.Active) ) then
                  FStockBullEventQuery.Open;
               if ( FStockBullEventQuery.Locate('BullID',iBullID,[]) ) then
                  begin
                     qStockBullEvents.Filter := '';
                     qStockBullEvents.Filtered := False;
                     qStockBullEvents.Filter := 'AnimalID = '+IntToStr(iBullID);
                     qStockBullEvents.Filtered := True;
                     if ( not(qStockBullEvents.IsEmpty) ) then
                        begin
                           qStockBullEvents.First;
                           dBullInDate := 0;
                           dBullOutDate := 0;
                           while ( not(qStockBullEvents.Eof) ) do
                              begin
                                 if ( dBullInDate = 0 ) and
                                    ( UpperCase(qStockBullEvents.Fields[2].AsString) = 'STOCK BULL IN' ) then
                                    dBullInDate := qStockBullEvents.Fields[3].AsDateTime
                                 else if ( UpperCase(qStockBullEvents.Fields[2].AsString) = 'STOCK BULL OUT' ) and
                                         ( qStockBullEvents.Fields[3].AsDateTime > dBullInDate ) then
                                    dBullOutDate := qStockBullEvents.Fields[3].AsDateTime;

                                 sChildNodeTxt := '';
                                 if ( dBullInDate > 0 ) and ( dBullOutDate > 0 ) then
                                    begin
                                       sChildNodeTxt := 'Bull In : '+DateToStr(dBullInDate)+' Proj : '+FormatDateTime('dd/mm/yy',GetProjCalvingDate_FromBullBreed_BySQL(iBullID,dBullInDate))+'      '+
                                                        'Bull Out : '+DateToStr(dBullOutDate)+' Proj : '+FormatDateTime('dd/mm/yy',GetProjCalvingDate_FromBullBreed_BySQL(iBullID,dBullOutDate))+'';
                                       if ( Length(sChildNodeTxt) > 0 ) then
                                          begin
                                             ChildNode := tvBullList.Items.AddChild(Node,sChildNodeTxt);
                                             ChildNode.Data := Pointer(0);
                                          end;
                                    end;
                                 qStockBullEvents.Next;
                              end;
                        end;
                  end;
               FBullList.Next;
            end;
         tvBullList.Items.EndUpdate;
         //   24/10/18 [V5.8 R4.1] /MK Change - If FSelectedBullID is assigned from StockBull events then set dbBullUsed to FSelectedBullID.
         if ( FSelectedBullID > 0 ) and ( dbBullUsed.EditValue <= 0 ) then
            begin
               if ( dbBullUsed.DataBinding.DataSource.DataSet.State = dsBrowse ) then
                   dbBullUsed.DataBinding.DataSource.DataSet.Edit;
               dbBullUsed.EditValue := FSelectedBullID;
               OnBullUsedChange_CloseUp(nil);
            end;
         FTVBullListSetup := ( tvBullList.Items.Count > 0 );
      finally
         if ( qStockBullEvents <> nil ) then
            begin
               qStockBullEvents.Close;
               qStockBullEvents.Free;
            end;
      end;
   except
      on e : Exception do
         ShowMessage(e.Message);
   end;
end;

procedure TfmCalvingEvent.tvBullListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   Node : TTreeNode;
begin
   inherited;
   Node := tvBullList.Selected;
   if ( Node.Data = nil ) then Exit;
   if ( Integer(Node.Data) <> FSelectedBullID ) then
      begin
         FSelectedBullID := Integer(Node.Data);
         if ( dbBullUsed.DataBinding.DataSource.DataSet.State = dsBrowse ) then
             dbBullUsed.DataBinding.DataSource.DataSet.Edit;
         dbBullUsed.EditValue := FSelectedBullID;
         OnBullUsedChange_CloseUp(nil);
         tvBullList.Hide;
      end;
end;

function TfmCalvingEvent.GetIsCalvingChanged: Boolean;
begin
   Result := ( FAddAmendOrDeleteCalving = ctAmendCalving );
   if ( Result ) then
      begin
         Result := ( FDamIDChanged ) or ( FCalvingDateChanged ) or ( FBullUsedChanged ) or
                   ( FCalvingSurveyChanged ) or ( FCalvingCommentChanged ) or ( WinData.CalvingDeleted ) or
                   ( FCalvingFeedGroupIDChanged ) or ( FCalfStatusChanged ) or
                   ( FCalfAddedToModifiedCalving );
         if ( RemovedCalves.Active ) then
            Result := ( RemovedCalves.RecordCount > 0 );
      end;
end;

procedure TfmCalvingEvent.SaveCalving;
begin
   if ( mdCalvingHeader.State in dsEditModes ) then
      mdCalvingHeader.Post;
   if ( mdCalvingDetail.State in dsEditModes ) then
      mdCalvingDetail.Post;

   FExitWithoutSaving := ( (FAddAmendOrDeleteCalving = ctAmendCalving) and (not(IsCalvingChanged)) );
   if ( FExitWithoutSaving ) then Exit;

   ValidateCalving();

   if ( ShowBullList_AfterActDate_ProjDateMsg ) then Exit;

   if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
      CheckDamDrugWithdrawalPeriod();

   if ( MessageDlg('Are all the details correct?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
       SysUtils.Abort;

   if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
      CreateCalving()
   else
      UpdateCalving();

   SetCalfRegReminderifRequired();

   ShowDeptWarningForRegCalves();

   WinData.CalvingSaved := True;
end;

procedure TfmCalvingEvent.dbCalfColourPropertiesChange(Sender: TObject);
begin
   inherited;
   if ( dbCalfColour.EditValue > 0 ) then
      WinData.DefaultColour := dbCalfColour.EditValue;
end;

procedure TfmCalvingEvent.GenerateCalfAnimalNo;
begin
   if ( WinData.GlobalSettings.NatIDToAnimalNo ) then
      begin
         if ( Length(StripAllSpaces(mdCalvingDetail.FieldByName('CalfNatID').AsString)) in [14, 15] ) then
            begin
               mdCalvingDetail.FieldByName('CalfAnimalNo').Clear;
               GetAnimalNoFromNatIDNum(mdCalvingDetail.FieldByName('CalfNatID').AsString);
            end;
      end;
end;

procedure TfmCalvingEvent.dbCalvingDatePropertiesChange(Sender: TObject);
var
   sMessage : String;
   iProjDateDiff : Integer;
begin
   inherited;
   if ( Length(dbCalvingDate.EditingText) = 0 ) then Exit;
   if ( Length(dbCalvingDate.EditingText) < 10 ) then Exit;

   dbCalvingDate.PostEditValue;

   if ( dbCalvingDate.Date > 0 ) and ( dbCalvingDate.Date > Date ) then
      begin
        MessageDlg('Calving Date cannot be after today.'+cCRLF+
                   'Reverting to todays date.',mtError,[mbOK],0);
        //   05/02/16 [V5.5 R2.7] /MK Bug Fix - Program kept reverting to invalid date because PostEditValue saves future date into database
        //                                      and check was allowing posted date to be saved to calving record. Always revert to today.
        dbCalvingDate.Date := Date;
        SysUtils.Abort;
      end;

   //   23/10/18 [V5.8 R4.0] /MK Change - Give a warning message if adding an animal in an Irish herd and the date is less then 28 days from today - Peter Twoomey.
   if ( FAddAmendOrDeleteCalving = ctAddCalving ) and ( FCountry = Ireland ) then
      if ( dbCalvingDate.Date > 0 ) and ( dbCalvingDate.Date < (Date-28) ) then
         if ( MessageDlg('The calving date is less than required 28 days for AIM Registration.'+cCRLF+
                         'Do you wish to continue with this date?',mtWarning,[mbYes,mbNo],0) = mrNo ) then
            begin
               dbCalvingDate.Date := Date;
               SysUtils.Abort;
            end;

   GetGeneticDamNumber(dbCalvingDate.Date);

   if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
      begin
         //   22/02/16 [V5.5 R4.1] /MK Additional Feature - If user changes the calving date and the new date differs to the projected calving date
         //                                                 by more than 10 days then show the user a prompt to view the bull used list - GL/Hugh Collender request.
         if ( mdCalvingHeader.FieldByName('CalvingDate').OldValue > 0 ) and ( mdCalvingHeader.FieldByName('CalvingDate').OldValue <> Null ) then
            if ( dbCalvingDate.Date <> mdCalvingHeader.FieldByName('CalvingDate').OldValue ) then
               ShowBullList_AfterActDate_ProjDateMsg;
      end
   else
      begin
         FCalvingDateChanged := False;
         if ( FExistingCalvingRecord.CREventDate > 0 ) and ( dbCalvingDate.Date > 0 ) and
            ( dbCalvingDate.Date <> FExistingCalvingRecord.CREventDate ) then
            begin
               if ( mdCalvingDetail.State in dsEditModes ) then
                  mdCalvingDetail.Post;
               sMessage := 'Are you sure you want to change the calving date of this cow?'+cCRLF;
               if ( mdCalvingDetail.RecordCount > 1 ) then
                  sMessage := sMessage + 'This will also update the date of birth of the calves.'
               else if ( mdCalvingDetail.RecordCount = 1 ) then
                  sMessage := sMessage + 'This will also update the date of birth of the calf.';
               if ( FCountry = Ireland ) and ( mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean ) then
                  sMessage := sMessage + cCRLF + cContactAgfoodInfoText;
               FCalvingDateChanged := ( MessageDlg(sMessage,mtConfirmation,[mbYes,mbNo],0) = mrYes );
               if ( not(FCalvingDateChanged) ) and ( mdCalvingHeader.FieldByName('CalvingDate').AsDateTime > 0 ) then
                  begin
                     dbCalvingDate.Date := mdCalvingHeader.FieldByName('CalvingDate').AsDateTime;
                     GetGeneticDamNumber(dbCalvingDate.Date);
                  end;
            end;
      end;

   CheckDamDrugWithdrawalPeriod();

   CheckCalvingInterval;

   if ( not(FTVBullListSetup) ) then
      if ( CanShowtvBullList ) then
         SetupBullTreeListView;
end;

procedure TfmCalvingEvent.DeleteCalving;
var
   DamID : Integer;
   DamLactNo : Integer;
   CalfArray : Array [1..4] of Integer;
   CalfDeadArray : Array [1..4] of Boolean;
   CalfIDs : string;
   i : Integer;
   FlagEventWarning : Boolean;
   MsgText : String;
   TempQuery,
   CalvingsQuery : TQuery;

   procedure ShiftDamNewIDEvents;
   var
      NewIDs : TIntegerArray;
      sNewIDs : string;
   begin
      // If the dam that the calving is being deleted for has a NewID event(s) then it has to be moved back to previous lactation
      // as New ID events are system generated events and can't be deleted by the user.
      with TQuery.Create(nil) do
         try
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT ID');
               SQL.Add('FROM Events');
               SQL.Add('WHERE (EventType = '+IntToStr(CNewIDEvent)+')');
               SQL.Add('AND   (AnimalID = '+IntToStr(FSelectedDam.Id)+')');
               SQL.Add('AND   (AnimalLactNo = '+IntToStr(FSelectedDam.LactNo)+')');
               Open;
               if ( RecordCount > 0 ) then
               while ( not(Eof) ) do
                  begin
                     SetLength(NewIDs, Length(NewIDs)+1);
                     NewIDs[Length(NewIDs)-1] := Fields[0].AsInteger;
                     Next;
                  end;
               if ( Length(NewIDs) > 0 ) then
                  begin
                     sNewIDs := IntArrayToSQLInString(NewIDs);
                     SQL.Clear;
                     SQL.Add('UPDATE Events');
                     SQL.Add('SET AnimalLactNo = AnimalLactNo-1');
                     SQL.Add('WHERE ID IN '+sNewIDs+'');
                     ExecSQL;
                  end;
            except
            end;
         finally
            Free;
         end;
   end;

   procedure DeleteCalvesNewIdEvents();
   var
       i : Integer;
   begin
      {
      Clear off any NewID Events Associated with the calf record, these NewID Events
      are created when animal record is created as part of calving event for
      ICBF purposes.
      }
      for i := Low(CalfArray) to High(CalfArray) do
         begin
           if (CalfArray[i] <=0 ) then continue;
           TempQuery.Close;
           TempQuery.SQL.Clear;
           TempQuery.SQL.Add('DELETE FROM Events');
           TempQuery.SQL.Add('WHERE ( AnimalID = :AnimalID )');
           TempQuery.SQL.Add('AND   ( EventType = :NewIDEvents )');
           TempQuery.Params.ParamByName('AnimalID').AsInteger := CalfArray[i];
           TempQuery.Params.ParamByName('NewIDEvents').AsInteger := CNewIDEvent;
           TempQuery.ExecSQL;
         end;
    end;

   procedure DeleteCalvesSaleDeathEvents;
   var
      i, iDeathEventID, iCalfID : Integer;
   begin
      for i := Low(CalfArray) to High(CalfArray) do
         begin
            if ( CalfArray[i] <= 0 ) or (CalfDeadArray[i] = False) then Continue;
            TempQuery.SQL.Clear;
            TempQuery.SQL.Add('SELECT E.ID');
            TempQuery.SQL.Add('FROM Events E');
            TempQuery.SQL.Add('WHERE (E.AnimalID = '+IntToStr(iCalfID)+')');
            TempQuery.SQL.Add('AND   (E.EventType = '+IntToStr(CSaleDeathEvent)+')');
            TempQuery.Open;
            if ( TempQuery.RecordCount > 0 ) then
               try
                  iDeathEventID := TempQuery.Fields[0].AsInteger;
                  if ( iDeathEventID <= 0 ) then Continue;

                  TempQuery.Close;
                  TempQuery.SQL.Clear;
                  TempQuery.SQL.Add('DELETE FROM SalesDeaths');
                  TempQuery.SQL.Add('WHERE EventID = '+IntToStr(iDeathEventID)+'');
                  TempQuery.ExecSQL;

                  TempQuery.SQL.Clear;
                  TempQuery.SQL.Add('DELETE FROM Events');
                  TempQuery.SQL.Add('WHERE ID = '+IntToStr(iDeathEventID)+'');
                  TempQuery.ExecSQL;

                  //   25/08/17 [V5.7 R2.1] /MK Bug Fix - A bracket after animalid line which didn't need to be there.
                  TempQuery.SQL.Clear;
                  TempQuery.SQL.Add('UPDATE Animals');
                  TempQuery.SQL.Add('SET InHerd = True');
                  TempQuery.SQL.Add('WHERE ID = '+IntToStr(CalfArray[i])+'');
                  TempQuery.ExecSQL;
               except
                  on e : Exception do
                     begin
                        ApplicationLog.LogException(e);
                        ApplicationLog.LogError(Format('Error deleting sale death event for animal %d.',[iCalfID])); 
                     end;
               end;
         end;
   end;

   procedure DeleteCalvesWeighingEvents();
   var
      CalfBirthDate : TDateTime;
      i, iWeighingID : Integer;

   begin
      for i := Low(CalfArray) to High(CalfArray) do
         begin
            if ( CalfArray[i] <= 0 ) then Continue;

            TempQuery.Close;
            TempQuery.SQL.Clear;
            TempQuery.SQL.Add('SELECT DateOfBirth, BirthWeight');
            TempQuery.SQL.Add('FROM Animals');
            TempQuery.SQL.Add('WHERE (ID = :ACalfID)');
            TempQuery.Params[0].AsInteger := CalfArray[i];
            TempQuery.Open;

            TempQuery.First;
            if ( TempQuery.Fields[0].AsDateTime <= 0 ) then Exit;
            CalfBirthDate := TempQuery.Fields[0].AsDateTime;

            TempQuery.Close;
            TempQuery.SQL.Clear;
            TempQuery.SQL.Add('SELECT ID');
            TempQuery.SQL.Add('FROM Events');
            TempQuery.SQL.Add('WHERE (AnimalID = :ACalfID)');
            TempQuery.SQL.Add('AND (EventType = :WeighingEvent)');
            TempQuery.SQL.Add('AND (EventDate = :WeighingDate)');
            TempQuery.Params[0].AsInteger := CalfArray[i];
            TempQuery.Params[1].AsInteger := CWeightEvent;
            TempQuery.Params[2].AsDateTime := CalfBirthDate;
            TempQuery.Open;
            if ( TempQuery.Fields[0].AsInteger <=0 ) then Exit;
            iWeighingID := TempQuery.Fields[0].AsInteger;

            TempQuery.Close;
            TempQuery.SQL.Clear;
            TempQuery.SQL.Add('DELETE FROM Weights');
            TempQuery.SQL.Add('WHERE EventID = :WeighingID');
            TempQuery.Params[0].AsInteger := iWeighingID;
            TempQuery.ExecSQL;

            TempQuery.SQL.Clear;
            TempQuery.SQL.Add('DELETE FROM Events');
            TempQuery.SQL.Add('WHERE ID = :WeighingID');
            TempQuery.Params[0].AsInteger := iWeighingID;
            TempQuery.ExecSQL;
         end;
   end;

begin
   FillChar(CalfArray, SizeOf(CalfArray), 0);
   FillChar(CalfDeadArray, SizeOf(CalfDeadArray), False);

   if ( FEventID <= 0 ) then
      begin
         MessageDlg('Invalid EventID - contact Kingswood',mtError,[mbOK],0);
         Exit;
      end;

   DamID := FSelectedDam.Id;
   if ( DamID <= 0 ) then
      begin
         MessageDlg('Event data is not valid - contact Kingswood',mtError,[mbOK],0);
         Exit;
      end;

   if ( WinData.IsCalvingEventIDRegistered(FEventID) ) then
      begin
         if ( mdCalvingDetail.State in dsEditModes ) then
            mdCalvingDetail.Post;
         if ( mdCalvingDetail.RecordCount = 1 ) then
            MsgText := 'NOTE: This calf has been registered.'
         else if ( mdCalvingDetail.RecordCount > 1 ) then
            MsgText := 'NOTE: Some or all of the calves have been registered.';
      end;

   if ( MessageDlg('You are about to delete this calving event and all associated calves.'+cCRLF+
                   'All calf details will be stored for future use.'+cCRLF+
                   MsgText+cCRLF+
                   'Are you sure you want to continue?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then  Exit;

   if ( WinData.KingData.InTransaction)  then
      begin
         MessageDlg('Transaction already active - unable to completed deletion.',mtError,[mbOK],0);
         Exit;
      end;

   FAddAmendOrDeleteCalving := ctDeleteCalving;

   DamLactNo := FSelectedDam.LactNo;

   try
      TempQuery := TQuery.Create(nil);
      with TempQuery do
         begin
            TempQuery.DatabaseName := AliasName;
            // Check for events after the cows calving event and exit if events (other than whats stated below) exist.
            TempQuery.SQL.Clear;
            TempQuery.SQL.Add('SELECT Count(ID) CountOfID');
            TempQuery.SQL.Add('FROM Events');
            TempQuery.SQL.Add('WHERE (AnimalID = :AnimalID)');
            TempQuery.SQL.Add('AND   (AnimalLactNo = :ELactNo)');
            TempQuery.SQL.Add('AND   (ID <> :EID )'); // dont include the calving event itself
            TempQuery.SQL.Add('AND   (EventType <> :NewIDEvent )'); // don't include new id allocation events
            TempQuery.Params.ParamByName('AnimalID').AsInteger := DamID;
            TempQuery.Params.ParamByName('ELactNo').AsInteger := DamLactNo;
            TempQuery.Params.ParamByName('EID').AsInteger := FEventID;
            TempQuery.Params.ParamByName('NewIDEvent').AsInteger := CNewIDEvent;
            try
               TempQuery.Open;
            except
            end;

            TempQuery.First;
            FlagEventWarning := ( TempQuery.FieldByName('CountOfID').AsInteger > 0);
            if ( FlagEventWarning ) then
               begin
                  MessageDlg('All events subsequent to this calving event'+cCRLF+
                             'must be deleted before continuing.',mtWarning,[mbOK],0);
                  Exit;
               end;

            // Now check to see if the event exists in the calvings table and move the calving record into the deleted calvings table for re-use.
            CalvingsQuery := TQuery.Create(nil);
            CalvingsQuery.DatabaseName := AliasName;
            CalvingsQuery.SQL.Clear;
            CalvingsQuery.SQL.Add('SELECT C.ID1, C.ID2, C.ID3, C.ID4,');
            CalvingsQuery.SQL.Add('       C.ID1Notified, C.ID2Notified, C.ID3Notified, C.ID4Notified,');
            CalvingsQuery.SQL.Add('       C.CalfDead1, C.CalfDead2, C.CalfDead3, C.CalfDead4');
            CalvingsQuery.SQL.Add('FROM Calvings C');
            CalvingsQuery.SQL.Add('WHERE C.EventID = '+IntToStr(FEventID)+'');
            try
               CalvingsQuery.Open;
               if ( CalvingsQuery.RecordCount > 0 ) then
                  begin
                     // Check for events of the calving
                     FillChar(CalfArray, SizeOf(CalfArray), 0);

                     CalfArray[1] := CalvingsQuery.FieldByName('ID1').AsInteger;
                     CalfArray[2] := CalvingsQuery.FieldByName('ID2').AsInteger;
                     CalfArray[3] := CalvingsQuery.FieldByName('ID3').AsInteger;
                     CalfArray[4] := CalvingsQuery.FieldByName('ID4').AsInteger;

                     CalfDeadArray[1] := CalvingsQuery.FieldByName('CalfDead1').AsBoolean;
                     CalfDeadArray[2] := CalvingsQuery.FieldByName('CalfDead2').AsBoolean;
                     CalfDeadArray[3] := CalvingsQuery.FieldByName('CalfDead3').AsBoolean;
                     CalfDeadArray[4] := CalvingsQuery.FieldByName('CalfDead4').AsBoolean;

                     for i := 1 to cMaxCalves do
                        if ( CalfArray[i] > 0 ) then
                           begin
                              if ( CalfIDs <> '' ) then
                                 CalfIDs := CalfIDs + ',' + IntToStr( CalfArray[i] )
                              else
                                 CalfIDs := IntToStr( CalfArray[i] );
                           end;

                     if ( Length(CalfIDs) <= 0 ) then
                        begin
                           MessageDlg('No calves associated with calving event have been found.',mtWarning,[mbOK],0);
                           Exit;
                        end;

                     // Get events of calves and if there are any events other than whats stated below then exit.
                     TempQuery.SQL.Clear;
                     TempQuery.SQL.Add('SELECT Count(ID) CID');
                     TempQuery.SQL.Add('FROM Events');
                     TempQuery.SQL.Add('WHERE (AnimalID = :AnimalID)');
                     TempQuery.SQL.Add('AND   NOT( (EventType = '+IntToStr(CSaleDeathEvent)+') AND');
                     TempQuery.SQL.Add('           (EventDate = "'+FormatDateTime(cUSDateStyle,mdCalvingHeader.FieldByName('CalvingDate').AsDateTime)+'") )');
                     TempQuery.SQL.Add('AND   NOT( (EventType = '+IntToStr(CWeightEvent)+') AND');
                     TempQuery.SQL.Add('           (EventDate = "'+FormatDateTime(cUSDateStyle,mdCalvingHeader.FieldByName('CalvingDate').AsDateTime)+'") )');
                     //   07/11/17 [V5.7 R4.3] /MK Bug Fix - Removed check for NewIDAllocation Date on date of calving as NewIDAllocation event is always created
                     //                                      on the date that the event is entered.
                     TempQuery.SQL.Add('AND   NOT( (EventType = '+IntToStr(CNewIDEvent)+') )');
                     for i := Low(CalfArray) to High(CalfArray) do
                        if ( CalfArray[i] > 0 ) then
                           begin
                              TempQuery.Params.ParamByName('AnimalID').AsInteger := CalfArray[i];
                              TempQuery.Active := True;
                              try
                                 TempQuery.First;
                                 FlagEventWarning := ( TempQuery.FieldByName('CID').AsInteger > 0 );
                              finally
                                 TempQuery.Active := False;
                              end;
                           end;

                     //   17/05/17 [V5.6 R8.1] /MK Change - Changed message to better explain to the user that only events that are not associated with
                     //                                     the birth of the animal i.e. weighing, new id allocation, death event, have to be deleted manually.
                     if ( FlagEventWarning ) then
                        begin
                           MessageDlg('All non-birth events associated with calve(s) must be deleted before continuing.',mtWarning,[mbOK],0);
                           Exit;
                        end;

                     // Now that there is no reason to exit out of the form the system will now go through the process of deleting the event.
                     //   23/11/16 [V5.6 R3.5] /MK Change - Firstly delete the calving event from the Dam and bring back its lactno - SP request.
                     WinData.KingData.StartTransaction;

                     DeleteCalvesWeighingEvents();
                     DeleteCalvesSaleDeathEvents();
                     DeleteCalvesNewIdEvents();

                     // Delete From Calvings Table
                     TempQuery.Close;
                     TempQuery.SQL.Clear;
                     TempQuery.SQL.Add('DELETE FROM Calvings');
                     TempQuery.SQL.Add('WHERE ( EventID = :EID )');
                     TempQuery.Params[0].AsInteger := FEventID;
                     TempQuery.ExecSQL;

                     CalfIDs := '(' + CalfIDs + ')';

                     // Update calves record
                     TempQuery.SQL.Clear;
                     TempQuery.SQL.Add('UPDATE Animals');
                     TempQuery.SQL.Add('SET DamID = Null, AnimalDeleted = TRUE, HerdID = Null');
                     TempQuery.SQL.Add('WHERE (ID IN '+CalfIDs+')');
                     TempQuery.ExecSQL;

                     // Create a record in deletedcalvings table!
                     TempQuery.SQL.Clear;
                     TempQuery.SQL.Add('SELECT * FROM DeletedCalvings');
                     TempQuery.SQL.Add('WHERE EventID = '+IntToStr(FEventID)+'');
                     TempQuery.Open;
                     if ( TempQuery.RecordCount = 0 ) then
                        begin
                           TempQuery.Close;
                           TempQuery.SQL.Clear;
                           TempQuery.SQL.Add('INSERT INTO DeletedCalvings (EventID, DamID, DamLactNo, CalfID1, CalfID2, CalfID3, CalfID4, DeleteDate, FullCalvingDeleted)');
                           TempQuery.SQL.Add('VALUES ('+IntToStr(FEventID)+', '+IntToStr(DamID)+', '+IntToStr(DamLactNo)+',');
                           TempQuery.SQL.Add('        '+IntToStr(CalfArray[1])+', '+IntToStr(CalfArray[2])+', '+IntToStr(CalfArray[3])+', '+IntToStr(CalfArray[4])+',');
                           TempQuery.SQL.Add('        "'+FormatDateTime(cUSDateStyle,Date)+'", TRUE)');
                           TempQuery.ExecSQL;
                        end
                     else if RecordCount > 0 then
                        begin
                           TempQuery.Close;
                           TempQuery.SQL.Clear;
                           TempQuery.SQL.Add('UPDATE DeletedCalvings');
                           TempQuery.SQL.Add('SET CalfID1 = '+IntToStr(CalfArray[1])+', CalfID2 = '+IntToStr(CalfArray[2])+', CalfID3 = '+IntToStr(CalfArray[3])+', CalfID4 = '+IntToStr(CalfArray[4])+',');
                           TempQuery.SQL.Add('    DeleteDate = "'+FormatDateTime(cUSDateStyle,Date)+'", FullCalvingDeleted = TRUE');
                           TempQuery.SQL.Add('WHERE EventID = '+IntToStr(FEventID)+'');
                           TempQuery.ExecSQL;
                        end;

                     //   16/03/16 [V5.5 R5.4] /MK Bug Fix - KingData.InTransaction/StartTransaction/Commit was left out of the DeleteCalving routine as WinData.Calvings/Events
                     //                                      was not used at the start of the DeleteCalving routine to locate the event. WinData.Calvings/Events are still not used
                     //                                      here as we know the eventID coming into this form - SP suggested the KingData.InTransaction/StartTransaction/Commit should
                     //                                      be added back in just case there is an error in the database during the delete by SQL.
                     ShiftDamNewIDEvents;

                     TempQuery.SQL.Clear;
                     TempQuery.SQL.Add('UPDATE Animals');
                     TempQuery.SQL.Add('SET LactNo = LactNo-1');
                     TempQuery.SQL.Add('WHERE ( ID = :DamID )');
                     TempQuery.SQL.Add('AND   ( LactNo > 0 )');
                     TempQuery.Params[0].AsInteger := DamID;
                     TempQuery.ExecSQL;

                     TempQuery.SQL.Clear;
                     TempQuery.SQL.Add('DELETE FROM Events');
                     TempQuery.SQL.Add('WHERE ( ID = :EID )');
                     TempQuery.Params[0].AsInteger := FEventID;
                     TempQuery.ExecSQL;

                     WinData.KingData.Commit;

                     WinData.CalvingDeleted := True;

                  end;
            except
               on e : Exception do
                  begin
                     if WinData.KingData.InTransaction then
                        WinData.KingData.Rollback;
                     ApplicationLog.LogException(e);
                     MessageDlg('An error occurred while deleting calving event - contact Kingswood.',mtError,[mbOK],0);
                  end;
            end;
         end;

   finally
      if ( CalvingsQuery <> nil ) then
         FreeAndNil(CalvingsQuery);
      FreeAndNil(TempQuery);

      if ( WinData.CalvingDeleted ) then
         Close;
   end;
end;

procedure TfmCalvingEvent.OnBullUsedChange_CloseUp(Sender: TObject);
var
   sMessage : String;
   bCalfIsRegistered : Boolean;
begin
   inherited;
   lSireNameText.Caption := '';
   if ( dbBullUsed.EditValue = 0 ) or ( dbBullUsed.EditValue = Null ) then Exit;

   if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
      begin
         if mdCalvingHeader.State = dsBrowse then
            mdCalvingHeader.Edit;
         mdCalvingHeader.FieldByName('BullUsed').AsInteger := dbBullUsed.EditValue;
         if ( (dbBullUsed.EditValue <> Null) and (dbBullUsed.EditValue <> '0') ) then
            if ( FBullList.Locate('BullID',dbBullUsed.EditValue,[]) ) then
               SetProjectedDateText(mdCalvingHeader.FieldByName('AnimalID').AsInteger,
                                    mdCalvingHeader.FieldByName('AnimalLactNo').AsInteger,
                                    FBullList.FieldByName('EventDate').AsDateTime);
      end
   else
      begin
         FBullUsedChanged := False;
         //   16/11/15 [V5.5 R0.7] /MK Bug Fix - If editing and existing calving record's sire breed is 0 (missing/blank) then allow change of sire & calf breed.
         if ( FExistingCalvingRecord.CRSireID >= 0 ) and ( dbBullUsed.EditValue <> FExistingCalvingRecord.CRSireID ) then
            begin
               if ( mdCalvingDetail.State in dsEditModes ) then
                  mdCalvingDetail.Post;
               sMessage := 'Are you sure you want to change the sire of this calving?'+cCRLF+
                           'This will also update the sire ';
               mdCalvingDetail.First;
               mdCalvingDetail.DisableControls;
               while ( not(mdCalvingDetail.Eof) ) do
                  begin
                     bCalfIsRegistered := mdCalvingDetail.FieldByName('CalfIsRegistered').AsBoolean;
                     if ( bCalfIsRegistered ) then
                        Break;
                     mdCalvingDetail.Next;
                  end;
               mdCalvingDetail.EnableControls;
               if ( not(bCalfIsRegistered) ) then
                  sMessage := sMessage + 'and breed ';
               if ( mdCalvingDetail.RecordCount > 1 ) then
                  sMessage := sMessage + 'of the calves.'
               else if ( mdCalvingDetail.RecordCount = 1 ) then
                  sMessage := sMessage + 'of the calf.';
               FBullUsedChanged := ( MessageDlg(sMessage,mtConfirmation,[mbYes,mbNo],0) = mrYes );
               if ( FBullUsedChanged ) then
                  mdCalvingHeader.FieldByName('BullUsed').AsInteger := dbBullUsed.EditValue
               else
                  dbBullUsed.EditValue := mdCalvingHeader.FieldByName('BullUsed').AsInteger;
            end;
      end;
   lSireNameText.Caption := GetPedigreeName(dbBullUsed.EditValue);

   if ( (not(mdCalvingHeader.FieldByName('BullUsed').IsNull)) and (mdCalvingHeader.FieldByName('BullUsed').AsInteger > 0) ) then
      begin
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT PrimaryBreed');
               SQL.Add('FROM Animals');
               SQL.Add('WHERE (ID =:ID)');
               Params[0].AsInteger := mdCalvingHeader.FieldByName('BullUsed').AsInteger;
               Open;
               try
                  if ( RecordCount = 1 ) then
                     begin
                        First;
                        //   22/10/18 [V5.8 R4.0] /MK Bug Fix - When editing a calving and changing the bull an Access Violation error appeared.
                        //                                      I added try accept here as Access Violation was caused by mdCalvingHeader not being in dsEditModes.
                        if ( not(mdCalvingHeader.State in dsEditModes) ) then
                           mdCalvingHeader.Edit;
                        mdCalvingHeader.FieldByName('BullUsedBreedID').AsInteger := Fields[0].AsInteger;
                        ChangeCalfBreed();
                     end
               finally
                  Close;
               end;
            finally
               Free;
            end;
      end;
end;

procedure TfmCalvingEvent.dbCalvingDatePropertiesInitPopup(Sender: TObject);
begin
   inherited;
   if ( Sender is TcxDBDateEdit ) then
      (Sender as TcxDBDateEdit).Style.Color := clWhite;
end;

procedure TfmCalvingEvent.dbCalvingDatePropertiesCloseUp(Sender: TObject);
begin
   inherited;
   if ( Sender is TcxDBDateEdit ) then
      (Sender as TcxDBDateEdit).Style.Color := clTeal;
end;

procedure TfmCalvingEvent.dbCalfBreedPropertiesChange(Sender: TObject);
begin
   inherited;
   if ( FCountry <> Ireland ) and ( mdCalvingDetail.State in dsEditModes ) then
      mdCalvingDetail.FieldByName('CalfIsPedigree').AsBoolean := ( not(BreedCodeIsCrossBreed(HerdLookup.BreedDetailsByID(mdCalvingDetail.FieldByName('CalfBreedID').AsInteger,'Code'))) );
end;

function TfmCalvingEvent.GetCanShowtvBullList: Boolean;
var
   qStockBullEvent : TQuery;
begin
   Result := ( FAddAmendOrDeleteCalving = ctAddCalving );
   if ( not(Result) ) then Exit;
   Result := FStockBullEventsExist;
   if ( not(Result) ) then Exit;
   qStockBullEvent := TQuery.Create(nil);
   with qStockBullEvent do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, EventDesc, EventDate');
         SQL.Add('FROM Events');
         SQL.Add('WHERE (EventType = :StockBullEvent)');
         SQL.Add('AND   (EventDate > "'+FormatDateTime(cUSDateStyle,IncYear(mdCalvingHeader.FieldByName('CalvingDate').AsDateTime,-1))+'")');
         SQL.Add('ORDER BY ID, EventDate');
         Params[0].AsInteger := CStockBullEvent;
         Open;
         Result := ( RecordCount > 0 );
      finally
         Free;
      end;
end;

procedure TfmCalvingEvent.CheckMemDataDuplicateNatID_AnimalNo;
{
var
   TempNatIdNo, TempAnimalNo : String;
}
begin
   {
   TempAnimalNo := mdCalvingDetail.FieldByName('CalfAnimalNo').AsString;
   if ( Length(TempAnimalNo) > 0 ) then
      begin
         if ( mdCalvingDetail.RecordCount > 1 ) then
            if ( Length(FCalfAnimalNumbers) > 0 ) then
               begin
                  if ( InArray(TempAnimalNo, FCalfAnimalNumbers) ) then
                     begin
                        MessageDlg(Format('Calf number %s is being used more than once for this calving.',[TempAnimalNo]),mtWarning,[mbOK],0);
                        SysUtils.Abort;
                     end
               end;
         if ( not(InArray(TempAnimalNo, FCalfAnimalNumbers)) ) then
            begin
               SetLength(FCalfAnimalNumbers,Length(FCalfAnimalNumbers)+1);
               FCalfAnimalNumbers[Length(FCalfAnimalNumbers)-1] := TempAnimalNo;
            end;
      end;

   TempNatIdNo := mdCalvingDetail.FieldByName('CalfNatID').AsString;
   if ( Length(TempNatIdNo) > 0 ) then
      begin
         if ( mdCalvingDetail.RecordCount > 1 ) then
            if ( Length(FCalfNatIDNumbers) > 0 ) then
               begin
                  if ( InArray(TempNatIdNo, FCalfNatIDNumbers) ) then
                     begin
                        MessageDlg(Format('Calf tag number %s is being used more than once for this calving.',[TempAnimalNo]),mtWarning,[mbOK],0);
                        SysUtils.Abort;
                     end
               end;
         if ( not(InArray(TempNatIdNo, FCalfNatIDNumbers)) ) then
            begin
               SetLength(FCalfNatIDNumbers,Length(FCalfNatIDNumbers)+1);
               FCalfNatIDNumbers[Length(FCalfNatIDNumbers)-1] := TempNatIdNo;
            end;
      end;
   }
end;

procedure TfmCalvingEvent.CheckCalfOtherDetails;
begin
   if ( FCountry <> Ireland ) then
      begin
         ApplicationLog.LogDebugMessage('ValidateAnimalDetails Mortality Check');
         if ( mdCalvingDetail.FieldByName('Mortality').AsString <> cStillBornMortality ) then
            begin
               if ( (mdCalvingDetail.FieldByName('CalfBreedID').IsNull) and (mdCalvingDetail.FieldByName('CalfBreedID').AsInteger = 0) ) and
                  ( (mdCalvingHeader.FieldByName('CalfBreedID').IsNull) and (mdCalvingHeader.FieldByName('CalfBreedID').AsInteger = 0) ) then
                  begin
                     MessageDlg(Format('Calf %s does not have a valid breed selected.',[mdCalvingDetail.FieldByName('CalfNatID').AsString]),mtError,[mbOK],0);
                     SysUtils.Abort;
                  end;
               if ( FCountry = NIreland ) then
                  if ( (mdCalvingDetail.FieldByName('CalfColour').IsNull) and (mdCalvingDetail.FieldByName('CalfColour').AsInteger = 0) ) then
                     begin
                        MessageDlg(Format('Calf %s does not have a colour selected.',[mdCalvingDetail.FieldByName('CalfNatID').AsString]),mtError,[mbOK],0);
                        SysUtils.Abort;
                     end;
            end;
      end;

   //   22/03/16 [V5.5 R5.4] /MK Bug Fix - Prompt user to select a disposal place if dead tagged selected and no disposal place selected - GL.
   ApplicationLog.LogDebugMessage('ValidateAnimalDetails Disposal Place Check');
   if ( FAddAmendOrDeleteCalving = ctAddCalving ) then
      if ( mdCalvingDetail.FieldByName('Mortality').AsString = cDeadAtBirthMortality ) then
         if ( (mdCalvingDetail.FieldByName('CalfDisposalPlace').IsNull) and (mdCalvingDetail.FieldByName('CalfDisposalPlace').AsInteger = 0) ) then
            begin
               MessageDlg('No disposal place selected for this dead tagged calf.'+cCRLF+
                          'Please select a disposal place.',mtError,[mbOK],0);
               SysUtils.Abort;
            end;

   ApplicationLog.LogDebugMessage('ValidateAnimalDetails CalfSex Check');
   if ( Length(mdCalvingDetail.FieldByName('CalfSex').AsString) = 0 ) then
       begin
          MessageDlg('No calf sex selected.',mtError,[mbOK],0);
          SysUtils.Abort;
       end;
end;

procedure TfmCalvingEvent.ValidateCalfTag;
var
   sNatID,
   TempCalfNatID : String;
   ValidTag : Boolean;

   procedure SetFocusOnCalfNatID;
   begin
      if cmboCalfNatID.Visible then
         cmboCalfNatID.SetFocus
      else
         dbCalfNatID.SetFocus;
   end;

begin
   ApplicationLog.LogDebugMessage('Valid Tag Check Start');

   TempCalfNatID := mdCalvingDetail.FieldByName('CalfNatID').AsString;
   //   20/04/17 [V5.6 R8.0] /MK Change - If country is not Ireland or NIreland then the tag is allowed to be blank.
   ApplicationLog.LogDebugMessage('Valid Tag Length Check');
   if ( FCountry in [Ireland, NIreland] ) then
      if ( Length(Trim(TempCalfNatID)) = 0 ) then
         begin
            MessageDlg(cInvalid_NatIdNo2+cCRLFx2+
                       'Please check you have entered the correct digits for the "Nat. Id. No." value.',mtError,[mbOK],0);
            SetFocusOnCalfNatID;
            SysUtils.Abort;
         end;

   ValidTag := False;

   // If the calf is alive, ensure National Id. No. is entered in full and is valid national id.
   ApplicationLog.LogDebugMessage('IsAbortedTag Check');
   if ( IsAbortedTag(TempCalfNatID) ) then Exit;

   if ( FCountry = Ireland ) then
      ValidTag := ( WhatStyleNatID(TempCalfNatID, False) <> Style1999 ) or
                  ( CheckNatID(TempCalfNatID, sNatID, TRUE) )
   else if ( FCountry = NIreland ) then
      ValidTag := CheckNINatID(TempCalfNatID, sNatID)
   //   20/04/17 [V5.6 R8.0] /MK Change - If not Ireland or NIreland then the tag is valid as we don't validate other countrie's tags.
   else
      ValidTag := True;

   if ( not(ValidTag) ) then
      begin
         MessageDlg(cInvalid_NatIdNo2+cCRLFx2+
                    'Please check you have entered the correct digits for the "Nat. Id. No." value.',mtError,[mbOK],0);
         ApplicationLog.LogDebugMessage('SetFocusOnCalfNatID Start');
         SetFocusOnCalfNatID;
         ApplicationLog.LogDebugMessage('SetFocusOnCalfNatID End');
         SysUtils.Abort
      end;

   ApplicationLog.LogDebugMessage('Valid Tag Check End');
end;

procedure TfmCalvingEvent.actHelpExecute(Sender: TObject);
begin
   inherited;
   if ( IsNetConnected ) then
      FCallProgram.CallCalvingHelp
   else
      MessageDlg('Unable to open calving online help.'+cCRLF+
                 'Please make sure your connected to the internet.',mtError,[mbOK],0);
end;

end.
