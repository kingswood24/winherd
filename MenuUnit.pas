unit MenuUnit;

{

 NOTE: New Fields Added to Animalstable must be defined in the cxAnimalGrid Column Definition

 // ***********************************************************************************************

 // TO DO : Grid Columns Damanimalno, DamNatID, SireAnimalNo must create sort click!!!!!!!!!!!!!!!
             
 // ***********************************************************************************************

 ------------------------------------------------------------------------------

 SP 30/09/2002:-

 New Procedure EnableBtn.
 To Disable a report button when clicked, and Enable it when report is closed.

 SP 30/09/2002.

 ------------------------------------------------------------------------------

 SP 15/11/2002:-

 OnFormActivate

 Remind user to download latest version.

 SP 15/11/2002:-

 ------------------------------------------------------------------------------

 SP 03/12/2002:-

 bBullsUsedInHerd button renamed to Bull Report and is now on gCowManagement
 group box.
 bSireSelect and bBrowseSireReg moved to the gQuotaPlanner group box.
 BullReports Group Box, which included the 3 above buttons was deleted.

 SP 03/12/2002.

 ------------------------------------------------------------------------------

 SP 30/01/2003:-

 If Herd is NI registered or "All Herds" is selected then hide
 Inter Herd Tranfer button.

 SP 30/01/2003.

 ------------------------------------------------------------------------------

 SP 13/02/2003:-

 Group Events and Management button's repositioned. Swapped around.

 SP 03/12/2003.

 ------------------------------------------------------------------------------

 SP 23/03/2003:- V3.6 R5.5

 New Module BeefAdmin Added to def.
 If def doesn't include BeefAdmin Hide Premiums and Premium Planner Reports/Menu Item.

 Show Events History/Current Lactation Button above event grid
 Show Feed Events/Events Button above event grid

 New column on animal grid TT ( Temp Tag )
 Option to display either Temp Tag or Retag Field. (Right click on grid to change between fields )

 Livestock Reconciliation - asked for by peter cosgrave.

 SP 23/03/2003:- V3.6 R5.5
 ------------------------------------------------------------------------------


 06/01/09 [V3.9 R5.6] /SP Additional Feature - Default cmboSearchColumns.ItemIndex to WinData.SearchField Value.
                                               eg. WinData.SearchField = 'AnimalNo' ... cmboSearchColumns.Text = 'Animal No.'

 08/01/2009 [V3.9 R5.7] /SP Additional Feature - Introduction of New Reports Screen Layout

 28/01/2009 [V3.9 R5.8] /SP Additional Feature - if NIreland system allow user to access https://eservices.ruralni.gov.uk/profile/login.asp via sbMartMovement click

 29/01/2009 [V3.9 R5.8] /SP Additional Feature - Notify HUK of animals moved onto farm, using grid and cart.

 29/01/2009 [V3.9 R5.8] /SP Bug Fix - Sort grid by Animal No., before animal no search is allowed. This is to facilitate an orderly search

 19/02/2009 [V3.9 R6.3] /SP Program Change - MainMenu - changed item captions / swapped items positions in the NewFeatures1 MenuItem.

 25/02/2009 [V3.9 R6.4] /SP Bug Fix - Calving Button Click - check if animal animal is cow before dry off check

 25/02/2009 [V3.9 R6.5] /SP Program Change - Allow easy access to Group Events, allow access to each group event
                       via the individual event.

 11/03/2009 [Dev V3.9 R6.6] /SP Program Change - Removed the option for Historical Livestock Nutrient Report ( for all countries "GL")

 23/07/10 [V4.0 R4.0] /MK Bug Fix - Days on Farm does not include Sale Date.

 17/08/10 [V4.0 R4.5] /MK Bug Fix - Check for AIBullListUpdate where HerdType <> Beef and Country is Ireland.

 14/09/10 [V4.0 R4.7] /MK Additional Feature - GL - Stop The Customer From Adding Calving If Date Is Less Than 3 Months Ago.

 23/11/10 [V4.0 R5.7] /MK Additional Feature - Added Call To LogMeIn Calling Card Program instead of LogMeIn Website.

 05/01/11 [V4.0 R7.5] /Additional Feature - Added Condition Score Column to AnimalGrid.

 29/01/11 [V4.0 R7.9] /MK Change Removed Highlights From pcMultipleAnimals and Changed Style of pcMultipleAnimals.

 01/02/11 [V4.0 R7.9] /MK/SP Bug Fix - Fixed Error on FormCreate With SQLFilters.

 01/02/11 [V4.0 R7.9] /MK/SP Bug Fix - Main Grid Headings Sire No, Dam No and Dam Nat ID are now checking to see if Dam or Sire is breeding
                                       and if Sire No, Dam No and Dam Nat ID have a value. If No Value or not Breeding then Drop-Down-List
                                       beside headings Sire No, Dam No and Dam Nat ID show no values.

 17/02/11 [V4.0 R8.2] /MK Change - Changed CIS Export to Kay Carson Weekly Export.

 21/02/11 [V4.0 R8.4] /MK Additional Feature - Added Support Numbers to Main Screen.

 23/02/11 [V4.0 R8.4] /MK Change - If System Is Ireland Then Show ConditionScore.

 25/02/11 [V4.0 R8.4] /MK Change - If System IS NI/UK Then Show New Create Milk Recorder File Option In mGroup (Calving Drop-Down).
                                 - Change Caption of Group Item Depending On UKMilkRecorder In OwnerFile.

 25/02/11 [V4.0 R8.5] /MK Change - Changed sbAddAnimalType To Add AI Sire and Removed Purchased InHerd Animal From pmAddAnimalType.

 01/03/11 [V4.0 R8.6] /MK Change - If Beef Herd Then Movements Click Not Premium/CalfReg Click.

 01/03/11 [V4.0 R8.6] /MK Change - Only Show cbShowAIBulls If HerdType <> BEEF.

 02/03/11 [V4.0 R8.6] /MK Bug - Fixed Error When Unticking All Animals After Grid Column Filter.

 04/03/11 [V4.0 R8.6] /MK Bug - If English Herd Then Check For UKMilkRecorder In HerdSetup To Assign Caption.

 07/03/11 [V4.0 R8.6] /MK Bug - cbAllAnimalsClick Was Change Color Of MultipleAnimal/Breeding PageControls To White.

 08/03/11 [V4.0 R8.6] /MK Change - Changed Captions of pmAISireOptions.

 11/03/11 [V4.0 R8.7] /MK Change - Changed Caption of sbAddAnimalType To Add Animal Where Beef System.

 12/03/11 [V4.0 R8.7] /MK Additional Feature - Added Calving Date Column To Animal Grid.

 12/03/11 [V4.0 R8.7] /MK Additional Feature - Added Service Date Column To Animal Grid.

 18/03/11 [V4.0 R8.8] /MK Additional Feature - New Quick Filter/Animal Select Drop-Down-List Above Main Grid.

 22/03/11 [V4.0 R8.8] /MK Additional Feature - If New Quick Filter All Animals Clicked Then Show Animals Is Checked
                                             - If Show All Animals Is Checked And cbAllAnimalsClick Then Clear Filter.
                                             - If WinData.GetMultiHerd Then cbDefaultHerd And lHerdFarm Are Not Visible.

 01/04/11 [V4.0 R9.1] /SP Additional Feature - Look At New FilteredTableName Property In uSQLFilters.

 ******** NOTE - ANIMAL GRID HIGHLIGHT ********

 Steers , None Breeding Bulls and None Breeding Heifers Are Highlighted Depending On GlobalSettings Highlight Variables.

 06/04/11 [V4.0 R9.4] /MK Bug Fix - Set rgCurrency To Not Visible Regardless.

 08/04/11 [V4.0 R9.4] /MK Bug Fix - Animal Select Bulls In Use Should Include Bulls That Are Breeding AND In Use.

 28/04/11 [V4.0 R9.9] /MK Change - Disable cbDefaultHerd If Not MultiHerd System.

 04/05/11 [V4.0 R9.9] /MK Bug Fix - Set Style To Normal Animal If Reg DefaultGridDisplay Values Are All Zero.

 04/05/11 [V4.0 R9.9] /MK Bug Fix - OnClearFilter HerdCombo Was Enabled - Only Enable If Not MultiHerd.

 06/05/11 [V4.1 R0.1] /MK Bug Fix - If Beef Herd Then DO NOT SHOW Animal Select - GL

 24/05/11 [V4.1 R1.5] /MK Change - Changed Button Colour Of HelpLineNumber Boxes To btnButtonFace.

 26/05/11 [V4.1 R1.7] /MK Additional Feature - Run SetupQuery To Reload Main Grid With Bull Out Of Use Not Showing.
                                             - Set FQuickFilter = qfBullsInUse On AnimalCategory.BullsInUse Click.

 01/06/11 [V4.1 R1.8] /MK Additional Feature - Show uCTSRegInfo On FormActive And FormCloseQuery If CTSBirth And CTSMove Count > 0 - SP.

 03/06/11 [V4.1 R1.8] /MK Additional Feature - On FormCreate New Procedure RunActionWarningsReminders Checks If ActionWarningsRemindersOnStartup Is Checked In Preferences.

 22/06/11 [V4.1 R2.0] /MK Change - LogMeIn Button - Changed From CallExternalProgram To ShellExecute.

 04/07/11 [V4.1 R2.2] /MK Change - Changed Caption of Utilities/Add New Breed To Add/Modify Breed

 26/07/11 [V4.1 R2.2] /MK Change - New Event Section In Place. Removed All Old Event Section and Report Section.
                                 - Replaced Old Reports Section On Click With Message To Turn On New Reports Menu.

 02/08/11 [V4.1 R4.3] /MK Additional Feature - Do Not Show Calf Reg Warning If Beef Herd.

 12/08/11 [V5.0 R0.1] /MK Additional Feature - Check If Crush System And Show uCrushBarcode If True. 

 25/08/11 [V5.0 R0.3] /MK Additional Feature - Show Backup Warning On FormClose Not FormActivate.
                                     Bug Fix - Do Not Show pBreedingPanel If Not SuckModule Or BeefHerd.

 01/09/11 [V5.0 R0.4] /MK Bug Fix - Changed The Tags Of pAnimalWelfareContainter To Suit ConditionScore1Click Procedure.

 05/09/11 [V5.0 R0.5] /MK Additional Feature - Added Rounded Edges To Link Panels.
                                             - Squashed Up Buttons Link Buttons On The Left And Right.
                                             - Add MessageDlg For Weaning Event.

 08/09/11 [V5.0 R0.6] /MK Additional Feature - New Milk Temperament Event Added To Calving Drop-Down-List.
                                             - Only Allow One Milk Temperament Event Per Animal LifeTime.

 13/09/11 [V5.0 R0.7] /MK Bug Fix - ActMovmentsPermitsClick Was Looking At Movements In And Not APHISMovements.

 16/09/11 [V5.0 R0.8] /MK Bug Fix - ICBFPCDownload1 Was Not Visible.

 03/10/11 [V5.0 R1.0] /MK Change - Check If EBI, CalvingDate, ServiceDate & ConditionScore In Grid Cols Is Visible

 04/10/11 [V5.0 R1.0] /MK Change - Call SetupQuery To Sort New Breeding Boolean Change In WinData.SetBullInUse.

 10/10/11 [V5.0 R1.3] /MK Change - btnClearFilter Visible Problem Fixed.

 12/10/11 [V5.0 R1.4] /MK Additional Feature - Added Group Setup To Cart Drop-Down-List.
                      /MK Bug Fix - cxAnimalGridView.DataController.Filter.OnBeforeChange If All Then ActiveFilter So Filter.Caption Is Filter.

 20/10/11 [V5.0 R1.5] /MK Change - ShowCalvingEvent - If MandatoryDry or MandatoryBreeding Change Information To Warning,
                                                      if Yes To Continue Then ShowCalving.

 25/10/11 [V5.0 R1.6] /MK Change - If HerdType = Beef Then Show IAD Crush or If Dairy Then Show New AnimalBrowser Screen.

 26/10/11 [V5.0 R1.6] /MK Additional Feature - New Option On Cart Drop-Down For Enable/Disable SpaceBar Which Enables SpaceBar Add To Cart.

 26/10/11 [V5.0 R1.6] /MK Change - Changed Caption Of Reconile Herd To CMMS Reconciliation.

 26/10/11 [V5.0 R1.6] /MK Change - Added New Animal Select Category For All Calves This Year / Last Year.

 01/11/11 [V5.0 R1.7] /MK Change - If Def.Defintion.dUseCrush Then uCrushBarCode.Visible.

 08/11/11 [V5.0 R1.8] /MK Bug Fix - ShowCalvingEvent - If Not Mandatory Breeding Or Drying Tick Calving Event Would Not Show.

 14/11/11 [V5.0 R2.1] /MK Bug Fix - SetupForm - Setting The ICBF Action In Code.

 24/11/11 [V5.0 R2.2] /MK Additional Feature - SetupQuery - Added New Check For ConditionScore Filters.

 02/12/11 [V5.0 R2.4] /MK Bug Fix - If Clear Filter cbAllAnimals.Check = False But WinData.AllAnimals Not Set Back To False.

 02/12/11 [V5.0 R2.4] /MK Change - Only Show Parlour Events Button On FormActive Not Parlour Events Screen.

 12/12/11 [V5.0 R2.8] /MK Additional Feature - New drop-down-menu For Feed Allocation For Single Feed Allocation Event.
                                             - New actSingleFeedEvent Action Added To NewSingleEventActionList.
                                             - Sinlge Feed Event Only Allowed On Animals That Have An Existing Feed Regime.

 15/12/11 [V5.0 R2.8] /MK Change - Moved Single Feed Event From Feed Allocation To System/Utilities Menu.

 12/01/12 [V5.0 R3.3] /MK Additional Feature - Added New Tesco Herd Scoring Export Drop Down Option For English Herds Only.

 17/01/12 [V5.0 R3.5] /MK Change - actEventHistoryClick - New Procedure In EventDiary To Allow ForceBlockDelete From Another Form.

 18/01/12 [V5.0 R3.5] /MK Change - Do Not Show Filter Or Cart On Bottom Bar Of Grid.
                                 - Set Old sbHerdStats And sbEventGrid To Not Visible And Changed To New cxButtons.
                                 - Added New actHerdStats Action To ActionList.

 19/01/12 [V5.0 R3.6] /MK Change - Changed Left Of sbImportFile, sbExport, sbExportOptions, btnEventDiary & btnHerdStats
                                   To Better Emphasize The Importance Of EventDiary and HerdStats.

 02/02/12 [V5.0 R3.6] /MK Change - MenuUnit - Moved EventDiary and Herd Stats Closer Together.

 02/02/12 [V5.0 R3.6] /MK Change - actHerdStatsExecute - Set HerdStats Active Page Dependent On HerdType - Was Looking At Last Active Page.

 22/02/12 [V5.0 R4.0] /MK Change - Add New DairyCo Item To pmAISireOptions Where DefCountry <> Ireland.

 22/02/12 [V5.0 R4.0] /MK Change - AccsDatabasesClick - Always Load Companies List In Case Of Year End.

 12/03/12 [V5.0 R4.2] /MK Additional Feature - New Crush Option For Filtering Animals.

 12/03/12 [V5.0 R4.3] /MK Additional Feature - Set WinData.ShowAllEvents Property On cbAllEvents.Click

 13/03/12 [V5.0 R4.3] /MK Additional Feature - New pmShowAnimalOptions Items For Cows, MilkingCows And DryCows.
                                             - New Procedures MilkingCows And DryCows Filters.

 13/03/12 [V5.0 R4.4] /MK Additional Feature - New Column Added To AnimalGrid For BVDTestDate.

 26/03/12 [V5.0 R4.5] /MK Change - SetupQuery - Checks For New Option Not In Group Within Group Grid.

 16/04/12 [V5.0 R4.9] /MK Change - LoadAllAnimals - Added Check If Multi Herd Then Only Show Animals In All Herds And Not None Herd.

 16/04/12 [V5.0 R4.9] /MK Bug Fix - SetupForm - Added Check If All Herds Then FSelectedHerdType Is First Herd In Owners <> NoneHerd.

 23/04/12 [V5.0 R5.2] /MK Change - Moved All CTS Reg Options To Register Container.

 11/05/12 [V5.0 R5.5] /MK Additional Feature - Clear Search Text On Clear Select.

 18/05/12 [V5.0 R5.9] /MK Bug Fix - AllEventsClick - Create A BookMark To Store Current Animal On Grid.

 25/05/12 [V5.0 R7.0] /MK Change - Only Show Group Purchase If Beef Management And Crush or Preference Enabled.

 30/05/12 [V5.0 R7.0] /MK Bug Fix - On New Version Prompt Look At New Download Procedure Instead Of Old uDownload Form.

 07/06/12 [V5.0 R7.0] /MK Additional Feature - btnClearSelectClick - Set QuickFilter Back To None.

 12/06/12 [V5.0 R7.1] /MK Additional Feature - Added New Type For TAddToCartType.
                                             - Depending On What The TAddToCartType Is Set Focus To SearchText Or Animal Grid.

 19/06/12 [V5.0 R7.3] /MK Additional Feature - Added New DropDown Item To Weighing DropDownMenu For Link To Weighing Scale.

 02/07/12 [V5.0 R7.4] /MK Change - cmboSearchColum.OnChange - Set WinData.SearchNatID To FieldName Of cmboSearchColumnItemIndex.

 13/07/12 [V5.0 R7.8] /MK Change - Added Column For Days On Farm If Herd Is Dairy ONLY.
                                 - Moved Filter After Animal Select.
                                 - cxAnimalGridViewDataControllerFilterBeforeChange - Enabled Clear Select If GridFilter Is On.
                                 - Show Warning If Animal Select Is On And Customer Clicks On Filter.

 26/07/12 [V5.0 R8.1] /MK Bug Fix - SetupQuery - Normal SQL - Needed to add Left Join for Events as filter not working correctly for events.

 30/07/12 [V5.0 R8.2] /MK Additional Feature - SetupQuery - Added check for new EBIFilter.

 30/07/12 [V5.0 R8.2] /MK Bug Fix - If GridFilter.Active is set to False then btnClearSelect.Visible was set to false.
                                  - New Boolean - IsFilterFormActive - created to check if any Filter Form filter is active.
                                  - If not(IsFilterFormActive) and not(AnimalSelect.Active) and not(GridFilter.Active) then
                                    GridFilter.Active := False will set btnClearSelect.Visible to False and Filter button caption back to Filter.

 31/07/12 [V5.0 R8.3] /MK Change - AllEventsClick - Quicker way to show ServiceDate on grid by changing logic.

 01/08/12 [V5.0 R8.3] /MK Change - Changed captions of AIM31AComplianceCertRequest1 &  AIM31BComplianceCertRequest1.

 14/08/12 [V5.0 R8.5] /MK Bug Fix - Calf Reg & ICBF Event Reg. were showing for Beef herd type.
 14/08/12 [V5.0 R8.5] /MK Change - Change ContainerCheckMods to ContainerCheckDefFile for better understanding.
                                 - ContainerCheckDefFile - Changed code so that action is visible or not instead of button.

 30/08/12 [V5.0 R8.7] /MK Additional Feature - FormActivate - Show new unit uDeptLinkAdvert.

 30/08/12 [V5.0 R9.6] /MK Additional Feature - New drop-down-menu created for pmImportOptions.
                                             - ICBF Import and Dan Ryan Import added to pmImportOptions.
                                             - Action created for ICBFImport and DanRyanImport.

 03/08/12 [V5.0 R9.7] /MK Additional Feature - Reports.OnClick - If animals added to cart by ActionReminderFilt then Filter cart.

 05/08/12 [V5.0 R9.8] /MK Additional Feature - Added new buttons to pBlockMovementsContainer for Temp Movements In & Out.
                                             - Added actions and procedures for Temp Movements In & Out.

 12/09/12 [V5.0 R9.9] /MK Bug Fix - SetupForm & CheckMods - Changes made for switching Country while program is open.
                                  - Set EventLink Top if switching Country or Herd Type if program is open.
                      /MK Change - Changed cxAnimalGrid headers font style to Bold
                                 - Changed SelectedColumnHeader and DefaultColumnHeader styles to always Bold.
                                 - SelectedColumnHeader just changes style to Italic.

 17/09/12 [V5.0 R9.9] /MK Change - Changes made to allow for new HerdVaccination EventType.
                                 - TfmFertilityTreatmentsReport - Enable ReportType - Health or Vaccination.

 20/09/12 [V5.0 R9.9] /MK Bug Fix - If Beef Herd and BeefMan Module then don't show Milk Rec or Bulk Tank

 21/09/12 [V5.0 R9.9] /MK Bug Fix - Delphi lost drop-down-menu from btnMovementPermits Properties - now coded.

 28/09/12 [V5.1 R0.0] /MK Additional Feature - FormActivate - If Vaccination Events then show Herd Vaccination Report.

 22/10/12 [V5.1 R0.5] /MK Additional Feature - Show uDeptLinkAdvert if AIMClient does not exist.

 30/10/12 [V5.1 R3.1] /MK Additional Feature - Added new uStartupReminders unit.
                      /MK Change - Removed code that was added to uStartupReminders.

 07/11/12 [V5.1 R0.8] /MK Bug Fix - SetupQuery - Program was not setting FSQLFilter.SQLOp for BornIntoHerd.

 12/11/12 [V5.1 R0.9] /MK Bug Fix - GetAnimalIdsBySqlFilter - If AWhatSQL in cAllHeifersThisYear,cAllHeifersLastYear then don't do BreedingStockSQL.

 14/11/12 [V5.1 R1.0] /MK Additional Feature - Added MenuItem for Import Office XML Files for Crush users like IAD.

 11/12/12 [V5.1 R3.5] /MK Additional Feature - Added Drafting to Cart Menu.

 14/12/12 [V5.1 R3.5] /MK Change - On Cart/Drafting/Draft Group Click open ParLink with selected draft group from Cart.

 19/12/12 [V5.1 R3.5] /MK Additional Feature - SetUpQuery - Code added to filter by 305 day Milk Yield.

 11/01/13 [V5.1 R3.8] /MK Additional Feature - Added new submenus for Medicines and Feeds to System Files menu.

 22/01/13 [V5.1 R3.9] /MK Additional Feature - SetUpQuery - Code added to filter by RationCalc 7 Day Milk Average.

 06/02/13 [V5.1 R4.1] /MK Change - SetupForm - GL asked me to add pmiHeifers for Dairy Herds before Dairy & Beef Heifers.
                                 - Changed caption of btnMovementsIn to Transfers In Purchases/B&B
                                 - Changed caption of btnMovementsOut to Transfers Out Sales/B&B

 20/02/13 [V5.1 R4.5] /MK Change - ShowElecWeigh - Refresh Grids after import of weighing events.

 27/02/13 [V5.1 R4.7] /MK Bug Fix - New Boolean FAnimalSearching checked for reseting of SearchColumn Items.   

 05/03/13 [V5.1 R4.9] /MK Bug Fix - Removed OnGridLayoutChange code as it was causing errors on close of backup
                                    and on scroll of the main grid.

 06/03/13 [V5.1 R4.9] /MK Change - After ShowCalfReg or CaflRegistrationByEmail1Click check if WinData.FRequiredCalvingFix
                                   If WinData.FRequiredCalvingFix the ReloadSetupQuery.
                                 - Changes to pmAIMMovements as requested by GL.  
								 
 11/03/13 [V5.1 R5.2 ] /MK Bug Fix - After change made to set FFilter.AIBullSQL to Select Category Bull In Use Query program was not
                                     changed to clear this SQL on Clear Select.

 28/03/13 [V5.1 R5.4] /MK Additional Feature - Added new utility item to MenuBar for RemoveAllBullsInUse.

 12/04/13 [V5.1 R6.3] /MK Additional Feature - Added search by TransponderNo for Parlour Link users.
 			  Bug Fix - Added TBookMark to store cursor position on EventGridAnimalEventsViewDblClick.

 19/04/13 [V5.1 R6.3] /MK Additional Feature - Added TransponderNo Column for Parlour Link users.

 03/05/13 [V5.1 R7.0] /MK Additional Feature - pmImportOptions - Added item for new uDrugsRegisterImport.

 09/05/13 [V5.1 R7.1] /MK Additional Feature - SetupForm - Check WinData.GlobalSettings.ShowBlockTempMovements to show/hide Block Temp Movements.
                                               BuildOnFarmEventsMenu - Check WinData.GlobalSettings.ShowBlockTempMovements to show/hide Temp Movements.

 15/05/13 [V5.1 R7.1] /MK Bug Fix - On delete of events error "Event deleted" appears because bookmark does not exist after delete.
                                    Check if BookmarkIsValid before GoToBookmark.

 17/05/13 [V5.1 R7.1] /MK Additional Feature - Added Q.A field to main grid for IAD to print/filter.

 04/06/13 [V5.1 R7.2] /MK Change - Show QualityAssured Column if Definition.BeefMan and HerdType is Beef.

 26/06/13 [V5.1 R7.5] /MK Additional Feature - Added code to SetupQuery and GetAnimalIdsBySqlFilter for new filter by service count.

 09/07/13 [V5.1 R8.2] /MK Change - ShowParlourLinkScreen - Changes made for new Dairymaster Network Link in ParlourLink.

 11/07/13 [V5.1 R8.3] /MK Bug Fix - ShowFeedPurchEvent - Program not checking if mode of database is in Insert or Edit Mode after FdStkEvents was posted.

 12/07/13 [V5.1 R8.3] /MK Change - Removed the word "Import" from each of the pmImportOptions items - GL.

 12/08/13 [V5.1 R9.1] /MK Change - Changes to show ICBF button for Irish Beef Systems.
                                 - Change lEventDesc if Non-AIM Irish system.
                                 - If FCountry is New Zealand then change lRegisterCalfRegLink.Caption.

 14/08/13 [V5.2 R0.0] /MK Additional Feature - New buttons added to show new Bord Bia form.
                                             - SetupForm - Added code to show/hide new BordBia buttons.

 20/08/13 [V5.2 R0.0] /MK Bug Fix - Show ICBF/HUKI button if actICBFEventReg or actHUKIReg Visible.

 30/08/13 [V5.2 R1.0] /MK Additional Feature - Added Purchases to Medicines System Toolbar menu to allow edit of Medicine Purchases.
                                             - Add sub menu to Medicines/Medicine for add and edit.

 19/09/13 [V5.2 R1.5] /MK Change - Do not show Single Animal Welfare - GL.
                                 - Change Group Animal Welfare to BDP / Welfare.

 20/09/13 [V5.2 R1.5] /MK Change - Changed the Bord Bia button within the Veterinary/Feeds to Review Medicines.
                                 - Review Medicines now shows the Medicine Setup screen in Edit mode.

 11/10/13 [V5.2 R3.4] /MK Additional Feature - New utility added for UpdateHealthUnits which updates the units of the Health table
                                               by the units of the MedicineID from the Medicine table.

 18/10/13 [V5.2 R3.8] /MK Change - Change AIM "Calf Registration By Email" popup item caption to "Calf Registration Review" - GL.

 23/10/13 [V5.2 R3.8] /MK Change - FormActivate - Check to see if first install and if so then show download new version prompt.

 31/10/13 [V5.2 R5.0] /MK Additional Feature - Show DryingOff Event if Suclker Herd - change caption to Weaning if Suckler herd.

 26/11/13 [V5.2 R6.5] /MK Additional Feature - actImportVetDrugRegisterExecute - Open KingswoodMailbox if Preference/"Auto Download Mail Attachments" is ticked.

 09/12/13 [V5.2 R6.8] /MK Bug Fix - Quality Assured field should only appear for Irish BeefMan Herds.

 16/12/13 [V5.2 R7.0] /MK Additional Feature - New field for DaysToFQAS showing on the main grid.
                                               Only of use to NIreland customers as FQASDate filled by APHIS File.

 19/12/13 [V5.2 R7.4] /MK Additional Feature - Added drop-down-menu to Veterinary Purchase button.

 30/01/14 [V5.2 R7.8] /MK Additional Feature - Added Calving Interval (**NOT Projected Calving Interval) for Dairy/Suckler herds.

 26/02/14 [V5.2 R8.7] /MK Additional Feature - Removed btnOrderTags.
                                             - Added separate button for AIMMovementEnquiry - IAD/GL request.
                                             - Replaced old btnOrderTags code with new btnAIMMovementEnq button.
                                             - Changed Caption of AIM Movements to AIM Compliance Certs - GL request.
                          Bug Fix - Changed left of lAIMICBFMore in pRegCalfRegContainter depending on HerdType.

 27/02/14 [V5.2 R8.7] /MK Change - Do not show Movement Permits/AIM Movements in Movement Menu for Irish Herd - GL request.
                          Additional Feature - Added drop-down-menu for AIM Movement Enquiry/Import AIM SalesDeaths/Animal Details.

 10/03/14 [V5.2 R8.9] /MK Additional Feature - Check to see if cows were served after a positive PD after main grid opens.
                          Bug Fix - Switched the icons around for AIM Movements and AIM Comp Certs.

 14/03/14 [V5.2 R9.0] /MK Additional Feature - Do not show KingswoodMailbox when looking for attachments, just show the old SP import attachments timer.

 18/03/14 [V5.2 R9.0] /MK Additional Feature - Changed old Single Animal Welfare container to new Kingswood Links container.
                                             - Only show this Kingswod Links menu if Country is Ireland and Gmail with Mail Attachments - GL.

 21/03/14 [V5.2 R9.0] /MK Additional Feature - Added separate actions for new Links menu so that user is not showing Modal of
                                               the event screen if no attachments are found.
                                             - Show Calf Reg/ICBF email reminder on SetupQuery. Change text to just ICBF if AIMClientExists.

 26/03/14 [V5.2 R9.1] /MK Change - Changed LogMeIn logo and URL to TeamViewer.

 28/03/14 [V5.2 R9.3] /MK Bug Fix - pmAnimalGridPopupPopup - Only show extra item in the drop-down-menu if animal is not in the None Herd.

 31/03/14 [V5.2 R9.3] /MK Bug Fix - Added new action for AIMMovementEnquiry menu popup so Irish herds can use both order tags from
                                    HyperLink in AIM/Calf Reg menu and AIMMovementEnquiry.

 08/05/14 [V5.3 R0.0] /MK Additional Feature - Added drop-down-menu to Review Medicines for Add Medicine - GL request. 

 09/05/14 [V5.3 R0.0] /MK Additional Feature - FormActivate - Show form that contains all treated medicine's that have a null group.

 14/05/14 [V5.3 R0.2] /MK Additional Feature - Pass in to uMedicinesNullGroup whether to show all medicine's by default.

 16/05/14 [V5.3 R0.4] /MK Additional Feature - ShowParlourLinkScreen -
                                               Automatically bring over parlour events from this parlour types
                                               when parlour link closes.

 16/05/14 [V5.3 R0.4] /MK Change - uMedicinesNullGroup GL Requested that when program opens show null and other types if null groups found.

 21/05/14 [V5.3 R1.5] /MK Change - Changes to ICBFImport for Import and Herd/ICBF Import.

 13/06/14 [V5.3 R2.8] /MK Change - SetUpForm - Show PurchFQAS column if DaysToFQAS is showing - TGM/GL Request.

 17/06/14 [V5.3 R2.8] /MK Change - EventGridAnimalEventsViewDblClick -
                                   If NIreland herd and main grid is showing DaysToFQAS then Close and Open WinData.AnimalFileByID as
                                   as RefreshExternalData does not pick up new change to QADate in Animals table.

 19/06/14 [V5.3 R2.8] /MK Change - TeamViewerOnClick - Add Call To Program like whats in the Fields program.

 26/06/14 [V5.3 R2.9] /MK Change - ShowHerdReconcile - Show FQAS and DaysToFQAS after NIHerdReconcile and refresh grid with new QADate from HerdReconcile import.

 01/07/14 [V5.3 R3.0] /MK Change - ShowCalfReg - Show DeptAdvert if AIM does not exist - GL Request.

 01/07/14 [V5.3 R3.0] /MK Additional Feature - Add new Farm Safety Logo and link to Farm Safety page - requested/found by GL.
                                               Only to be shown for Irish Herds as web page is Irish.

 03/07/14 [V5.3 R3.1] /MK Change - SetupForm - Show Quality Assured field for Suckler herds - Hugh Tracey.

 24/07/14 [V5.3 R4.0] /MK Change - Show Default Health Events menu item regardless of country.
                                 - Remove APHIS reference for Default Health Events menu item if country is Ireland.
                                 - Run LoadAccountsCompanies after Accounts program has closed.

 05/08/14 [V5.3 R4.2] /MK Bug Fix - FormCreate - Datasource was lost for mAnimalComments after Delphi crash. 

 07/08/14 [V5.3 R4.4] /MK Change - SetupForm - Make Link buttons for ICBF & Cows365 not visible for Beef Herds.
                                             - If Links menu visible increase height of lEventsSection.

 19/08/14 [V5.3 R4.6] /MK Additional Feature - Added extra drop-down items to Review Medicine's drop-down - GL Request.

 25/08/14 [V5.3 R5.7] /MK Additional Feature - Add Bord Bia system menu and actions to call new BordBiaClient.exe.
                                             - New Bord Bia system menu only available to Beef Crush users - IAD/GL request.

 28/08/14 [V5.3 R5.7] /MK Additional Feature - Copied VetTreatment button to Crush container - IAD/GL request.

 09/09/14 [V5.3 R6.0] /MK Additional Feature - Added Red Tractor screen.
                          Changed - If Country is <> Ireland then show change BordBia button to Red Tractor.

 11/09/14 [V5.3 R6.1] /MK Additional Feature - Added Purchase Weight to Movement Columns - John Milliken.

 15/09/14 [V5.3 R6.2] /MK Additional Feature - All Links buttons, Milk Recording, Mart Files & Factory Files -
                                               Check WinData.FAttachmentsDownloaded to see whether attachments were downloaded
                                               by the user and if they were then just show attachment screen. If they were not then
                                               just download the attachments withouth any question to user - request by GL/Agents meeting 11/09/14.
                                             - FormActivate - When user clicks yes to Check Gmail inbox for emails set WinData.FAttachmentsDownloaded to true
                                                              so as not to download again from Links or other Mailbox attachment buttons - request by GL/Agents meeting 11/09/14.

 15/09/14 [V5.3 R6.2] /MK Additional Feature - CheckMods - New link to re-download attachments from within Links menu.

 18/09/14 [V5.3 R6.3] /MK Change - CheckMods - Change left and caption of re-download attachment components for Beef herds.

 30/09/14 [V5.3 R7.4] /MK Additional Feature - Added menu item to HerdSync for new update bulls screen.
                                             - AccountsClick - Check if Farmgate.def is missing.

 14/10/14 [V5.3 R7.5] /MK Additional Feature - If FarmSyncConfigured then on OnFormActivate calculate total number of Herd data for sync
                                               and store in Defaults.TotHerdDataForSync. OnFormClose then if stored number of Herd data
                                               in Defaults is greater than number of Herd data before FormClose then do AutoBackup.

 16/10/14 [V5.3 R8.6] /MK Bug Fix - SearchForAnimal - Not allowing search if Name search selected. 3 excluded from array. Was 0 & 4. Bug added when Transponder No search added.

 21/10/14 [V5.3 R8.6] /MK Bug Fix - SetupForm - DaysToFQAS/PurchFQAS were not taking visible status from GridCols file.

 30/10/14 [V5.3 R8.7] /MK Additional Feature - Added popup menu, pmVetStats, to show both Health Code Summary (Red Tractor) and Treatment Summary (Bord Bia) screens - GL request.   

 06/11/14 [V5.3 R8.9] /MK Change - FormActivate - If ICBF events have been reset to be resent then show ICBF screen.

 25/11/14 [V5.3 R9.0] /MK Change - Added Reverse Filter option to pmFilterMenu if WinData.ActiveFilter.

 02/12/14 [V5.4 R0.2] /MK Additional Feature - SetupQuery, IsFilterFormActive - Check for new fFilter.DaysOnFarmSQL.

 04/12/14 [V5.4 R0.3] /MK Additional Feature - Added Pregnant column to grid - Declan Flynn/GL request.    

 18/12/14 [V5.4 R0.4] /MK Change - actVetLinkAttachExecute - If no files found then allow user into view VetLink screen for Review Medicine purposes - GL request.

 13/02/15 [V5.4 R2.6] /MK Change - ShowParlourLinkScreen - Added DelPro as a parlour type.

 13/02/15 [V5.4 R2.6] /MK Bug Fix - FormCreate - Datasource was lost for FeedEvents..

 03/03/15 [V5.4 R2.8] /MK Additional Feature - FormActivate - Check if bulls have calving events.
                                             - ShowCalfReg - Run fix for duplicate calvings.

 04/03/15 [V5.4 R1.7] /MK Additional Feature - ShowCalfReg - Check if there are calves that sires with different breed code to calves.
                                             - Moved check for missing sire codes and different sire breeds to before where ShowCalfReg is called.

 10/03/15 [V5.4 R3.2] /MK Change - FormActivate - Don't import ParlourEvents on opening of the program now that Import option available.
                          Additional Feature - New action, actImportParlourData, and new MenuItem added to pmImportOptions added to import Parlour Data - Johnny O'Hanlon.
                                             - FormActivate - Only show new Parlour Import option if Parlour def found and ParlourEvent file exists.

 11/03/15 [V5.4 R3.2] /MK Additional Feature - Added Timer to check for ParlourEvents file every 30 seconds.

 02/04/15 [V5.4 R2.4] /MK Bug Fix - ShowCalfReg - Only check for SireBreedDifferToCalfBreed for Irish herds as APHIS/CTS send calf breed.

 16/04/15 [V5.4 R4.8] /MK Bug Fix - SetGridStyles - BeefBull - Was using bold boolean of Beef Bull Between.
                                                  - Steer - Was using bold boolean of Beef Bull instead of Steer.

 22/04/15 [V5.4 R5.0/3.9] /MK Bug Fix - ShowCalfReg - Check for SireBreedDifferToCalfBreed should be after CalvesWithNoSires.

 08/05/15 [V5.4 R5.5] /MK Additional Feature - EventGridFeedEventsView - Added EndDate and NoDays - GL/L.Clerkin request.

 11/05/15 [V5.4 R5.6] /MK Change - UpdateAnimalLactations1 removed as HerdUtilities option works best - GL request.

 12/06/15 [V5.4 R7.0] /MK Change - Changed uCalvings.ShowCalvings in ShowCalvingEvent for Irish herds to new uCalvingEvent form.
                                 - Changed uCalvings.ShowCalvings in EventGridAnimalEventsViewDblClick for Irish herds to new uCalvingEvent form.

 15/06/15 [V5.4 R7.0] /MK Additional Feature - EventGridAnimalEventsViewDblClick - Pass variable into uCalvingEvent to see if the Dam is changed and run SetUpQuery if changed.

 04/08/15 [V5.4 R7.2] /MK Additional Feature - New Windows message for FarmSync date formate change (WM_KINGSWOOD_INVALID_SYSTEM_DATE_FORMAT).

 27/08/15 [V5.4 R7.4] /MK Change - UpdateAnimalLactations1 - Added back in again as its easier to use then Herd Utilities - GL request.
                                                           - Changed caption to Increase Lactation Number - GL request.

 03/09/15 [V5.4 R8.5] /MK Change - actImportParlourDataExecute - Added Westphalia system to this list - GL/Pat Aherne(7986) request.

 16/09/15 [V5.4 R8.5] /MK Additional Feature - Store the amount of sync data (animals, events, medicines, etc) when the program opens/closes.

 30/09/15 [V5.4 R9.2] /MK Bug Fix - AnimalGridPrinterLink - Will only print to a Canon MP495 Printer if PrintTitle is set on the component.

 02/10/15 [V5.4 R9.4] /MK Change - FormActivate - Removed this check to run KInstaller as WebInstaller handles this better.   

 28/10/15 [V5.4 R9.7] /MK Bug Fix - cxAnimalGridViewBatchGrpDesc code was lost in movement of code from Shane to Michael.   

 30/10/15 [V5.4 R9.8] /MK Modification - ShowPDEvent - Give user warning that a PD record already exists and do they want to enter
                                                       a new PD record for this cow. If the user answers Yes then the old PD record is
                                                       updated with an EventType that allows the new PD event to go in on the current lactation.

 06/11/15 [V5.5 R0.3] /MK Additional Feature - Added Import Cows 365 menu item to pmImportOptions which is to be used by people who have received a file
                                               containing PD events from Billy Curtin - GL/Jim Garry request.

 12/11/15 [V5.5 R0.5] /MK Change - ShowParlourLinkScreen - If ParlourType is Westfalia then after ParLink closes and the WestfaliaExportFileName exists
                                                           save the file as the usual ParlourFilePath file name.

 13/11/15 [V5.5 R0.5] /MK Change - pmAddMedicine - Only show one menu item for Add Prescribers / Administrators.

 13/11/15 [V5.5 R0.5] /MK Additional Feature - pmCalfRegOptions - Added new Tag Reconcile item for new uTagReconcile unit - Shane Maxwell.

 18/11/15 [V5.5 R0.8] /MK Additional Feature - Added TcxDBNavigator to gbAnimalComments to allow editing & saving of animals comments on the fly - GL/Trevor Kellett.

 02/12/15 [V5.5 R1.4] /MK Additional Feature - CheckMods - Made another drop down item to show Beef Sire Register for Dairy herds as well
                                                           as the Dairy Sire Register - GL/Declan O'Meara request.
                                             - FormActivate - Show new uKingswoodAppInfo screen if user does not have FarmSync and ShowKingswoodAppInfo registry value is True.
                          Change - SetupForm - Change caption of EBI column to Mat. Index ( short for maternal index ) for suckler herds.
                                 - FormActivate - Removed Hints on startup as its another screen that will appear on startup - GL/SP request.
                                                - Moved the check for medicines with null groups/type and null withdrawals to uStartupReminders.
                                                - Moved check for ICBF emails into StartupReminders.

 13/01/16 [V5.5 R3.1] /MK Additional Feature - actExportGridToCSVExecute, pmiExportAnimalGridCSVFile - Added facility to export animal grid to CSV - Jane O'Connor Lely (2067). 

 26/01/16 [V5.5 R2.4] /MK Additional Feature - New utility added to move the lactation number of the events for each animal to the lactation number-1 of the previous calving
                                               where the event date was prior to that calving date.
                                             - New utility added to clear off the transponder numbers for sold animals - only available for ParlourLink module.                                                  

 29/01/16 [V5.5 R3.4] /MK Change - actImportICBFDataExecute - Added variable to TfmICBFPCDownloadImporter to indicate new animals added.
                                                            - If new animals added then relink calves to dams for new calves added so that the cow
                                                              of the calf added has the right calving date and then run SetupQuery to load new animals.
 01/02/16 [V5.5 R3.4] /SP Change - Now allow dairy farmers to import purchases from AIM.
                          Additional Feature - After import of purchases from AIM prompt user with screen to enter lactation number.

 10/02/16 [V5.5 R2.7] /MK Bug Fix - RestoreCartCreatedOnApp1 - This option should only be visible if the user has the WebApp.

 10/03/16 [V5.5 R5.4] /MK Change - CreateEBIValuesYoungstockonly1Click - Run SetupQuery if animals were updated by WinData.CreateYoungStockEBIValues.
 18/03/16 [V5.5 R4.4] /MK Additional Feature - Added Menu Item in the Utilites menu to fix animal lactation numbers where the animal lactation numbers were
                                               the lactation number of the animal was messed up by the ICBF Import problem that Nick Kearney found.

 07/04/16 [V5.5 R4.9] /MK Bug Fix - Before running AnimalLactNoNeedsCorrecting check to see if the Country is Ireland and the HerdType is Dairy or Suckler.

 18/03/16 [V5.5 R5.4] /MK Bug Fix - ClearAnimalSelection - After FilterCart1.Default is assigned then assign caption of FilterCart1.
                                                           This was stopping the user from filtering the cart again after the user clicked
                                                           no to clear the filter after ClearSelect was clicked - Emer Howard reported.

 07/04/16 [V5.5 R5.7] /MK Additional Feature - New drop-down-menu added beside the Service event if stock bulls exists in the herd.
                                             - New procedure added to AddStockBullEvent with some checks prior to opening the screen.
                                             - EventGridAnimalEventsViewDblClick - Added edit option for new Stock Bull Event screen.

 09/05/16 [V5.5 R6.1] /MK Change - BrowseSireRegister1Click - As program now moves the sires.db into the web/TempBackup folder when the user is
                                                              taking a backup, the program needs to check for the sires.db in the database.

 07/10/16 [V5.6 R2.0] /MK Change - Allow users to minimize the screen - TGM request.

 25/10/16 [V5.6 R2.6] /MK Bug Fix - Visible property of MenuForm before minimize change was defaulted to False. Once it was changed to True
                                    after the minimize change, if the user had an update of sires the form would close after the sire update.

 17/11/16 [V5.6 R3.2] /MK Change - Show Import button if Parlour Link is available.

 20/01/17 [V5.6 R4.2] /MK Bug Fix - actImportParlourDataExecute - Added Insentec to the list of parlours that bring data into the program - John Wynne.

 31/01/17 [V5.6 R4.2] /MK Additional Feature - ShowCalvingEvent - If Herd country is Ireland then show TagIdentifierSelection screen before Calving screen opens if preference is on.
                                             - ShowCalfReg - Removed this fix to see if it stops the duplicate animal and calving records issues with calvings.

 16/02/17 [V5.6 R4.5] /MK Change - New Utility Menu item, pmiUpdateHerdDesignator, created to allow Irish users that have their Herd Designator set to the
                                   372 Herd Designator but left the Tag Prefix as IE.

 01/03/17 [V5.6 R6.5] /MK Change - SetupForm - Only show Download Installer Utility if the file doesn't exist - SP/GL request.
                                             - No need to show Premium History Utility anymore - GL/SP request.

 02/03/17 [V5.6 R6.5] /MK Change - SetupForm - Only show CMMS Movement Import Utility if Kingswood Office User - SP/GL request.

 02/03/17 [V5.6 R6.5] /MK Change - SetupForm - Only show CMMS Movement Import Utility if Kingswood Office User - SP/GL request.

 03/03/17 [V5.6 R6.5] /MK Change - FormActive - Only show FixAnimalLactationNumbers utility if not WinData.AnimalLactNoFixCompleted.

 06/03/17 [V5.6 R6.5] /MK Additional Feature - New Utility item for Deleted Animals allows user to delete an animal based on a password and
                                               also apply a filter for deleted animals - SP/GL request.
                                             - Added new pop up menu for the main grid to allow undeleted of an animal if new deleted animal filter is showing - SP/GL request.
                          Bug Fix - Some non Beef utilities were showing for beef herds.

 05/05/17 [V5.6 R8.0] /MK Change - Added new messages to initialization and DefaultHandler for WM_KINGSWOOD_AIMCLIENT_RECONCILEHERD

 16/05/17 [V5.6 R8.1] /MK Change - actImportParlourDataExecute - Added Dairymaster to list of acceptable parlours for import file.

 17/05/17 [V5.6 R8.1] /MK Change - EventGridAnimalEventsViewDblClick - Check to see if the Calving was deleted and refresh the main grid if it was.

 04/07/17 [V5.6 R9.1] /MK Bug Fix - SetUpForm - CreateUKMilkRecorderOption should NOT be visible if OwnerFileUKMilkRecorder is DIY.

 17/07/17 [V5.6 R9.2] /MK Change - actReviewMedicineExecute - Added function to HerdLookup to get first medicine so it can be used in other areas.

 21/07/17 [V5.6 R9.3] /MK Additional Feature - After BordBia button closes check HerdLookup.FShowMeEventInfoType to show HintStyleController.
                                             - Modify HintStyleController for BordBia event hints.
                                             - Modify HintStyleController for adding and removing animal from the cart.

 26/07/17 [V5.7 R1.1] /MK Change - ShowCalvingEvent - Check to see if for whatever reason was there a tag added to the TagStore that is already in use and allow the user
                                                      to change the Next NatID in the preferences screen - Philip (TGM) reported case of this happening and calving screen
                                                      (both the old version and new version of the calving) crashed at saving the calving trying to remove the tag from the tag store.

 04/08/17 [V5.7 R1.1] /MK Additional Feature - Added new Bord Bia button below event icons for Irish users only.
                                             - If Parlour Events icon is shown then but new Bord Bia button first and then Parlour Events button beside it.
                          Change - Changed colour of Veterinary/Feeds button and background of Veterinary/Feeds event area to match new Bord Bia button colour.
                                 - Changed colour of AIM/ICBF button and background of AIM/ICBF event area to lighter orange - GL request.
                                 - Changed URL of Farm Safety image to new PDF location on the hsa website - GL request.

 17/08/17 [V5.7 R2.0] /MK Change - Changed caption of RemoveAllBullsInUse1 from Remove All Active Bulls to Clear Active Bull List.                                  

 22/08/17 [V5.7 R2.0] /MK Bug Fix - ShowCalvingEvent - While check should be checking for InputNatIDStyle also so if user changes InputNatIDStyle to <> ListInput MessageDlg won't appear.

 23/08/17 [V5.7 R2.1] /MK Change - FormClose - Only do auto backup if sync on startup - requested Paddy & Bridget Murphy.

 28/08/17 [V5.7 R2.1] /MK Change - ShowCalvingScr - If country is not Ireland or NIreland and the user has not set up the default national ID then give error.
                                                    to tell user to enter this required information. Then bring up the Nat ID select screen.
                                                    Don't allow the user to proceed into calving without selecting this - reported by A.Flethcers.

 07/09/17 [V5.7 R2.3] /MK Bug Fix - sbBackupClick - Remove filter from main grid before backup to stop errors after backup.

 12/09/17 [V5.7 R2.4] /MK Bug Fix - ShowCalvingScr - If country is not Ireland or NIreland and the user has not set up the default national ID then just go ahead - Sarah Risdon.

 12/09/17 [V5.7 R3.0] /MK Change - Removed old buttons below the grid for filter and cart.
                                 - Added new button for Feed Diary i.e. the Feed Event Diary.
                                 - Allow filter from main screen to be applied to Event Diary.
                                 - Use new public property in DairyData for UsingFeedAllocation to show Feed Diary button.
                                 - Don't disable the Event Diary if the Filter is on.
                          Bug Fix - Fixed issues with transponder, cow familiy and preg diag columns showing for beef herds.
                                  - Fixed issues with FQUAS columns showing for herds that are not registered in Northern Ireland.

 19/09/17 [V5.7 R3.0] /MK Change - ShowGroupMovements - Refresh FeedEventsGrid after Group Movements screen closes.

 22/09/17 [V5.7 R3.0] /MK Change - Added a Feed Allocation button to Groups container.

 25/09/17 [V5.7 R3.1] /MK Additional Feature - Made the links button and its Mart File and Cows 365 buttons availabe for NIreland herds.

 06/10/17 [V5.7 R3.6] /MK Additional Feature - Added column to Feed Events for Total Cost and added a footer to the grid to sum Total Cost.   
                          Change - cbFeedEventsClick- Don't show All Events if Feed Events is ticked to stop confusion of un-ticking Feed Events to go back to normal events - GL request.

 19/10/17 [V5.7 R4.0] /SP Change - MenuUnit - Changed prcoedures that use WinData.GoToAimMovementNotification to allow for new change - Kepak.

 24/10/17 [V5.7 R4.0] /MK Change - Anywhere procedure that uses WinData.GoToAimMovementNotification check to see if the current version, 1029, of AIMClient is installed.

 27/10/17 [V5.7 R4.1] /MK Additional Feature - Added menu items to pmShowAnimalOptions for Cows and Replacements for PD'd pregnant and PD'd Not Pregnant.
                                             - teSearchTextKeyDown - If user presses enter key in search other than Animal No then just search.
                                                                     But if search is on animal no then add the animal to the cart - Shane Maxwell.
                          Change - Changed Pregnant column heading to PD'd Pregnant to be more descriptive of data.

 17/11/17 [V5.7 R4.6] /MK Additional Feature - Created a create group option for batch or feed from both cart and filter drop-down menu.
                                             - Created a seperate PopupMenu for pmAnimalCartPopup.
                          Change - Set the PopupMenu for btnTopCart to pmAnimalCartPopup.
                                 - Changed order and lookup of pmFilterMenu and pmAnimalGridPopup - GL request.

 22/11/17 [V5.7 R4.6] /MK Additional Feature - Created two new actions, actGroupSetupFromFilter & actGroupSetupFromCart, to allow user to show either selection not just cart.
                          Change - Removed the OnClick events from GroupSetup1 (Filter) & pmiGroupSetup (Cart) and set the actions of these depending.

 30/11/17 [V5.7 R5.8] /MK Change - Added more actions for actGoToCC31ACart, actGoToCC31BCart, actGoToCC31AFilter & actGoToCC31BFilter.
                                   These new actions will allow use the to do Compliance Certs for the filter on its own or the cart on its own.
                                   If user has a filter applied and then adds animals to the cart, depending on the action selected the program will
                                   know which selection (cart or filter) to show in the compliance cert screen.

 05/12/17 [V5.7 R5.9] /MK Additional Feature - actSyncSettingsExecute - Added check for Irish tags with no country code, multiple herds in a single database
                                                                        and null breeds if the sync is not configured.

 08/12/17 [V5.7 R6.1] /MK Bug Fix - SetupForm - Dam AnimalNo, Dam NatID and Sire No were hidden if herd was Suckler or Beef. Changed to hide of Beef herd only - Heinz Eggert.

 07/12/17 [V5.7 R6.1] /MK Bug Fix - pmAnimalGridPopupPopup - Query AIM was showing only if AIMClient exists but should also check for Country.
                                                           - Tag Replacement Form was alwas showing but should only show for Irish herds.

 11/01/18 [V5.7 R6.5] /MK Change - ContainerCheckDefFile - Factory Sale should be visible in the North as Dunbia does it - Grace Dobson.

 12/01/18 [V5.7 R7.4] /MK Additional Feature - bReportsClick - Refresh Animal Grid if >2 Weighings Report was ran to show OverAllGainPerDay value.
                                             - Added average Over All Gain Per Day column.
                                             - Added footer for AvgOverallGainPerDay - GL.
                                             - AvgOverallGainPerDay footer should be based on animals with a gain NOT animals with zero gain per day - GL.

 16/01/18 [V5.7 R7.4] /MK Additional Feature - Added filter for Overall Gain Per Day.
                          Change - cxAnimalGridViewOverallGainPerDay - Changed Overall Gain Per Day to Live Weight Gain/Day - GL request.

 17/01/18 [V5.7 R7.4] /MK Change - cxAnimalGridViewOverallGainPerDay - Changed Live Weight Gain/Day to Weight Gain/Day - GL request.
                                 - Changed order of buttons under the grid so they are grouped together into categories.  
                          Additional Feature - Add count to the bottom of the AnimalNo field for the amount of animals - GL request.

 25/01/18 [V5.7 R7.5] /MK Change - actRefreshAnimalsExecute - Bring up prompt to run the check for all animals both in herd or after the selected year.
                                 - Changed Import and Export buttons to cxButtons.
                                 - Instead of Sync and Feed Event Diary being not visible, set them to Disabled/Greyed Out to show the user that the options are available - GL request.

 02/02/18 [V5.7 R7.8] /MK Change - actImportParlourDataExecute - Allow CowManager parlour link.

 14/02/18 [V5.7 R8.1] /MK Change - actImportParlourDataExecute - Allow Nedap parlour link.

 15/02/18 [V5.7 R8.2] /MK Bug Fix - actExportGridToCSVExecute - If AValue was False then CSV file showed True - Eddie Jordan UCD.

 09/03/18 [V5.7 R8.2] /MK Change - btnRefreshAnimals - Coloured button and made it flat so its more visible, like Bord Bia and Report toolbar buttons - GL request.
                                                     - Renamed button and action to Calc Gain/Day - GL request.
                                                     - If not HerdLookup.CanCalcOverallGainPerDay then show information message - GL request.
                                 - Rename Column name of Weight Gain/Day to Lifetime Gain/Day - GL request.
                                 - CheckAttachments - Don't allow attachments to be downloaded if all All Herds is selected as All Herds folder in Mail Attachments is created - Geraldine Carroll.

 12/03/18 [V5.7 R8.2] /MK Change - SetupForm - Show the Calc Gain/Day button greyed out where type is not Suckler - GL request.

 09/04/18 [V5.7 R8.7] /MK Additional Feature - Added new utility for Update Service Comments.

 17/04/18 [V5.7 R8.8] /MK Bug Fix - FormActivate - Removed Invalidate and Update as Repaint already calls these Windows procedures.

 25/05/18 [V5.8 R0.2] /MK Change - miCrushXMLImportClick - Moved the creation of the TCrushXMLImport here as its the standard approach.

 31/05/18 [V5.8 R0.3] /MK Incorporated Source From Release - Removed 31B option from pmAIMMovements, pmFilterMenu & pmAnimalCartPopup as per Ian Byryne (Dept.) email - GL request.

 04/07/18 [V5.8 R0.6] /MK Change - BullsInUseFilter - Only show bulls that have an Animal Number.

 11/07/18 [V5.8 R0.9] /MK Bug Fix - SetUpCartQuery - If AnimalCartDataAsWideString is empty then show error of no animals in the cart - Gilligan Meats - Cart From App.

 23/07/18 [V5.8 R1.3] /MK Change - cxAnimalGridViewFocusedRecordChanged - Changed lRecNo from "'RecNo' of 'RecordCount'" to "'RecordCount' animals ('RecNo')" - GL.
                                 - Don't hide animal select if Herd Type is Beef.
                                 - ShowHideAnimalCategoryItems - Only show some of the Animal Category drop-down-list items if HerdType is NOT Beef.
                          Additional Feature - Added sub items to Animals Left Herd for Sold and Died - these are visible to all herd types.

 24/07/18 [V5.8 R1.3] /MK Change - SetupForm - Don't show Moorepark drop-down-list from Calving if Suckler herd.
                                 - ShowHideAnimalCategoryItems - Don't show Beef Cattle, Replacements, In Milk or Dry categories if herd type is Suckler - GL.

 08/08/18 [V5.8 R2.2] /MK Change - SetUpForm - Show Transponder Column if Dairy herd and Parlour or Ration calc modules are using transponder numbers - UCD.

 27/08/18 [V5.8 R2.5] /MK Change - FormClose - Don't give reminder to backup if IP is blacklisted - SP.

 10/09/18 [V5.8 R2.7] /MK Additional Feature - Added utility item for Change Animal Details.
                                             - Two menu items create, only one shows depending on whether the user is using Parlour Link or not.

 13/09/18 [V5.8 R2.8] /MK Change - FormActivate - Added try except around repaint because on one user's machine, since the above change, the unspecified error appeared - Scott (Fletchers).

 14/09/18 [V5.8 R2.8] /MK Change - CloseAndOpenKInstaller - If user is downloading a new version then don't allow autoreindex.

 27/09/18 [V5.8 R3.2] /MK Additional Feature - CheckMods - Hide Block Events buttons if Preference for Dealer is turned on.
                          Change - CheckMods - Change single purchase, sale, vet treatment and weighing to go into the block event screens.
                                 - ShowSingleAnimalEventMenu - Change around buttons in Movement Events Panel depending on Dealer user.

 28/09/18 [V5.8 R3.0] /MK Change - BullsInUseFilter - Changed query to be like the Service, Planned Bull and Stock Bull queries in HerdLookup i.e. check for null breed.

 08/10/18 [V5.8 R3.0] /MK Change - Change height of lEventsSection depending on whether the Dealer module/preference is turned on.
                                 - Change AIM/ICBF to AIM if ICBF options are not available - Herd Admin only users.
                                 - Change Veterinary/Feeds to Veterinary - Dealer users.
                                 - Change panel description text in Veterinary/Feed and Group panels depending on modules and preferences.
                                 - Hide Bord Bia buttons if Dealer module.

 15/10/18 [V5.8 R3.1] /MK Change - Removed Herd/New Features submenu as it was no longer relevant as new New Features screen is being created.
                                 - Removed Help/Kingswood Herd Developments menu item as the web page is not available.
                          Additional Feature - FormActivate - Show uHerdNewFeatures depending on whether user has turned off these preferences.
                                             - Added new Utility for Clear Disease Test Dates.

 05/11/18 [V5.8 R3.4] /MK Bug Fix - ShowBordBiaEventAreaButton - Red Tractor button should be available if NIreland.

 07/11/18 [V5.8 R4.6] /MK Additional Feature - Added new utility, Delete Groups Not Used, to the utility menu if there are groups with no animals.

 22/11/18 [V5.8 R4.7] /MK Change - actSyncSettingsExecute - Check new HerdLookup.MultiHerdHasSameHerdNo function.

 27/11/18 [V5.8 R5.5] /MK Additional Feature - Added an popup menu item to pmImportOptions that allows an import of a transponder file to the cart - Eddie Jordan UCD request.

 04/12/18 [V5.8 R5.7] /MK Change - Always show Feed and Batch group columns so that they can be used in conjunction with filter - Shane Maxwell (filter for in milk and in group).
                                 - Added filter option to Feed and Batch group columns - Shane Maxwell.

 07/12/18 [V5.8 R5.7] /MK Additional Feature - Added Culled as a menu item to Animal Category/Animals Left Herd menu for Dairy/Suckler.
                          Change - Added AShowCulled as parameter for SoldAnimalFilter procedure so the SQL can look at cows sold that have been culled or not - Martin Heaney.

 03/01/19 [V5.8 R5.9] /MK Change - SetupForm - WinData.GlobalSettings.DownloadMailAttachments now based on existence of mailbox.config file not preference as preference removed - GL/SP request.

 24/01/19 [V5.8 R6.3] /MK Change - EventGridAnimalEventsViewDblClick - Allow edit/view of new Mastitis event.

 31/01/19 [V5.8 R6.5] /MK Change - EventGridAnimalEventsViewDblClick - Allow edit/view of new Lameness event.

 01/02/19 [V5.8 R6.5] /MK Change - ShowDraftGroupsMenu - Allow the Drafting menu to appear if the parlour type is Nedap.

 09/02/19 [V5.8 R6.7] /MK Change - Removed all ApplicationLog.LogDebugMessage from Create and Destroy.

 10/02/19 [V5.8 R6.8] /MK Change - Added TeamViewer to Help menu as lower screen res monitors don't show the button on bottom bar.

 12/02/19 [V5.8 R6.9] /MK Change - Always show btnBordBiaRedTrac regardless of country - James (Poplars in Fletchers).

 19/02/19 [V5.8 R6.9] /MK Change - ShowCalvingEvent - If WinData.CalvingSaved don't run SetupQuery, just close and open WinData.AnimalFileByID and locate calved animal.

 27/03/19 [V5.8 R8.3] /MK Change - pmAnimalCartPopupPopup - Added this procedure which seperates the popup procedure from pmAnimalGridPopupPopup procedure.
                                                          - Don't hide any items in the Cart drop-down-list, instead disable them so we can see whats available - GL request.
                                 - pmAnimalGridPopupPopup - Query AIM should only exist if AIMClient exists and the animal is not in the NoneHerd.
                                                          - actQueryAimAnimalDetails should be visible if AIMQueryAnimalHistory1.Visible.
                                 - Added menu item to pmAnimalCartPopup for Query AIM Animal Details By Cart.
                                 - Changed order of System Files and System Parameters to alphabetical order.

 28/03/19 [V5.8 R8.4] /MK Additional Feature - Added Average footer to the Main Grid for Days In Milk.

 05/04/19 [V5.8 R8.5] /MK Additional Feature - Added the JohnesResult and MilkingStatus columns to the main grid.
                                             - Highlight those animals with High JohnesResult in Red, Medium in Amber and Low in Green as outlined by Alec (Fletchers).
                                             - MilkingStatus field is only available to dairy herds.
                          Change - Calving Date and Service Date are not available for Beef herd type.
                                 - Added drop-down-list to Group Setup screen with an item Edit Group that allows the user, Hallissey's, to change the name or group
                                   type without having any delay because of the amount of animals.     

 09/04/19 [V5.8 R8.6] /MK Additional Feature - Added new utility to call new AutoArchive program that clears all sales in the
                                               the database. This was intended to be used by Martin Hallissey after his Animals table
                                               had reached 14000 records within 3 months. New Const aAutoArchiveSerialNos created
                                               with Martin's Serial Number but this can be extended to an array if any else needs it.
                                               The AutoArchive program needs to be installed manually by TeamViewer.

 18/04/19 [V5.8 R8.9] /MK Additional Feature - Added new pop-up-menu for Add Sire.
                                             - New pop-up-menu has links to the new uAddSire screen.

 29/04/19 [V5.8 R9.0] /MK Additional Feature - Added new Windows Message, WM_KINGSWOOD_AIMCLIENT_PROCESS_PROCESSNEWCUSTOMER, that is called by AIMService
                                               which calls the new procedure ProcessAIMCompCertNewCustomer that adds a new customer - SP request.

 07/05/19 [V5.8 R9.2] /MK Change - ShowParlourLinkScreen - If MooMonitor then wait for ParlourLink to close and then call actImportParlourData.
                                                         - Set FParlourInfo after Parlour Link program is called - NOTE: Only MooMonitor link waits for ParlourLink to close.

 23/05/19 [V5.8 R9.2] /MK Change - Made the Export button available to non-NI users for AHDB SCI export.
                          Additional Feature - Added link to new AHDBImport screen.

 23/05/19 [V5.8 R9.3] /MK Additional Feature - Added CustomerName to the main grid as a column - Una Carter.

 30/05/19 [V5.8 R9.3] /MK Additional Feature - New WindowsMsg added to take instruction from FarmSync to open the Max Bull Count increase screen.

 07/06/19 [V5.8 R9.3] /MK Change - Created a new form variable AIMMovementsActivated which is called when AIMMovements message is processed.
                                 - Once the AIM has closed this variable is then checked and then ProcessAimMovements is called.
                                 - With this new approach the new Temp Movement for Heifer window appears before the Movement Summary appears.
                                 - Moved the DisplayAimMovementSummary into ProcessAimMovements as there is no need to call both procedures after each other.

 11/06/19 [V5.8 R9.4] /MK Bug Fix - EventGridAnimalEventsViewDblClick - Locate Calf after clicking into calf into on calving event
                                                                        - Check for WinData.CalvingSaved not required here as customer could be going into calving to find calf
                                                                          without having made changes to the calf i.e. dam, sire, date of birth.

 23/08/19 [V5.9 R0.1] /MK Additional Feature - Add Total SCC, Lact. Yield, Lact. Solids and Latest Yield columns to main grid.

 23/08/19 [V5.9 R0.1] /MK Bug Fix - actQueryAimAnimalDetailByBatch.Visible := WinData.CanMakeAIMRequests;

 04/09/19 [V5.9 R0.3] /MK Additional Feature - Added the Purchase Costs column to main grid - Una Carter request.

 09/09/19 [V5.9 R0.3] /MK Bug Fix - ShowAIMOrStandardIrishRecScr - Need to change the caption of actMovementPermits to "APHIS Movements" or "CTS Move" depending on country - TGM reported.
                                  - Lifetime Gain/Day column kept appearing even if you removed it from view.

 17/10/19 [V5.9 R1.0] /MK Change - Changed cxAnimalGridViewLactSCC caption to Average SCC as that is what the ICBF are passing down not the total - GL/SP request.

 19/11/19 [V5.9 R1.3] /MK Change - ShowMilkRecording - If the Country is not Ireland then get user to specify milk recorder as all GB countries should be either NMR or CIS - GL request.

 28/11/19 [V5.9 R1.3] /MK Bug Fix - FormCreate - Richard Claxton was getting an "Unspecified Error" when the program was trying to create an icon in the SysTray.
                          Change - Changed the "PD'd Not Pregnant" category for Cows and Replacements to "Not Pregnant" which includes "PD'd Not Pregnant", "Not Served" & "Served Not PD'd" - GL/DOM.

 03/12/19 [V5.9 R1.4] /MK Additional Feature - Added "No. Movements" column which takes it data from Mart XML file QADays field.
                                             - SetupForm - Only show this column if Irish Beef Herd with Beef Management module, like QA column.

 18/12/19 [V5.9 R1.5] /MK Additional Feature - Added popup-menu-item "Add A1A2 Result" to pmAnimalGridPopup that brings up the new uPopupAnimalEdit screen - Pat Ryan.
                                             - Added A1A2 DNAResult column - Pat Ryan.

 19/12/19 [V5.9 R1.5] /MK Change - ShowParlourLinkScreen - Added Delpro to the automatic Import Data execute - Mark Young.

 23/12/19 [V5.9 R1.5] /MK Additional Feature - Added Import pop-menu-item for A1/A2 Results File.
                                             - Added procedure to import the A1/A2 Results File from Pat Ryan.

 03/01/20 [V5.9 R1.6] /MK Change - SetUpForm - Don't show A1A2 Result column if not a dairy herd.

 06/01/20 [V5.9 R1.6] /MK Additional Feature - Added Purchase Commission, Purchase Transport and Sale Price columns - Una Carter request.

 06/01/20 [V5.9 R1.6] /MK Additional Feature - Added Sale Costs columns - Una Carter request.

 03/03/20 [V5.9 R2.7] /MK Change - Changed the "Clear Active Bull List" to "Reset Active Bull List" which only shows bulls that are in
                                   use from services or sires of calves or planned bulls. 

 13/03/20 [V5.9 R2.9] /MK Change - ShowCalvingEvent - DryOff prompt - Reformatted the code so it was easier to understand, reported issue with it for Gordon McConkey.
                                 - SetupForm - Only show Import Transponder Data to Cart option if Electronic Weighing module is enabled - GL request.

 27/04/20 [V5.9 R4.0] /MK Additional Feature - New button added above the grid for Modify Grid that allows the user to easily modify the visible grid columns
                                               with the use of the new uModifyGridCols unit.

 28/04/20 [V5.9 R4.0] /MK Additional Feature - Added Total B/Fat Weight and Total Protein Weight columns to the main grid.
                          Change - Changed Lact. Yield to Total Yield and Lact. Solids to Total Solids - GL request.

 02/07/20 [V5.9 R5.1] /MK Additional Feature - Added the Latest Solids field i.e DailyBfatWeight + DailyProtWeigh. I added this field with a CurrentEdit property
                                               with a DisplayFormat of 0.00 so that all values would appear with a 2 digit decimal point - Gl request.

 05/08/20 [V5.9 R5.3] /MK Change - When the user clicks the down-arrow beside Review Medicines and clicks Add Prescriber/Administrator the uMedAdminSetup should appear in Add Mode,
                                   if the user clicks System/System Files/Medicine/Prescribers or Administrators the uMedAdminSetup should appear in Edit mode - GL request.

 06/11/20 [V5.9 R7.2] /MK Additional Feature - Added menu item to mGroup menu to add Help button that links to new Calving help PDF file on the server.

 16/11/20 [V5.9 R7.3] /MK Change - Calving button - If its a Suckler herd only show the help drop-down-menu.

 16/12/20 [V5.9 R7.9] /MK Change - Show Parlour Link and Ration Calc icons but give "acquire this facility" error if the module is not installed i.e. not purchased. 

 21/12/20 [V5.9 R7.9] /MK Change - DoFilter - If the filter is Bulls In Use and some bulls don't have breeds, show information message and sort by breed code.
                                 - ClearAnimalSelection - If the sort was changed by the filter of Bulls In Use then set sort back to original sorted column.

 26/02/21 [V5.9 R8.7] /MK Change - Removed filter on the A1A2 column as it wasn't working.

 02/03/21 [V5.9 R9.1] /MK Additional Feature - Added changes to allow filter for A1A2Result from Filter screen - Padraic Harnan.

 04/03/21 [V5.9 R9.4] /MK Bug Fix - StockBullsInUseFilter - Only show bulls that are In Use ignore the InHerd flag - GL/Cantwells Court.

 31/03/21 [V5.9 R9.7] /MK Change - Changed Modify Grid to Change Grid - GL request.
                                 - Changed "Sire Breed Only" to "Other Sires" - GL request.

 01/04/21 [V5.9 R9.7] /MK Change - Add Sub Menu to Stock Sires.
                                 - Add menu items to new sub menu for List Stock Sires and Purchase Stock Bull.

 30/04/21 [V6.0 R1.0] /MK Additional Feature - Added the PricePerKg column.                                 

 05/05/21 [V6.0 R1.0] /MK Additional Feature - Added the Sale Dead Weight column.
                                             - Added summary for new Sale Price, Sale Dead Weight, Purchase Weight, Purchase Price,
                                               Days on Farm and Price Per Kg.

 12/05/21 [V6.0 R1.1] /MK Change - SetUpForm - Moved btnRefreshAnimals button above the grid of animals - no need to disable it as all herds will use it eventually.

 14/05/21 [V6.0 R1.1] /MK Additional Feature - actRefreshAnimals - Added calculation of Gross Margin from WinData.MDGridPurchData and WinData.MDGridSaleData.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Menus, ExtCtrls, DBCtrls, ComCtrls,
  RXCtrls, Adgrad, RXLookup, Db, DBTables, RXDBCtrl, ToolWin,
  RXSplit, Mask, ToolEdit, RXShell, TB97Tlbr, TB97Ctls, TB97, Registry,
  TJpgImg, DbPrgrss, kwDBNavigator, ImgList, jpeg, Tips,
  GenTypesConst, DBCtrlsEh, DynaZip, DynaLibU, RxGIF, KActionList,PhoneLink,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, dxmdaset, cxSplitter,
  cxGraphics, cxStyles, cxCustomData, cxDBData, LMDWebBase, LMDRAS,
  cxContainer, cxEdit, cxImage, cxDBEditRepository, ActnList, dxPSCore,
  dxPScxCommon, dxPScxGridLnk, cxButtons, cxPC, cxCheckBox, KRxSpeedButton,
  cxHint, cxLabel, cxTextEdit, cxMemo, cxDBEdit, cxGroupBox, DateUtil,
  dxStatusBar, cxMaskEdit, cxDropDownEdit, LMDWebConfig,
  LMDWebHTTPGet, LMDDownload, uSQLFilters, Drawing, uHerdLookup, Groups,
  uDanRyanImport, uDeptLinkAdvert, uTempMovementsIn, uVaccineDueOn, uCrushXML,
  uWeightTargets, uMediAdminSetUp, uDrugsRegisterImport, uBordBiaPrint,
  uUpdateHealthUnits, uKingscc, uCowsServedAfterPD, uHerdSync, uTreatmentSummary,
  uMedicinesNullGroup, uAnimalRemedyData, uCalvesWithNoSires, uRedTractor,
  uVetLinkDrugSelect, uRedTractorTreatSum, uCalvingsFix,
  uSireBreedDifferToCalfBreed, uDownloadExternalProgram, uCalvingEvent,
  uHerdSyncDataSettings, uTagReconcile, cxNavigator, cxDBNavigator,
  uKingswoodAppInfo, uStockBullEvent, uTagIdentifierSelection, uAIMHerdRecImport,
  uFeedEventFilter, uBlockEventEdit, uRedTractorDrugCollation, uGeneralReview,
  uFarmSyncSettings, uUpdateAnimalGainPerDayMsg, uProgressIndicator,
  cxLookAndFeels, uSireAnalysis, uSireAnalysisFilter, uEditAnimalDBByGrid,
  uModuleDefUpdate, uHerdNewFeatures, uClearDiseaseTestDate, uGroupsNotUsed,
  uConditionScoreReport, uSPParser, uImportFileMemo, uAddSire, uAHDBImport,
  uTestGridWithDataSet, uTestForm, uPopupAnimalEdit, uAIMHeifTempTransfers,
  uMessageScr, uModifyGridCols, KRoutines, uRemittanceConvert;

type
  TDraftGroupType = ( dgtAddToDraftGroup, dgtClearDraftGroup, dgtClearAddToDraftGroup );
  TAddToCartType = ( atcAfterGridClick, atcAfterSearchClick, atcAfterRightClick, actAfterSpaceBar, actAfterAnimalNoEnterKeyPress);
  TcxPageControlAccess = class(TcxPageControl);
  TSystemType = (stStandard, stPDAStandalone);
  TDoWhat = (AddAnimal,AmendDeleteAnimal);
  TMoveToMovement = (SwitchToMovement,DoNotSwitchToMovement);
  TMenuType = (mtBreeding, mtMovements, mtVeterinaryFeeds, mtRegCalfReg,
               mtAnimalGroups, mtManagement, mtAnimalWelfare, mtBlockMovements,
               mtCrush, mtKingswoodLinks);
  TMenuForm = class(TForm)
    pGrid: TPanel;
    PrinterSetup: TPrinterSetupDialog;
    ShowIcon: TRxTrayIcon;
    IconMenu: TPopupMenu;
    KingswoodHerdManagement1: TMenuItem;
    Exit2: TMenuItem;
    About2: TMenuItem;
    N3: TMenuItem;
    ShowMenu1: TMenuItem;
    N20: TMenuItem;
    Dock97: TDock97;
    Toolbar97: TToolbar97;
    sbExit: TRxSpeedButton;
    sbAnimalsPaddocks: TRxSpeedButton;
    sbHelp: TRxSpeedButton;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    Panel1: TPanel;
    mGroup: TPopupMenu;
    lHerdFarm: TLabel;
    cbDefaultHerd: TRxDBLookupCombo;
    ToolbarSep975: TToolbarSep97;
    sbBackup: TRxSpeedButton;
    ToolbarSep976: TToolbarSep97;
    BackUpTimer: TTimer;
    sbAccounts: TRxSpeedButton;
    ToolbarSep977: TToolbarSep97;
    AMTip: TTips;
    pmEventChange: TPopupMenu;
    Events: TMenuItem;
    Feeds: TMenuItem;
    sbSheep: TRxSpeedButton;
    ToolbarSep978: TToolbarSep97;
    bOtherEvents1: TRxSpeedButton;
    vSplitter: TRxSplitter;
    ConditionScore1: TMenuItem;
    Castrate1: TMenuItem;
    Abortion1: TMenuItem;
    DiagnoseProblem1: TMenuItem;
    EmbryoImplantTransfer1: TMenuItem;
    Mastitis1: TMenuItem;
    TobeCulled1: TMenuItem;
    Wean1: TMenuItem;
    InternalExam1: TMenuItem;
    BullIn1: TMenuItem;
    BullOut1: TMenuItem;
    N22: TMenuItem;
    CreateMooreParkExportFile1: TMenuItem;
    MainMenu: TMainMenu;
    Animals: TMenuItem;
    ShowHintsatStartup: TMenuItem;
    N9: TMenuItem;
    Exit1: TMenuItem;
    AnimalsEvents: TMenuItem;
    Breeding1: TMenuItem;
    HeatBulling1: TMenuItem;
    Service1: TMenuItem;
    ScanningPDs1: TMenuItem;
    DryingOff1: TMenuItem;
    Calving1: TMenuItem;
    MovementsRegister1: TMenuItem;
    SalesDeaths1: TMenuItem;
    TemporaryMovement1: TMenuItem;
    ReTagging1: TMenuItem;
    RegisterRemarks1: TMenuItem;
    InterHerd1: TMenuItem;
    Veterinary1: TMenuItem;
    Purchases1: TMenuItem;
    Treatments1: TMenuItem;
    FeedPurchases1: TMenuItem;
    FeedAllocation1: TMenuItem;
    Premium1: TMenuItem;
    N1st2ndBull1: TMenuItem;
    Suckler1: TMenuItem;
    Slaughter1: TMenuItem;
    Management1: TMenuItem;
    AnimalWeighing1: TMenuItem;
    MilkRecording1: TMenuItem;
    ParlourLink1: TMenuItem;
    PreSale1: TMenuItem;
    View1: TMenuItem;
    Menu1: TMenuItem;
    ToolBar2: TMenuItem;
    N17: TMenuItem;
    EventIcons1: TMenuItem;
    Gradient1: TMenuItem;
    N18: TMenuItem;
    Statusbar1: TMenuItem;
    ResolutionOptions1: TMenuItem;
    AnimalsReports: TMenuItem;
    HerdReports1: TMenuItem;
    BovineHerdRegister1: TMenuItem;
    StockOnHand1: TMenuItem;
    PurchaseSalesAnalysis1: TMenuItem;
    SlaughterPremiumReport1: TMenuItem;
    PremiumPlanner1: TMenuItem;
    Extensification1: TMenuItem;
    StockingDensityRestrictions1: TMenuItem;
    PremiumHistoryEligibility1: TMenuItem;
    SlaughterPremiumReport2: TMenuItem;
    SalesEligibility1: TMenuItem;
    SalesPlanner1: TMenuItem;
    RestrictedAnimalsReport2: TMenuItem;
    DiseaseTestStatus1: TMenuItem;
    VeterinaryReports1: TMenuItem;
    VeterinaryTreatments1: TMenuItem;
    VeterinaryPurchases1: TMenuItem;
    CowManagementReports1: TMenuItem;
    HeatsAndServices1: TMenuItem;
    DueService1: TMenuItem;
    DuePregnancyDiagnosis1: TMenuItem;
    DueForDryingOff1: TMenuItem;
    DueToCalve1: TMenuItem;
    BeefManagement1: TMenuItem;
    SalesReport1: TMenuItem;
    MovementPermits1: TMenuItem;
    Weighing1: TMenuItem;
    BeefPurchaseGroups: TMenuItem;
    N8: TMenuItem;
    BullsUsedInHerd1: TMenuItem;
    Dairy1: TMenuItem;
    QuotaPlanner1: TMenuItem;
    HerdFertility1: TMenuItem;
    N7: TMenuItem;
    MilkAnalysisReports1: TMenuItem;
    BestCowsInHerd1: TMenuItem;
    MilkDiskReview1: TMenuItem;
    MonthlyMilkAnalysis1: TMenuItem;
    MilkProductionGraphs1: TMenuItem;
    PedigreeReports1: TMenuItem;
    HFSRegistration1: TMenuItem;
    HerdBrochure1: TMenuItem;
    SalesCatelog1: TMenuItem;
    N10: TMenuItem;
    SetCurrency: TMenuItem;
    Euro: TMenuItem;
    Pound: TMenuItem;
    PrintSetup1: TMenuItem;
    AnimalsSystem: TMenuItem;
    TakeBackup1: TMenuItem;
    AutoBackup1: TMenuItem;
    N12: TMenuItem;
    HerdSettings1: TMenuItem;
    PremiaValues1: TMenuItem;
    MilkDiskParameters1: TMenuItem;
    SetNationalIDtype1: TMenuItem;
    InventoryValuations1: TMenuItem;
    N15: TMenuItem;
    Breeds1: TMenuItem;
    Buyers1: TMenuItem;
    Customers1: TMenuItem;
    Suppliers1: TMenuItem;
    Medicines1: TMenuItem;
    FeedTypes1: TMenuItem;
    SystemUsers1: TMenuItem;
    DefaultAccsCompany1: TMenuItem;
    N16: TMenuItem;
    RecalculateEligibility2: TMenuItem;
    BeefPremium1: TMenuItem;
    SlaughterPremium1: TMenuItem;
    RebuildIndexes1: TMenuItem;
    ReLinkCalves1: TMenuItem;
    Help1: TMenuItem;
    Contents1: TMenuItem;
    Index1: TMenuItem;
    SearchforHelpOn1: TMenuItem;
    HowtoUseHelp1: TMenuItem;
    Tipoftheday1: TMenuItem;
    N21: TMenuItem;
    VisitKingswoodOnline1: TMenuItem;
    EmailKingswood1: TMenuItem;
    KingswoodComputing1: TMenuItem;
    Bandon1: TMenuItem;
    ICBF1: TMenuItem;
    N14: TMenuItem;
    About1: TMenuItem;
    NewVersion1: TMenuItem;
    ChecknewVersion1: TMenuItem;
    miPhoneLink: TMenuItem;
    CheckPhoneLinkOnStartup: TMenuItem;
    CallKings: TMenuItem;
    SelectSMSReceiver1: TMenuItem;
    NokiaLink1: TMenuItem;
    SiemensGSMModule1: TMenuItem;
    Settings1: TMenuItem;
    StoreImages: TImageList;
    PopupMenu1: TPopupMenu;
    RetagColumn1: TMenuItem;
    TempTagColumn1: TMenuItem;
    Checkfornewevents1: TMenuItem;
    N5: TMenuItem;
    Perferences1: TMenuItem;
    ToolbarSep979: TToolbarSep97;
    Blade1: TMenuItem;
    ImageList1: TImageList;
    Unzip: TUnzipFile;
    TermsofUse1: TMenuItem;
    mStockRestrict: TPopupMenu;
    StockingDensityrestrictions2: TMenuItem;
    PopSWS: TPopupMenu;
    HerdReconciliation1: TMenuItem;
    MenuItem1: TMenuItem;
    FloppyDisk1: TMenuItem;
    Desktop1: TMenuItem;
    popGridCols: TPopupMenu;
    DisplayColumns1: TMenuItem;
    DownloadToPhone1: TMenuItem;
    Brow1: TMenuItem;
    BrowseSireRegister1: TMenuItem;
    SireSelection1: TMenuItem;
    miFertRepGen: TMenuItem;
    miPedigreeRG: TMenuItem;
    DairyBenchmarks1: TMenuItem;
    Weighing2: TMenuItem;
    miHerdRG: TMenuItem;
    miCalfPerform: TMenuItem;
    miHealthRG: TMenuItem;
    CMMSReconciliation1: TMenuItem;
    UpdateAnimalNumberField1: TMenuItem;
    BreedingActionLists: TPopupMenu;
    DueService2: TMenuItem;
    DuePregnancyDiagnosis2: TMenuItem;
    DueForDryingOff2: TMenuItem;
    DueToCalve2: TMenuItem;
    miMilkReportGeneratorRG: TMenuItem;
    BreedingActionLists1: TMenuItem;
    RecentActivitiesList1: TMenuItem;
    DairyHerdHealthCert1: TMenuItem;
    miPDALink: TMenuItem;
    Settings2: TMenuItem;
    ExportToPDA: TMenuItem;
    N11: TMenuItem;
    DownloadEvents1: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleAnimalNormal: TcxStyle;
    cxStyleNoneHerdAncestor: TcxStyle;
    cxStyleNoneHerd: TcxStyle;
    cxStyle1: TcxStyle;
    Utilities1: TMenuItem;
    CreateEBIValuesYoungstockonly1: TMenuItem;
    DefaultColumnHeader: TcxStyle;
    SelectedColumnHeader: TcxStyle;
    UpdateAnimalLactations1: TMenuItem;
    tbDownload: TToolbarButton97;
    pAnimalGrid: TPanel;
    AnimalsEventsSplitter: TcxSplitter;
    pSearch: TPanel;
    Bevel2: TBevel;
    sbAnimalView: TRxSpeedButton;
    Bevel1: TBevel;
    cbAllAnimals: TDBCheckBoxEh;
    cbSearch: TDBCheckBoxEh;
    cxAnimalGrid: TcxGrid;
    cxAnimalGridView: TcxGridDBTableView;
    cxAnimalGridViewAnimalNo: TcxGridDBColumn;
    cxAnimalGridViewNatIDNum: TcxGridDBColumn;
    cxAnimalGridViewSortAnimalNo: TcxGridDBColumn;
    cxAnimalGridViewSex: TcxGridDBColumn;
    cxAnimalGridViewDateOfBirth: TcxGridDBColumn;
    cxAnimalGridViewLactNo: TcxGridDBColumn;
    cxAnimalGridViewName: TcxGridDBColumn;
    cxAnimalGridViewHerdBookNo: TcxGridDBColumn;
    cxAnimalGridViewBirthWeight: TcxGridDBColumn;
    cxAnimalGridViewBrucellosis: TcxGridDBColumn;
    cxAnimalGridViewTBTestDate: TcxGridDBColumn;
    cxAnimalGridViewBreedCode: TcxGridDBColumn;
    cxAnimalGridViewColourCode: TcxGridDBColumn;
    cxAnimalGridViewRT: TcxGridDBColumn;
    cxAnimalGridViewTT: TcxGridDBColumn;
    cxAnimalGridViewDamNo: TcxGridDBColumn;
    cxAnimalGridViewSireNo: TcxGridDBColumn;
    cxAnimalGridLevel: TcxGridLevel;
    StatusBar: TStatusBar;
    pFilter: TPanel;
    sbClearFilter: TRxSpeedButton;
    lRecNo: TLabel;
    sbHerdStats: TRxSpeedButton;
    imgBarcode: TcxImage;
    cxEditRepository1: TcxEditRepository;
    riEventTypes: TcxEditRepositoryLookupComboBoxItem;
    riHerdCombo: TcxEditRepositoryLookupComboBoxItem;
    RxSpeedButton5: TRxSpeedButton;
    ActionList: TActionList;
    actPrintGrid: TAction;
    ComponentPrinter: TdxComponentPrinter;
    AnimalGridPrinterLink: TdxGridReportLink;
    actEventHistory: TAction;
    sbEventGrid: TKRxSpeedButton;
    actClearFilter: TAction;
    cxAnimalGridViewEBI: TcxGridDBColumn;
    cxAnimalGridViewSortNatID: TcxGridDBColumn;
    cxAnimalGridViewSearchNatID: TcxGridDBColumn;
    cxAnimalGridViewHerdID: TcxGridDBColumn;
    cxAnimalGridViewAncestor: TcxGridDBColumn;
    cxAnimalGridViewBreeding: TcxGridDBColumn;
    cxAnimalGridViewDamAnimalNo: TcxGridDBColumn;
    cxAnimalGridViewDamNoHidden: TcxGridDBColumn;
    cxAnimalGridViewSireNoHidden: TcxGridDBColumn;
    cxAnimalGridViewDamAnimalNoHidden: TcxGridDBColumn;
    cxAnimalGridViewDamIDHidden: TcxGridDBColumn;
    cxAnimalGridViewSireIDHidden: TcxGridDBColumn;
    pmHerdFertility: TPopupMenu;
    SeasonalCalvingHerds1: TMenuItem;
    SpreadCalvingHerds1: TMenuItem;
    PremiumHistoryReport1: TMenuItem;
    N13: TMenuItem;
    miDARDDairyFertilityBenchmarks: TMenuItem;
    GridRecord: TcxStyle;
    MachineryLink: TMenuItem;
    N19: TMenuItem;
    sbAddAnimalType: TKRxSpeedButton;
    PopupMenu2: TPopupMenu;
    DueToBeCulled1: TMenuItem;
    pmAddAnimalType: TPopupMenu;
    AISireProvenDairy: TMenuItem;
    AISireTestBeef: TMenuItem;
    NonHerdAncestor1: TMenuItem;
    sbMachinery: TKRxSpeedButton;
    tsMachinery: TToolbarSep97;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    actNavFirst: TAction;
    actNavPrevious: TAction;
    actNavNext: TAction;
    actNavLast: TAction;
    CreateWeeklyDiaryEvents1: TMenuItem;
    ICBFRegistration1: TMenuItem;
    CalfRegistration2: TMenuItem;
    N24: TMenuItem;
    pmDiseaseTestStatus: TPopupMenu;
    DiseaseTestStatus2: TMenuItem;
    pmLivestockNutrientProduction: TPopupMenu;
    Historical1: TMenuItem;
    AddNewBreed1: TMenuItem;
    TemporaryMovement2: TMenuItem;
    N25: TMenuItem;
    GettingStarted1: TMenuItem;
    pmRegisterRemarks: TPopupMenu;
    RegisterRemarks3: TMenuItem;
    tsGettingStart: TToolbarSep97;
    sbGettingStarted: TcxButton;
    CMMSFileImport1: TMenuItem;
    RunPDAHerdInstaller: TMenuItem;
    RunPDAFieldsInstaller: TMenuItem;
    N26: TMenuItem;
    HistoricalCalving1: TMenuItem;
    HerdUtils1: TMenuItem;
    MealFeeding1: TMenuItem;
    Disbudding1: TMenuItem;
    ICBFPCDownload1: TMenuItem;
    ImportICBFData1: TMenuItem;
    SystemFiles1: TMenuItem;
    SystemParameters1: TMenuItem;
    N4: TMenuItem;
    LivestockProductionRate1: TMenuItem;
    ResetAnimalGridColumns1: TMenuItem;
    sbaccsdbs: TKRxSpeedButton;
    pmAccsDatabases: TPopupMenu;
    cxLabel1: TcxLabel;
    pmFertilityTreatmentsReport: TPopupMenu;
    FertilityTreatmentsReport1: TMenuItem;
    MedicineStock1: TMenuItem;
    pmQuotaPlanner: TPopupMenu;
    FertilityTreatmentChart1: TMenuItem;
    GrasslandManagement1: TMenuItem;
    GrassIntakeGrowth1: TMenuItem;
    FertilityPrograms1: TMenuItem;
    pmTagReplacements: TPopupMenu;
    MenuItem3: TMenuItem;
    Panel13: TPanel;
    EventGrid: TcxGrid;
    EventGridAnimalEventsView: TcxGridDBTableView;
    EventGridAnimalEventsViewEventType: TcxGridDBColumn;
    EventGridAnimalEventsViewEventDate: TcxGridDBColumn;
    EventGridAnimalEventsViewEventDesc: TcxGridDBColumn;
    EventGridAnimalEventsViewAnimalLactNo: TcxGridDBColumn;
    EventGridFeedEventsView: TcxGridDBTableView;
    EventGridFeedEventsViewAllocDate: TcxGridDBColumn;
    EventGridFeedEventsViewQuantDay: TcxGridDBColumn;
    EventGridFeedEventsViewFeedName: TcxGridDBColumn;
    EventGridLevel: TcxGridLevel;
    pEventActions: TPanel;
    sbHideEvents: TSpeedButton;
    cbAllEvents: TDBCheckBoxEh;
    cbFeedEvents: TDBCheckBoxEh;
    NewFeatures1: TMenuItem;
    N27: TMenuItem;
    pmAnimalGridPopup: TPopupMenu;
    AddToQueue1: TMenuItem;
    DefaultHealthEventsAPHISMovementsIn1: TMenuItem;
    cxAnimalGridViewPurchDate: TcxGridDBColumn;
    cxAnimalGridViewPurchPrice: TcxGridDBColumn;
    cxAnimalGridViewSupplierName: TcxGridDBColumn;
    cxAnimalGridViewLotNumber: TcxGridDBColumn;
    cxAnimalGridViewPurchFQAS: TcxGridDBColumn;
    cxAnimalGridViewPurchComment: TcxGridDBColumn;
    cxAnimalGridViewSaleDate: TcxGridDBColumn;
    cxAnimalGridViewFeedGrpDesc: TcxGridDBColumn;
    cxAnimalGridViewPurchFQASDays: TcxGridDBColumn;
    pmAPHISMovementsIn: TPopupMenu;
    APHISMovementsIn1: TMenuItem;
    N30: TMenuItem;
    DefaultEmailClient1: TMenuItem;
    HintStyleController: TcxHintStyleController;
    HintTimer: TTimer;
    gbAnimalComments: TcxGroupBox;
    mAnimalComments: TcxDBMemo;
    AnimalCommentsSplitter: TcxSplitter;
    pmdeleteevent: TPopupMenu;
    DeleteEvent1: TMenuItem;
    cxStyle2: TcxStyle;
    BeefHeifersBetween: TcxStyle;
    BeefHeifersOver: TcxStyle;
    BeefBullsBetween: TcxStyle;
    BeefBullsOver: TcxStyle;
    SteersBetween: TcxStyle;
    SteersOver: TcxStyle;
    cxAnimalGridViewID: TcxGridDBColumn;
    pmFilterMenu: TPopupMenu;
    ClearFilter1: TMenuItem;
    GoTo2: TMenuItem;
    OnFarmEvents2: TMenuItem;
    N28: TMenuItem;
    Help3: TMenuItem;
    pmOnFarmEvents: TPopupMenu;
    cxAnimalGridViewDaysOnFarm: TcxGridDBColumn;
    pmSalesEligibiltyMenu: TPopupMenu;
    FQASReport1: TMenuItem;
    NonFQASReport1: TMenuItem;
    N30Month30Day1: TMenuItem;
    N30Month10Day1: TMenuItem;
    miTestFacility: TMenuItem;
    cxAnimalGridViewPedigree: TcxGridDBColumn;
    GroupSetup1: TMenuItem;
    Email1: TMenuItem;
    ViewMailBox2: TMenuItem;
    DownloadEmailAttachments1: TMenuItem;
    N33: TMenuItem;
    N1: TMenuItem;
    BackupRestore1: TMenuItem;
    PDAReports: TMenuItem;
    VeterinaryTreatments2: TMenuItem;
    BovineHerdRegister2: TMenuItem;
    N2: TMenuItem;
    ICBFIHFARegistration1: TMenuItem;
    CalfRegistration1: TMenuItem;
    N6: TMenuItem;
    cxLabel2: TcxLabel;
    teSearchText: TcxTextEdit;
    cxLabel3: TcxLabel;
    btnSearch: TcxButton;
    pmRetagging: TPopupMenu;
    Retagging2: TMenuItem;
    sbReports: TToolbarButton97;
    cxImage1: TcxImage;
    N34: TMenuItem;
    DownloadKingswoodInstaller1: TMenuItem;
    N35: TMenuItem;
    EmailSettings1: TMenuItem;
    miFacilitator: TMenuItem;
    miDownloadClientData: TMenuItem;
    cmboSearchColumns: TcxComboBox;
    actStartusingbullforbreeding: TAction;
    actStopusingbullforbreeding: TAction;
    cxAnimalGridViewConditionScore: TcxGridDBColumn;
    CreateUKMilkRecorderOption: TMenuItem;
    cxAnimalGridViewCalvingDate: TcxGridDBColumn;
    cxAnimalGridViewServiceDate: TcxGridDBColumn;
    pmShowAnimalOptions: TPopupMenu;
    pmiAllAnimals: TMenuItem;
    pmiAnimalsLeftHerd: TMenuItem;
    pmiBullsInUse: TMenuItem;
    pmiMilkingCows: TMenuItem;
    pmiReplacements: TMenuItem;
    pmiBeefCattle: TMenuItem;
    pmiDairyHeifers: TMenuItem;
    pmiBeefHeifers: TMenuItem;
    pmiBulls: TMenuItem;
    pmiDHThisYear1: TMenuItem;
    pmiDHLastYear: TMenuItem;
    pmiBHThisYear: TMenuItem;
    pmiBHLastYear: TMenuItem;
    actShowAnimalOptions: TActionList;
    N36: TMenuItem;
    N37: TMenuItem;
    actMilkingCows: TAction;
    pmiHeifers: TMenuItem;
    pmiHThisYear: TMenuItem;
    pmiHLastYear: TMenuItem;
    btnShowAnimalsOptions: TcxButton;
    Bevel3: TBevel;
    BThisYear: TMenuItem;
    BLastYear: TMenuItem;
    pmiCurrentHerd: TMenuItem;
    lAnimalSelect: TcxLabel;
   //----------------- New Main Screen Buttons/Actions ---------------------//
    NewSingleEventActionList: TActionList;
    actCalving: TAction;
    actHeatBulling: TAction;
    actService: TAction;
    actPD: TAction;
    actDryOff: TAction;
    actPurchase: TAction;
    actSalesDeaths: TAction;
    actMartFiles: TAction;
    actFactorySales: TAction;
    actMovementPermits: TAction;
    actReconcileHerd: TAction;
    actOrderTags: TAction;
    actRegisterRemarks: TAction;
    actCalfReg: TAction;
    actICBFEventReg: TAction;
    actGroupSetup: TAction;
    actGroupMovements: TAction;
    actPurchGroup: TAction;
    actSalesGroup: TAction;
    actWeighing: TAction;
    actMilkRecording: TAction;
    actParlourLink: TAction;
    actRationCalc: TAction;
    actBulkTank: TAction;
    actVetPurch: TAction;
    actVetTreat: TAction;
    actFeedPurch: TAction;
    actFeedAlloc: TAction;
    actMovementsIn: TAction;
    actMovementsOut: TAction;
    lEventsSection: TPanel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    pBlockEvents: TPanel;
    pMovementsInOutLink: TPanel;
    pbMovementsInOutLink: TPaintBox;
    pGrpAnimalWelfareLink: TPanel;
    pbGrpAnimalWelfareLink: TPaintBox;
    pOnFarmEventsLink: TPanel;
    pbOnFarmEventsLink: TPaintBox;
    lBlockEvents: TcxLabel;
    pSingleAnimalEvent: TPanel;
    pBreedingContainter: TPanel;
    pbBreedingContainter: TPaintBox;
    btnCalving: TcxButton;
    btnHeatBulling: TcxButton;
    btnService: TcxButton;
    btnPD: TcxButton;
    btnDryOff: TcxButton;
    pMovementsContainter: TPanel;
    pbMovementsContainter: TPaintBox;
    btnPurchases: TcxButton;
    btnSalesDeaths: TcxButton;
    btnMartFiles: TcxButton;
    btnFactorySales: TcxButton;
    btnMovementPermits: TcxButton;
    pManagementContainter: TPanel;
    pbManagementContainter: TPaintBox;
    btnWeighing: TcxButton;
    btnMilkRec: TcxButton;
    btnParlourLink: TcxButton;
    btnRationCalc: TcxButton;
    btnBulkTank: TcxButton;
    pVetFeedsContainter: TPanel;
    pbVetFeedsContainter: TPaintBox;
    btnVetPurch: TcxButton;
    btnVetTreats: TcxButton;
    btnFeedPurch: TcxButton;
    btnFeedAlloc: TcxButton;
    pRegCalfRegContainter: TPanel;
    pbRegisterCalfRegContainter: TPaintBox;
    btnReconcileHerd: TcxButton;
    btnCalfRegistration: TcxButton;
    btnICBFEventReg: TcxButton;
    pGroupsContainter: TPanel;
    pbGroupsContainter: TPaintBox;
    btnGroupSetup: TcxButton;
    btnGroupMovement: TcxButton;
    btnPurchaseGroup: TcxButton;
    btnSalesGroup: TcxButton;
    pbKingswoodLinksContainer: TPaintBox;
    btnICBFImport: TcxButton;
    btnFactorySales1: TcxButton;
    btnMartFiles1: TcxButton;
    btnVetLink: TcxButton;
    pBreedingLink: TPanel;
    pbBreedingLink: TPaintBox;
    pMovementsLink: TPanel;
    pbMovementsLink: TPaintBox;
    lMovementsLink: TcxLabel;
    pVeterinaryFeedsLink: TPanel;
    pbVeterinaryFeedsLink: TPaintBox;
    lVeterinaryFeedsLink: TcxLabel;
    pRegisterCalfRegLink: TPanel;
    pbRegisterCalfRegLink: TPaintBox;
    lRegisterCalfRegLink: TcxLabel;
    pGroupsLink: TPanel;
    pbGroupsLink: TPaintBox;
    lGroupsLink: TcxLabel;
    pManagementLink: TPanel;
    pbManagementLink: TPaintBox;
    lManagementLink: TcxLabel;
    pKingswoodLink1: TPanel;
    pbAnimalWelfareLink: TPaintBox;
    lKingswoodLinks: TcxLabel;
    lBreedingLink: TcxLabel;
    lGrpAnimalWelfareLink: TcxLabel;
    lOnFarmEventsLink: TcxLabel;
    lMovementsInOutLink: TcxLabel;
    actAPHISEPermit: TAction;
    actHUKIReg: TAction;
    pBlockMovementsContainer: TPanel;
    pbBlockMovementsContainer: TPaintBox;
    btnMovementsIn: TcxButton;
    btnMovementsOut: TcxButton;
    lEventPanelDesc: TcxLabel;
    pCrushContainer: TPanel;
    pbCrushContainer: TPaintBox;
    btnCrushAddAnimal: TcxButton;
    btnCrushUpdateAnima: TcxButton;
    btnCrushSales: TcxButton;
    actCrushAddAnimal: TAction;
    actCrushUpdateAnimal: TAction;
    actCrushSales: TAction;
    MilkTemperament1: TMenuItem;
    btnTopCart: TcxButton;
    btnTopFilter: TcxButton;
    sbImportFile: TKRxSpeedButton;
    sbExport: TKRxSpeedButton;
    pmExportOptions: TPopupMenu;
    pmiExportKCarson: TMenuItem;
    pmiCreatetMilkRecEvents: TMenuItem;
    pmiCreateMooreparkFile: TMenuItem;
    btnClearSelect: TcxButton;
    pParlourEventsLink: TPanel;
    pbParlourEventsLink: TPaintBox;
    lParlourEventsLink: TcxLabel;
    pmiAllCalves: TMenuItem;
    pmiCalvesThisYear: TMenuItem;
    pmiCalvesLastYear: TMenuItem;
    N39: TMenuItem;
    miCC31ARequest2: TMenuItem;
    miCC31BRequest2: TMenuItem;
    actAIM31ARequest: TAction;
    actAIM31bRequest: TAction;
    actAIMMovementNotification: TAction;
    actAIMMovementEnquiry: TAction;
    actAIMHerdProfile: TAction;
    pmiExportTescoHerdScoringEvents : TMenuItem;
    pmAIMMovements: TPopupMenu;
    AIM31AComplianceCertRequest1: TMenuItem;
    AIM31BComplianceCertRequest1: TMenuItem;
    AIMMovementNotification1: TMenuItem;
    N40: TMenuItem;
    AIMMovementNotification2: TMenuItem;
    DownloadNETFramework1: TMenuItem;
    N41: TMenuItem;
    btnHerdStats: TcxButton;
    btnEventDiary: TcxButton;
    actHerdStats: TAction;
    AISireDairyCo: TMenuItem;
    btnCrushFilterAnimals: TcxButton;
    actCrushAnimalFilter: TAction;
    pmiCowsInMilk: TMenuItem;
    pmiCowsDry: TMenuItem;
    pmiAllCows: TMenuItem;
    cxAnimalGridViewBVDTestDate: TcxGridDBColumn;
    N31GPermit1: TMenuItem;
    AIMReconcil1: TMenuItem;
    N42: TMenuItem;
    act31GPermitApplication: TAction;
    miSyncSettings: TMenuItem;
    N43: TMenuItem;
    actSyncSettings: TAction;
    btnSyncSettings: TcxButton;
    actSyncData: TAction;
    miHerdSync: TMenuItem;
    SyncOptions1: TMenuItem;
    actSyncOptions: TAction;
    pmCalfRegOptions: TPopupMenu;
    miAIMCalfRegistrationEnquiry: TMenuItem;
    actAIMCalfRegistrationEnquiry: TAction;
    cxAnimalGridViewDaysInMilk: TcxGridDBColumn;
    CaflRegistrationByEmail1: TMenuItem;
    N44: TMenuItem;
    pmImportOptions: TPopupMenu;
    pmiImportICBFData: TMenuItem;
    actImportICBFData: TAction;
    actImportDanRyanData: TAction;
    actFilterCart: TAction;
    btnTempMoveOut: TcxButton;
    btnTempMoveIn: TcxButton;
    actTempMovesIn: TAction;
    actTempMovesOut: TAction;
    miCrushXMLSep: TMenuItem;
    miCrushXMLImport: TMenuItem;
    smiMedicines: TMenuItem;
    smiUnits: TMenuItem;
    smiAdminBy: TMenuItem;
    smiPrescribedBy: TMenuItem;
    smiFeedTypes: TMenuItem;
    smiManufacturers: TMenuItem;
    ResetSyncData1: TMenuItem;
    ResetActiveBullList: TMenuItem;
    cxAnimalGridViewTransponderNo: TcxGridDBColumn;
    actImportVetDrugRegister: TAction;
    cxAnimalGridViewQualityAssured: TcxGridDBColumn;
    cxAnimalGridViewDaysToFQAS: TcxGridDBColumn;
    actAIMMovements: TAction;
    btnAimMovements: TcxButton;
    lAIMICBFMore: TcxLabel;
    pmAIMICBFMoreOptions: TPopupMenu;
    RegisterRemarks2: TMenuItem;
    N45: TMenuItem;
    btnBordBiaRedTrac: TcxButton;
    ToolbarSep972: TToolbarSep97;
    btnReviewMedicines: TcxButton;
    actBordBia: TAction;
    smiMedicinePurchase: TMenuItem;
    smsiMedicineAdd: TMenuItem;
    smsiMedicineEdit: TMenuItem;
    actReviewMedicine: TAction;
    ReloadSyncEvents1: TMenuItem;
    N46: TMenuItem;
    ResyncAnimalwhenprogramsynchronzies1: TMenuItem;
    actSyncAnimal: TAction;
    cxAnimalGridViewCalvingInterval: TcxGridDBColumn;
    cxAnimalGridViewCowFamily: TcxGridDBColumn;
    ViewSyncWarnings1: TMenuItem;
    RemoveAnimalNoDuplicates1: TMenuItem;
    pmiOrderTags: TMenuItem;
    btnAIMMovementEnq: TcxButton;
    miStartusingbullforbreeding: TMenuItem;
    miStopusingbullforbreeding: TMenuItem;
    actQueryAimAnimalDetails: TAction;
    actQueryAimAnimalDetailByBatch: TAction;
    AIMQueryAnimalHistory1: TMenuItem;
    pmAIMMovementEnq: TPopupMenu;
    pmiAIMMovementListing: TMenuItem;
    pmiAIMImportSalesDeaths: TMenuItem;
    pmiAIMAnimalDetails: TMenuItem;
    pKingswoodLinksContainer: TPanel;
    btnCows365: TcxButton;
    actICBFEmailAttach: TAction;
    actIMartFilesAttach: TAction;
    actFactorySalesAttach: TAction;
    actVetLinkAttach: TAction;
    actCows365Attach: TAction;
    actAIMMovementMenu: TAction;
    btnVetStats: TcxButton;
    actTreatmentStats: TAction;
    pmAddMedicine: TPopupMenu;
    pmiAddMedicine: TMenuItem;
    pmiSpecifyMedicineTypes: TMenuItem;
    actMedicineNullTypes: TAction;
    pmiBulkTank: TMenuItem;
    RemoveDuplicateAIBulls1: TMenuItem;
    pmiAddMedSupplier: TMenuItem;
    pmiAddMedAdminBy: TMenuItem;
    SetBordBiaClient: TMenuItem;
    SetBordBiaClientLogin: TMenuItem;
    SetBordBiaClientConfig: TMenuItem;
    actBordBiaClientConfig: TAction;
    actBordBiaClientSettings: TAction;
    btnCrushVetTreat: TcxButton;
    actCrushVetTreat: TAction;
    actRedTractor: TAction;
    cxAnimalGridViewPurchWeight: TcxGridDBColumn;
    lRefreshAttachments: TcxLabel;
    imgRefreshAttachments: TImage;
    miSettings: TMenuItem;
    pmVetStats: TPopupMenu;
    pmiTreatmentSummary: TMenuItem;
    pmiDiseaseSummary: TMenuItem;
    actDiseaseSummary: TAction;
    N50: TMenuItem;
    pmiReverseFilter: TMenuItem;
    actReverseFilter: TAction;
    cxAnimalGridViewPDStatus: TcxGridDBColumn;
    actImportParlourData: TAction;
    ImportParlourData1: TMenuItem;
    ShowParlourEventsTimer: TTimer;
    EventGridFeedEventsViewEndDate: TcxGridDBColumn;
    EventGridFeedEventsViewNoDays: TcxGridDBColumn;
    N51: TMenuItem;
    pmiChangeCustomerSupplierNames: TMenuItem;
    cxAnimalGridViewBatchGrpDesc: TcxGridDBColumn;
    pmiDanRyanImport: TMenuItem;
    miData: TMenuItem;
    pmiTagReconcile: TMenuItem;
    pCommentDB: TPanel;
    AnimalCommentDBNavigator: TcxDBNavigator;
    AISireFromBeefRegister: TMenuItem;
    actExportGridToCSV: TAction;
    N52: TMenuItem;
    pmiExportAnimalGridCSVFile: TMenuItem;
    miMoveEventLactNo: TMenuItem;
    actMoveEventLactNoUtility: TAction;
    pmiClearSoldAnimalTransponders: TMenuItem;
    actClearSoldAnimalTransponders: TAction;
    pmiAIMImportPurchases: TMenuItem;
    miFixAnimalLactationNumbers: TMenuItem;
    pmStockBullEvent: TPopupMenu;
    pmiStockBullIn: TMenuItem;
    pmiStockBullOut: TMenuItem;
    actStockBullIn: TAction;
    actStockBullOut: TAction;
    pmiUpdateHerdDesignator: TMenuItem;
    actUpdateHerdDesignator: TAction;
    DeletedAnimals1: TMenuItem;
    pmUndeleteAnimal: TPopupMenu;
    pmiUndeleteAnimal: TMenuItem;
    actUndeleteAnimal: TAction;
    ShowDeletedAnimals1: TMenuItem;
    DeleteSelectedAnimal1: TMenuItem;
    actDeleteAnimal: TAction;
    miSyncNow: TMenuItem;
    actSyncNow: TAction;
    N53: TMenuItem;
    BordBiaEventHintTimer: TTimer;
    pBordBiaLink: TPanel;
    pbBordBiaLink: TPaintBox;
    lBordBiaLink: TcxLabel;
    btnFeedDiary: TcxButton;
    actFeedDiary: TAction;
    btnGroupFeedAlloc: TcxButton;
    EventGridFeedEventsViewTotalCalcCost: TcxGridDBColumn;
    CowPDdPregnant: TMenuItem;
    CowNotPregnant: TMenuItem;
    RepPDdPregnant: TMenuItem;
    RepNotPregnant: TMenuItem;
    AllReplacements: TMenuItem;
    N54: TMenuItem;
    pmiCreateFromFilter: TMenuItem;
    pmiBatchGroupFromFilter: TMenuItem;
    actCreateBatchGroupFilter: TAction;
    pmiFeedGroupFromFilter: TMenuItem;
    actCreateFeedGroupFilter: TAction;
    actCreateBatchGroupCart: TAction;
    actCreateFeedGroupCart: TAction;
    pmAnimalCartPopup: TPopupMenu;
    ClearCart1: TMenuItem;
    ViewCart1: TMenuItem;
    N32: TMenuItem;
    AddAlltoCart1: TMenuItem;
    AddToQueue2: TMenuItem;
    FilterCart1: TMenuItem;
    RestoreCartCreatedOnApp1: TMenuItem;
    N55: TMenuItem;
    pmiCreateFromCart: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    N29: TMenuItem;
    GoTo1: TMenuItem;
    OnFarmEvents1: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    pmiGroupSetup: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    EnableSpaceBar1: TMenuItem;
    Help2: TMenuItem;
    MenuItem35: TMenuItem;
    pmiDrafting: TMenuItem;
    N23: TMenuItem;
    actGroupSetupFromCart: TAction;
    actGroupSetupFromFilter: TAction;
    actGoToCC31ACart: TAction;
    actGoToCC31BCart: TAction;
    actGoToCC31AFilter: TAction;
    actGoToCC31BFilter: TAction;
    cxAnimalGridViewOverallGainPerDay: TcxGridDBColumn;
    actRefreshAnimals: TAction;
    btnImport: TcxButton;
    btnExport: TcxButton;
    RemoveSyncingFromThisMachine1: TMenuItem;
    actStopSyncingOnThisMachine: TAction;
    N38: TMenuItem;
    UpdateServiceComments1: TMenuItem;
    pmiSoldAnimals: TMenuItem;
    pmiDeadAnimals: TMenuItem;
    ChangeAnimalDetails1: TMenuItem;
    AnimalNumbers1: TMenuItem;
    TransponderNumbers1: TMenuItem;
    actUpdateAnimalDetailsAnimalNo: TAction;
    actUpdateAnimalDetailsTransponder: TAction;
    ChangeAnimalDetails2: TMenuItem;
    imgFarmSafetyLogo: TImage;
    actGroupVetTreat: TAction;
    actGroupWeighing: TAction;
    actShowDeathEvent: TAction;
    ClearDiseaseTestDates1: TMenuItem;
    DeleteGroupsNotUsed: TMenuItem;
    pmiImportTransponderDataToCart: TMenuItem;
    actImportTransponderFileToCart: TAction;
    pmiLeftHerdCulled: TMenuItem;
    mnuTeamViewer: TMenuItem;
    N31: TMenuItem;
    N47: TMenuItem;
    pmiAnimalDetailsByCart: TMenuItem;
    JohnesHigh: TcxStyle;
    JohnesMedium: TcxStyle;
    JohnesLow: TcxStyle;
    cxAnimalGridViewJohnesResult: TcxGridDBColumn;
    cxAnimalGridViewStatus: TcxGridDBColumn;
    pmGroupSetup: TPopupMenu;
    pmiEditGroup: TMenuItem;
    pmiAutoArchive: TMenuItem;
    actAutoArchive: TAction;
    pmNewAddSireList: TPopupMenu;
    pmiAISire: TMenuItem;
    psmDairyAI: TMenuItem;
    psmBeefAI: TMenuItem;
    psmManualAI: TMenuItem;
    pmNonHerdStockBull: TMenuItem;
    pmiNonHerdDam: TMenuItem;
    psmDairyCoAI: TMenuItem;
    pmiAHDBFile: TMenuItem;
    cxAnimalGridViewCustomerName: TcxGridDBColumn;
    cxAnimalGridViewLactSCC: TcxGridDBColumn;
    cxAnimalGridViewLactYield: TcxGridDBColumn;
    cxAnimalGridViewLactSolids: TcxGridDBColumn;
    cxAnimalGridViewLatestYield: TcxGridDBColumn;
    cxAnimalGridViewPurchCosts: TcxGridDBColumn;
    cxAnimalGridViewQANoMovements: TcxGridDBColumn;
    pmiA1A2Result: TMenuItem;
    actAddA1A2Result: TAction;
    cxAnimalGridViewA1A2Result: TcxGridDBColumn;
    pmiA1A2ResultFile: TMenuItem;
    cxAnimalGridViewPurchCommission: TcxGridDBColumn;
    cxAnimalGridViewPurchTransport: TcxGridDBColumn;
    cxAnimalGridViewSalePrice: TcxGridDBColumn;
    cxAnimalGridViewSaleCosts: TcxGridDBColumn;
    btnModifyGrid: TRxSpeedButton;
    actModifyGrid: TAction;
    cxAnimalGridViewBfatWeight: TcxGridDBColumn;
    cxAnimalGridViewProtWeight: TcxGridDBColumn;
    cxAnimalGridViewLatestSolids: TcxGridDBColumn;
    N48: TMenuItem;
    mnuiCalvingHelp: TMenuItem;
    actCalvingHelp: TAction;
    pmSuckCalvingHelp: TPopupMenu;
    pmiSuckCalvingHelp: TMenuItem;
    cxStyleBullNoBreed: TcxStyle;
    pmNatIdSort: TPopupMenu;
    pmiNatIdSort: TMenuItem;
    pmiNatIdLast4Digits: TMenuItem;
    pmiNatIdCheckDigit: TMenuItem;
    pmiStockSires: TMenuItem;
    pmiListStockBulls: TMenuItem;
    pmiPurchaseStockBull: TMenuItem;
    cxAnimalGridViewPricePerKg: TcxGridDBColumn;
    cxAnimalGridViewColdDeadWt: TcxGridDBColumn;
    btnRefreshAnimals: TRxSpeedButton;
    cxAnimalGridViewGrossMargin: TcxGridDBColumn;
    cxAnimalGridViewSalesGrade: TcxGridDBColumn;
   //--------------------------------------//

    procedure ExitButtonClick(Sender: TObject);
    procedure BullingButtonClick(Sender: TObject);
    procedure WeightButtonClick(Sender: TObject);
    procedure bReportsClick(Sender: TObject);
    procedure ServiceClick(Sender: TObject);
    procedure PDsButtonClick(Sender: TObject);
    procedure DryOffButtonClick(Sender: TObject);
    procedure HealthClick(Sender: TObject);
    procedure CalvingButtonClick(Sender: TObject);
    procedure PurchButtonClickClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SalesButton1Click(Sender: TObject);
    procedure sbMilkRec1Click(Sender: TObject);
    procedure bBackUpClick(Sender: TObject);
    procedure bSystemClick(Sender: TObject);
    procedure cbDefaultHerd1Change(Sender: TObject);
    procedure bBreeding2Exit(Sender: TObject);
    procedure ReIndex1Click(Sender: TObject);
    procedure BovineHerdRegister1Click(Sender: TObject);
    procedure StockOnHand1Click(Sender: TObject);
    procedure PurchaseSalesAnalysis1Click(Sender: TObject);
    procedure PremiumReport1Click(Sender: TObject);
    procedure VeterinaryTreatments1Click(Sender: TObject);
    procedure VeterinaryPurchases1Click(Sender: TObject);
    procedure CalfRegistration1Click(Sender: TObject);
    procedure HeatsAndServices1Click(Sender: TObject);
    procedure BullsUsedInHerd1Click(Sender: TObject);
    procedure BrowseSireRegister1Click(Sender: TObject);
    procedure SireSelection1Click(Sender: TObject);
    procedure QuotaPlanner1Click(Sender: TObject);
    procedure BestCowsInHerd1Click(Sender: TObject);
    procedure CowEnrolmentFormMR21Click(Sender: TObject);
    procedure MilkProductionGraphs1Click(Sender: TObject);
    procedure HerdBrochure1Click(Sender: TObject);
    procedure SalesCatelog1Click(Sender: TObject);
    procedure FirstAnimal1Click(Sender: TObject);
    procedure NextAnimal1Click(Sender: TObject);
    procedure PreviousAnimal1Click(Sender: TObject);
    procedure LastAnimal1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure HerdSettings1Click(Sender: TObject);
    procedure MilkDiskParameters1Click(Sender: TObject);
    procedure SetNationalIDtype1Click(Sender: TObject);
    procedure Customers1Click(Sender: TObject);
    procedure Suppliers1Click(Sender: TObject);
    procedure Breeds1Click(Sender: TObject);
    procedure Buyers1Click(Sender: TObject);
    procedure SystemUsers1Click(Sender: TObject);
    procedure Menu1Click(Sender: TObject);
    procedure Statusbar1Click(Sender: TObject);
    procedure ToolBar2Click(Sender: TObject);
    procedure sbHelp1Click(Sender: TObject);
    procedure VisitKingswoodOnline1Click(Sender: TObject);
    procedure Index1Click(Sender: TObject);
    procedure SearchforHelpOn1Click(Sender: TObject);
    procedure HowtoUseHelp1Click(Sender: TObject);
    procedure SalesReport1Click(Sender: TObject);
    procedure ResolutionOptions1Click(Sender: TObject);
    procedure EventIcons1Click(Sender: TObject);
    procedure MovementPermits1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbFiltersClick(Sender: TObject);
//    procedure qAnimalsAfterScroll(DataSet: TDataSet);
    procedure KingswoodHerdManagement1Click(Sender: TObject);
    procedure Weighing1Click(Sender: TObject);
    procedure sbActivitiesSinceLastTestClick(Sender: TObject);
    procedure sbMilkDiskReviewClick(Sender: TObject);
    procedure sbAnimalsPaddocks1Click(Sender: TObject);
    procedure ShowHintsatStartupClick(Sender: TObject);
    procedure AMTipExecuted(Sender: TObject; StartNextTime: Boolean);
    procedure sbBeefPurchGrpRepClick(Sender: TObject);
    procedure ReLinkCalves1Click(Sender: TObject);
    procedure sbICBFRegClick(Sender: TObject);
    procedure BackUpTimerTimer(Sender: TObject);
    procedure AutoBackup1Click(Sender: TObject);
    procedure sbFeedPurchClick(Sender: TObject);
    procedure sbFeedAllocClick(Sender: TObject);
    procedure sbAccountsClick(Sender: TObject);
    procedure sbReportGenerator(Sender: TObject);
    procedure FeedTypes1Click(Sender: TObject);
    procedure AMTipBtnCloseClick(Sender: TObject);
    procedure sbSheepClick(Sender: TObject);
    procedure sbRationCalcClick(Sender: TObject);
    procedure sbMilkSysRecClick(Sender: TObject);
    procedure EuroClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PoundClick(Sender: TObject);
    procedure RestrictedAnimalsReport1Click(Sender: TObject);
    procedure sbHerdStatsClick(Sender: TObject);
    procedure sbPedigreeRegClick(Sender: TObject);
    procedure sbRegistrationClick(Sender: TObject);
    procedure DefaultAccsCompany1Click(Sender: TObject);
    procedure ConditionScore1Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure pBeefSalesClick(Sender: TObject);
    procedure pFileImportClick(Sender: TObject);
    procedure pFileExportClick(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure sbExtensLivestkProjClick(Sender: TObject);
    procedure sbNatIdSearchResetClick(Sender: TObject);
    procedure sbAnimalViewClick(Sender: TObject);
    procedure sbFertAnalysisClick(Sender: TObject);
    procedure CreateMooreParkExportFile1Click(Sender: TObject);
    procedure sbSalesPlannerClick(Sender: TObject);
    procedure DiseaseTestStatus1Click(Sender: TObject);
    procedure RestrictedAnimalsReport2Click(Sender: TObject);
    procedure SalesPlanner1Click(Sender: TObject);
    procedure PremiumHistoryEligibility1Click(Sender: TObject);
    procedure Extensification1Click(Sender: TObject);
    procedure SlaughterPremium1Click(Sender: TObject);
    procedure BeefPremium1Click(Sender: TObject);
    procedure KingswoodComputing1Click(Sender: TObject);
    procedure Bandon1Click(Sender: TObject);
    procedure ICBF1Click(Sender: TObject);
    procedure CheckPhoneLinkOnStartupClick(Sender: TObject);
    procedure InventoryValuations1Click(Sender: TObject);
    procedure NokiaLink1Click(Sender: TObject);
    procedure sbParlourClick(Sender: TObject);
    procedure cbAllAnimalsClick(Sender: TObject);
    procedure cbAllEventsClick(Sender: TObject);
    procedure cbFeedEventsClick(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure Checkfornewevents1Click(Sender: TObject);
    procedure Perferences1Click(Sender: TObject);
    procedure SiemensGSMModule1Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure picPreSaleClick(Sender: TObject);
    procedure Blade1Click(Sender: TObject);
    procedure TermsofUse1Click(Sender: TObject);
    procedure sbHerdReconciliationClick(Sender: TObject);
    procedure sbHideEventsClick(Sender: TObject);
    procedure sbDairyBMClick(Sender: TObject);
    procedure UpdateAnimalNumberField1Click(Sender: TObject);
    procedure DueService2Click(Sender: TObject);
    procedure DuePregnancyDiagnosis2Click(Sender: TObject);
    procedure DueForDryingOff2Click(Sender: TObject);
    procedure DueToCalve2Click(Sender: TObject);
    procedure sbMilkReportGeneratorRGClick(Sender: TObject);
    procedure sbDairyHealthCertClick(Sender: TObject);
    procedure sbBackupClick(Sender: TObject);
    procedure sbSCCAnalysisRptClick(Sender: TObject);
    procedure Settings2Click(Sender: TObject);
    procedure ExportToPDAClick(Sender: TObject);
    procedure sbCMMSReconClick(Sender: TObject);
    procedure DownloadEvents1Click(Sender: TObject);
    procedure EventGridAnimalEventsViewDblClick(Sender: TObject);
    procedure cxAnimalGridViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxAnimalGridViewSortNatIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewSortAnimalNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewRTGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewTTGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure AnimalsEventsSplitterAfterClose(Sender: TObject);
    procedure AnimalsEventsSplitterBeforeOpen(Sender: TObject;
      var NewSize: Integer; var AllowOpen: Boolean);
    procedure sbGroupUpdateClick(Sender: TObject);
    procedure EventGridFeedEventsViewDblClick(Sender: TObject);
    procedure cxAnimalGridViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxAnimalGridViewDataControllerFilterBeforeChange(
      Sender: TcxDBDataFilterCriteria; ADataSet: TDataSet;
      const AFilterText: String);
    procedure CreateEBIValuesYoungstockonly1Click(Sender: TObject);
    procedure cxAnimalGridViewNatIDNumHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewAnimalNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewSexHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewDateOfBirthHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewLactNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewNameHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewHerdBookNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewBirthWeightHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewBrucellosisHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewTBTestDateHeaderClick(Sender: TObject);
    procedure UpdateAnimalLactations1Click(Sender: TObject);
    procedure tbDownloadClick(Sender: TObject);
    procedure sbProfitMonitorSummaryClick(Sender: TObject);
    procedure eNatIDNumEnter(Sender: TObject);
    procedure RxSpeedButton4Click(Sender: TObject);
    procedure cxAnimalGridViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actPrintGridExecute(Sender: TObject);
    procedure actEventHistoryExecute(Sender: TObject);
    procedure actClearFilterExecute(Sender: TObject);
    procedure cxAnimalGridViewSortAnimalNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewSortNatIDHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewEBIHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewBreedCodeHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewColourCodeHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewRTHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewTTHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewDamAnimalNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewDamNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewSireNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewDamAnimalNoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure cxAnimalGridViewSireNoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure cxAnimalGridViewDamAnimalNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewDamNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewSireNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewDamAnimalNoGetFilterValues(
      Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
    procedure cxAnimalGridViewDamNoGetFilterValues(
      Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
    procedure cxAnimalGridViewSireNoGetFilterValues(
      Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
    procedure cxAnimalGridViewDamNoGetFilterDisplayText(
      Sender: TcxCustomGridTableItem; const AValue: Variant;
      var ADisplayText: String);
    procedure cxAnimalGridViewSireNoGetFilterDisplayText(
      Sender: TcxCustomGridTableItem; const AValue: Variant;
      var ADisplayText: String);
    procedure cxAnimalGridViewDamAnimalNoGetFilterDisplayText(
      Sender: TcxCustomGridTableItem; const AValue: Variant;
      var ADisplayText: String);
    procedure BreedingPageControlDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure SeasonalCalvingHerds1Click(Sender: TObject);
    procedure SpreadCalvingHerds1Click(Sender: TObject);
    procedure PremiumHistoryReport1Click(Sender: TObject);
    procedure miDARDDairyFertilityBenchmarksClick(Sender: TObject);
    procedure AnimalGridNavBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MachineryLinkClick(Sender: TObject);
    procedure sbCAFREFertListClick(Sender: TObject);
    procedure HintStyleControllerShowHint(Sender: TObject;
      var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure FormShow(Sender: TObject);
    procedure sbAddAnimalTypeClick(Sender: TObject);
    procedure cxAnimalGridViewEBIGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure DueToBeCulled1Click(Sender: TObject);
    procedure InherdAnimalClick(Sender: TObject);
    procedure AISireProvenDairyClick(Sender: TObject);
    procedure AISireTestBeefClick(Sender: TObject);
    procedure NonHerdAncestor1Click(Sender: TObject);
    procedure sbGroupSalesClick(Sender: TObject);
    procedure sbPurchaseClick(Sender: TObject);
    procedure SwitchTo1Click(Sender: TObject);
    procedure ViewAnimalEvent1Click(Sender: TObject);
    procedure actNavFirstExecute(Sender: TObject);
    procedure actNavFirstUpdate(Sender: TObject);
    procedure actNavPreviousUpdate(Sender: TObject);
    procedure actNavNextUpdate(Sender: TObject);
    procedure actNavLastExecute(Sender: TObject);
    procedure actNavLastUpdate(Sender: TObject);
    procedure actNavPreviousExecute(Sender: TObject);
    procedure actNavNextExecute(Sender: TObject);
    procedure ICBFEventRegistration1Click(Sender: TObject);
    procedure CreateWeeklyDiaryEvents1Click(Sender: TObject);
    procedure DiseaseTestStatus2Click(Sender: TObject);
    procedure Historical1Click(Sender: TObject);
    procedure AddNewBreed1Click(Sender: TObject);
    procedure sbMachineryClick(Sender: TObject);
    procedure sbMartMovementsClick(Sender: TObject);
    procedure TemporaryMovement2Click(Sender: TObject);
    procedure GettingStarted1Click(Sender: TObject);
    procedure sbGettingStarte2dClick(Sender: TObject);
    procedure sbRegisterRemarkClick(Sender: TObject);
    procedure sbGettingStartedClick(Sender: TObject);
    procedure CMMSFileImport1Click(Sender: TObject);
    procedure RunPDAHerdInstallerClick(Sender: TObject);
    procedure RunPDAFieldsInstallerClick(Sender: TObject);
    procedure HistoricalCalving1Click(Sender: TObject);
    procedure HerdUtils1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure LivestockProductionRate1Click(Sender: TObject);
    procedure ResetAnimalGridColumns1Click(Sender: TObject);
    procedure cxAnimalGridViewDataControllerFilterChanged(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure AccsDatabasesClick(Sender: TObject);
    procedure FertilityTreatmentsReport1Click(Sender: TObject);
    procedure pmFertilityTreatmentsReportPopup(Sender: TObject);
    procedure MedicineStock1Click(Sender: TObject);
    procedure FertilityPrograms1Click(Sender: TObject);
    procedure ReplacementTagForm1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure eNameSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FertilityTreatmentChart1Click(Sender: TObject);
    procedure KingswoodHerdDevelopments1Click(Sender: TObject);
    procedure AddToQueue1Click(Sender: TObject);
    procedure ClearCart1Click(Sender: TObject);
    procedure sbAddAnimalToCartClick(Sender: TObject);
    procedure CTSLogin1Click(Sender: TObject);
    procedure DefaultHealthEventsAPHISMovementsIn1Click(Sender: TObject);
    procedure APHISMovementsIn1Click(Sender: TObject);
    procedure DefaultEmailClient1Click(Sender: TObject);
    procedure sbLivestockNutrientProjectionClick(Sender: TObject);
    procedure HintTimerTimer(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EventGridAnimalEventsViewCellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DeleteEvent1Click(Sender: TObject);
    procedure FileExport1Click(Sender: TObject);
    procedure TagReplacementForm1Click(Sender: TObject);
    procedure ViewCart1Click(Sender: TObject);
    procedure Help3Click(Sender: TObject);

    procedure GroupHealthClick(Sender : TObject);
    procedure GroupBullingClick(Sender : TObject);
    procedure GroupServiceClick(Sender : TObject);
    procedure GroupDryOffClick(Sender : TObject);
    procedure GroupWeighingClick(Sender : TObject);
    procedure GroupPregDiagClick(Sender : TObject);
    procedure GroupTBTestClick(Sender : TObject);
    procedure GroupBruceTestClick(Sender : TObject);
    procedure GroupTempMoveClick(Sender : TObject);
    procedure GroupFertilityCheckClick(Sender : TObject);
    procedure GroupConditionScoreClick(Sender : TObject);
    procedure GroupMilkTempermentClick(Sender : TObject);
    procedure AddAlltoCart1Click(Sender: TObject);
    procedure SalesPlanner2Click(Sender: TObject);
    procedure FQASReport1Click(Sender: TObject);
    procedure NonFQASReport1Click(Sender: TObject);
    procedure N30Month30Day1Click(Sender: TObject);
    procedure N30Month10Day1Click(Sender: TObject);
    procedure pmAnimalGridPopupPopup(Sender: TObject);
    procedure DownloadEmailAttachments1Click(Sender: TObject);
    procedure ViewMailBox2Click(Sender: TObject);
    procedure sbGroupSetupClick(Sender: TObject);
    procedure pcMultipleAnimalsDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure RecentChanges1Click(Sender: TObject);
    procedure cmboSearchColumnsPropertiesChange(Sender: TObject);
    procedure cmboSearchColumnsPropertiesEditValueChanged(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure teSearchTextEnter(Sender: TObject);
    procedure teSearchTextPropertiesChange(Sender: TObject);
    procedure teSearchTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbAPHISEPermitClick(Sender: TObject);
    procedure NotifyHUK1Click(Sender: TObject);
    procedure teSearchTextExit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure AnimalsEventsSplitterCanResize(Sender: TObject;
      var NewSize: Integer; var Accept: Boolean);
    procedure Retagging2Click(Sender: TObject);
    procedure sbTagReplacementClick(Sender: TObject);
    procedure EmailSettings1Click(Sender: TObject);
    procedure miDownloadClientDataClick(Sender: TObject);
    procedure actStopusingbullforbreedingExecute(Sender: TObject);
    procedure actStartusingbullforbreedingExecute(Sender: TObject);
    procedure cxAnimalGridViewConditionScoreHeaderClick(Sender: TObject);
    procedure CreateUKMilkRecorderOptionClick(Sender: TObject);
    procedure cxAnimalGridViewCalvingDateHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewServiceDateHeaderClick(Sender: TObject);
    procedure AnimalSelectClick(Sender: TObject);
    procedure pmShowAnimalOptionsPopup(Sender: TObject);
    procedure pmFilterMenuPopup(Sender: TObject);
    procedure lBreedingLinkClick(Sender: TObject);
    procedure pbBreedingLinkPaint(Sender: TObject);
    procedure pbBreedingContainterPaint(Sender: TObject);
    procedure lMovementsLinkClick(Sender: TObject);
    procedure pbMovementsContainterPaint(Sender: TObject);
    procedure pbMovementsLinkPaint(Sender: TObject);
    procedure lVeterinaryFeedsLinkClick(Sender: TObject);
    procedure pbVetFeedsContainterPaint(Sender: TObject);
    procedure pbVeterinaryFeedsLinkPaint(Sender: TObject);
    procedure lRegisterCalfRegLinkClick(Sender: TObject);
    procedure pbRegisterCalfRegContainterPaint(Sender: TObject);
    procedure pbRegisterCalfRegLinkPaint(Sender: TObject);
    procedure lGroupsLinkClick(Sender: TObject);
    procedure pbGroupsLinkPaint(Sender: TObject);
    procedure pbGroupsContainterPaint(Sender: TObject);
    procedure lManagementLinkClick(Sender: TObject);
    procedure pbManagementLinkPaint(Sender: TObject);
    procedure pbManagementContainterPaint(Sender: TObject);
    procedure lKingswoodLinksClick(Sender: TObject);
    procedure pbAnimalWelfareLinkPaint(Sender: TObject);
    procedure pbKingswoodLinksContainerPaint(Sender: TObject);
    procedure pbOnFarmEventsLinkPaint(Sender: TObject);
    procedure lOnFarmEventsLinkClick(Sender: TObject);
    procedure pbMovementsInOutLinkPaint(Sender: TObject);
    procedure lMovementsInOutLinkClick(Sender: TObject);
    procedure pbBlockMovementsContainerPaint(Sender: TObject);
    procedure lGrpAnimalWelfareLinkClick(Sender: TObject);
    procedure actCalvingExecute(Sender: TObject);
    procedure actHeatBullingExecute(Sender: TObject);
    procedure actServiceExecute(Sender: TObject);
    procedure actPDExecute(Sender: TObject);
    procedure actDryOffExecute(Sender: TObject);
    procedure actPurchaseExecute(Sender: TObject);
    procedure actSalesDeathsExecute(Sender: TObject);
    procedure actMartFilesExecute(Sender: TObject);
    procedure actFactorySalesExecute(Sender: TObject);
    procedure actMovementPermitsExecute(Sender: TObject);
    procedure actVetPurchExecute(Sender: TObject);
    procedure actVetTreatExecute(Sender: TObject);
    procedure actFeedPurchExecute(Sender: TObject);
    procedure actFeedAllocExecute(Sender: TObject);
    procedure actReconcileHerdExecute(Sender: TObject);
    procedure actOrderTagsExecute(Sender: TObject);
    procedure actRegisterRemarksExecute(Sender: TObject);
    procedure actCalfRegExecute(Sender: TObject);
    procedure actICBFEventRegExecute(Sender: TObject);
    procedure actGroupSetupExecute(Sender: TObject);
    procedure actGroupMovementsExecute(Sender: TObject);
    procedure actPurchGroupExecute(Sender: TObject);
    procedure actSalesGroupExecute(Sender: TObject);
    procedure actWeighingExecute(Sender: TObject);
    procedure actMilkRecordingExecute(Sender: TObject);
    procedure actParlourLinkExecute(Sender: TObject);
    procedure actRationCalcExecute(Sender: TObject);
    procedure actBulkTankExecute(Sender: TObject);
    procedure actMovementsInExecute(Sender: TObject);
    procedure actMovementsOutExecute(Sender: TObject);
    procedure actAPHISEPermitExecute(Sender: TObject);
    procedure actHUKIRegExecute(Sender: TObject);
    procedure pbGrpAnimalWelfareLinkPaint(Sender: TObject);
    procedure pbCrushContainerPaint(Sender: TObject);
    procedure actCrushAddAnimalExecute(Sender: TObject);
    procedure actCrushUpdateAnimalExecute(Sender: TObject);
    procedure actCrushSalesExecute(Sender: TObject);
    procedure btnClearSelectClick(Sender: TObject);
    procedure btnTopCartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pbParlourEventsLinkPaint(Sender: TObject);
    procedure lParlourEventsLinkClick(Sender: TObject);
    procedure cxAnimalGridViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EnableSpaceBar1Click(Sender: TObject);
    procedure btnTopCartDropDownMenuPopup(Sender: TObject;
      var APopupMenu: TPopupMenu; var AHandled: Boolean);
    procedure Tipoftheday1Click(Sender: TObject);
    procedure miCC31ARequest2Click(Sender: TObject);
    procedure miCC31BRequest2Click(Sender: TObject);
    procedure miAIMMovementNotification2Click(Sender: TObject);
    procedure actAIM31ARequestExecute(Sender: TObject);
    procedure actAIM31bRequestExecute(Sender: TObject);
    procedure actAIMMovementNotificationExecute(Sender: TObject);
    procedure actAIMMovementEnquiryExecute(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure pmiExportTescoHerdScoringEventsClick(Sender: TObject);
    procedure DownloadNETFramework1Click(Sender: TObject);
    procedure actHerdStatsExecute(Sender: TObject);
    procedure AISireDairyCoClick(Sender: TObject);
    procedure actCrushAnimalFilterExecute(Sender: TObject);
    procedure cxAnimalGridViewBVDTestDateHeaderClick(Sender: TObject);
    procedure act31GPermitApplicationExecute(Sender: TObject);
    procedure actSyncSettingsExecute(Sender: TObject);
    procedure actSyncDataExecute(Sender: TObject);
    procedure actSyncOptionsExecute(Sender: TObject);
    procedure cxAnimalGridExit(Sender: TObject);
    procedure pmCalfRegOptionsPopup(Sender: TObject);
    procedure actAIMCalfRegistrationEnquiryExecute(Sender: TObject);
	procedure pmiCurrentHerdClick(Sender: TObject);
    procedure CaflRegistrationByEmail1Click(Sender: TObject);
    procedure actImportICBFDataExecute(Sender: TObject);
    procedure actImportDanRyanDataExecute(Sender: TObject);
    procedure actFilterCartExecute(Sender: TObject);
    procedure actTempMovesInExecute(Sender: TObject);
    procedure actTempMovesOutExecute(Sender: TObject);
    procedure miCrushXMLImportClick(Sender: TObject);
    procedure smiUnitsClick(Sender: TObject);
    procedure smiAdminByClick(Sender: TObject);
    procedure smiPrescribedByClick(Sender: TObject);
    procedure smiFeedTypesClick(Sender: TObject);
    procedure smiManufacturersClick(Sender: TObject);
    procedure cxAnimalGridViewCustomization(Sender: TObject);
    procedure ResetSyncData1Click(Sender: TObject);
    procedure ResetActiveBullListClick(Sender: TObject);
    procedure actImportVetDrugRegisterExecute(Sender: TObject);
    procedure actAIMMovementsExecute(Sender: TObject);
    procedure lAIMICBFMoreClick(Sender: TObject);
    procedure actBordBiaExecute(Sender: TObject);
    procedure smiMedicinePurchaseClick(Sender: TObject);
    procedure smsiMedicineAddClick(Sender: TObject);
    procedure smsiMedicineEditClick(Sender: TObject);
    procedure cxAnimalGridViewColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure actReviewMedicineExecute(Sender: TObject);
    procedure ReloadSyncEvents1Click(Sender: TObject);
    procedure pmiUpdateHealthUnitsClick(Sender: TObject);
    procedure actSyncAnimalExecute(Sender: TObject);
    procedure pmiMediPurchClick(Sender: TObject);
    procedure ViewSyncWarnings1Click(Sender: TObject);
    procedure RemoveAnimalNoDuplicates1Click(Sender: TObject);
    procedure RestoreCartCreatedOnApp1Click(Sender: TObject);
    procedure actQueryAimAnimalDetailsExecute(Sender: TObject);
    procedure actQueryAimAnimalDetailByBatchExecute(Sender: TObject);
    procedure pmiOrderTagsClick(Sender: TObject);
    procedure pmAIMMovementEnqPopup(Sender: TObject);
    procedure actICBFEmailAttachExecute(Sender: TObject);
    procedure actIMartFilesAttachExecute(Sender: TObject);
    procedure actFactorySalesAttachExecute(Sender: TObject);
    procedure actVetLinkAttachExecute(Sender: TObject);
    procedure actCows365AttachExecute(Sender: TObject);
    procedure actAIMMovementMenuExecute(Sender: TObject);
    procedure actTreatmentStatsExecute(Sender: TObject);
    procedure pmiAddMedicineClick(Sender: TObject);
    procedure actMedicineNullTypesExecute(Sender: TObject);
    procedure imgFarmSafetyLogoClick(Sender: TObject);
    procedure RemoveDuplicateAIBulls1Click(Sender: TObject);
    procedure pmiAddMedSupplierClick(Sender: TObject);
    procedure pmiAddMedAdminByClick(Sender: TObject);
    procedure pmiMedPrescribedByClick(Sender: TObject);
    procedure actBordBiaClientConfigExecute(Sender: TObject);
    procedure actBordBiaClientSettingsExecute(Sender: TObject);
    procedure actCrushVetTreatExecute(Sender: TObject);
    procedure actRedTractorExecute(Sender: TObject);
    procedure lRefreshAttachmentsClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure actDiseaseSummaryExecute(Sender: TObject);
    procedure btnVetStatsClick(Sender: TObject);
    procedure actReverseFilterExecute(Sender: TObject);
    procedure cxAnimalGridViewPDStatusHeaderClick(Sender: TObject);
    procedure actImportParlourDataExecute(Sender: TObject);
    procedure ShowParlourEventsTimerTimer(Sender: TObject);
    procedure pmiChangeCustomerSupplierNamesClick(Sender: TObject);
    procedure pmiDanRyanImportClick(Sender: TObject);
    procedure pmiTagReconcileClick(Sender: TObject);
    procedure AISireFromBeefRegisterClick(Sender: TObject);
    procedure actExportGridToCSVExecute(Sender: TObject);
    procedure actMoveEventLactNoUtilityExecute(Sender: TObject);
    procedure actClearSoldAnimalTranspondersExecute(Sender: TObject);
    procedure pmiAIMImportPurchasesClick(Sender: TObject);
    procedure pmiAIMImportSalesDeathsClick(Sender: TObject);
    procedure miFixAnimalLactationNumbersClick(Sender: TObject);
    procedure actStockBullInExecute(Sender: TObject);
    procedure actStockBullOutExecute(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure miHerdSyncClick(Sender: TObject);
    procedure actUpdateHerdDesignatorExecute(Sender: TObject);
    procedure ShowDeletedAnimals1Click(Sender: TObject);
    procedure actUndeleteAnimalExecute(Sender: TObject);
    procedure actDeleteAnimalExecute(Sender: TObject);
    procedure actSyncNowExecute(Sender: TObject);
    procedure pVetFeedsContainterEnter(Sender: TObject);
    procedure BordBiaEventHintTimerTimer(Sender: TObject);
    procedure pbBordBiaLinkPaint(Sender: TObject);
    procedure actFeedDiaryExecute(Sender: TObject);
    procedure actCreateBatchGroupFilterExecute(Sender: TObject);
    procedure actCreateFeedGroupFilterExecute(Sender: TObject);
    procedure actCreateBatchGroupCartExecute(Sender: TObject);
    procedure actCreateFeedGroupCartExecute(Sender: TObject);
    procedure actGroupSetupFromFilterExecute(Sender: TObject);
    procedure actGroupSetupFromCartExecute(Sender: TObject);
    procedure actGoToCC31ACartExecute(Sender: TObject);
    procedure actGoToCC31BCartExecute(Sender: TObject);
    procedure actGoToCC31AFilterExecute(Sender: TObject);
    procedure actGoToCC31BFilterExecute(Sender: TObject);
    procedure cxAnimalGridViewTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure actRefreshAnimalsExecute(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure actStopSyncingOnThisMachineExecute(Sender: TObject);
    procedure UpdateServiceComments1Click(Sender: TObject);
    procedure actUpdateAnimalDetailsTransponderExecute(Sender: TObject);
    procedure actUpdateAnimalDetailsAnimalNoExecute(Sender: TObject);
    procedure actGroupVetTreatExecute(Sender: TObject);
    procedure actGroupWeighingExecute(Sender: TObject);
    procedure actShowDeathEventExecute(Sender: TObject);
    procedure NewFeatures1Click(Sender: TObject);
    procedure ClearDiseaseTestDates1Click(Sender: TObject);
    procedure DeleteGroupsNotUsedClick(Sender: TObject);
    procedure actImportTransponderFileToCartExecute(Sender: TObject);
    procedure TeamViewerClick(Sender: TObject);
    procedure mnuTeamViewerClick(Sender: TObject);
    procedure pmAnimalCartPopupPopup(Sender: TObject);
    procedure cxAnimalGridViewJohnesResultGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure pmiEditGroupClick(Sender: TObject);
    procedure actAutoArchiveExecute(Sender: TObject);
    procedure psmManualAIClick(Sender: TObject);
    procedure pmNonHerdStockBullClick(Sender: TObject);
    procedure pmiNonHerdDamClick(Sender: TObject);
    procedure pmiAHDBFileClick(Sender: TObject);
    procedure pmExportOptionsPopup(Sender: TObject);
    procedure miTestFacilityClick(Sender: TObject);
    procedure actAddA1A2ResultExecute(Sender: TObject);
    procedure pmiA1A2ResultFileClick(Sender: TObject);
    procedure actModifyGridExecute(Sender: TObject);
    procedure actCalvingHelpExecute(Sender: TObject);
    procedure pmiNatIdSortClick(Sender: TObject);
    procedure pmiNatIdCheckDigitClick(Sender: TObject);
    procedure pmiNatIdLast4DigitsClick(Sender: TObject);
    procedure pmiListStockBullsClick(Sender: TObject);
    procedure pmiPurchaseStockBullClick(Sender: TObject);
    procedure cxAnimalGridViewPrintTotalAmountCount(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxAnimalGridViewPrintAvgPricePerKg(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxAnimalGridViewPrintSummaryText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxAnimalGridViewPrintAvgSalePrice(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxAnimalGridViewPrintColdDeadWt(Sender: TcxDataSummaryItem;
      const AValue: Variant; AIsFooter: Boolean; var AText: String);
    procedure cxAnimalGridViewPrintAvgPurchWeight(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxAnimalGridViewPrintAvgPurchPrice(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxAnimalGridViewPrintAvgDaysOnFarm(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure cxAnimalGridViewPrintAvgGrossMargin(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
  private
    { Private declarations }
    Reg : TRegistry;
    FormActivateTriggered,
    iSortAsc   : Boolean;
    sCurrIndex : String;
    CurrAnimal : Integer;
    SuckMenuItem : TMenuItem;

    LastHerdID : SmallInt;
    AllAnimalsShowing : Boolean; // Set this boolean to stop setupForm event being fired after change to cbDefaultHerd.value
    PL : TPhoneLink;
    GridSettingsIniPath : String;

    AnimalCartFiltered : Boolean;
    GettingStartedScrActive : Boolean;

    FSearchColumn : TcxGridDBColumn;
    FSQLFilter : TSQLFilter;

    pmHeatBullingEvent: TPopupMenu;
    pmServiceEvent: TPopupMenu;
    pmScanPDEvent: TPopupMenu;
    pmDryOffEvent: TPopupMenu;
    pmVetTreatmentsEvent: TPopupMenu;
    pmWeighingEvent : TPopupMenu;
    pmDisbuddingEvent : TPopupMenu;
    pmCastrationEvent : TPopupMenu;
    pmStartMealFeedEvent : TPopupMenu;
    pmWeaningEvent : TPopupMenu;
    pmPurchaseEvent : TPopupMenu;
    pmFactorySales : TPopupMenu;
    pmMartFiles : TPopupMenu;
    pmMilkRecording : TPopupMenu;

    miHeatBullingSingleEvent: TMenuItem;
    miHeatBullingMultiEvent: TMenuItem;

    miServiceSingleEvent: TMenuItem;
    miServiceMultiEvent: TMenuItem;

    miScanPDSingleEvent: TMenuItem;
    miScanPDMultiEvent: TMenuItem;

    miDryOffSingleEvent: TMenuItem;
    miDryOffMultiEvent: TMenuItem;

    miVetTreatmentsSingleEvent: TMenuItem;
    miVetTreatmentsMultiEvent: TMenuItem;

    miPurchaseMultiEvent : TMenuItem;

    miWeighingSingleEvent: TMenuItem;
    miWeighingMultiEvent: TMenuItem;
    miWeighingLW: TMenuItem;
    miWeighingIHM: TMenuItem;
    //miWeighingMICrushDisk: TMenuItem;
    miWeighingLinkToScale: TMenuItem;

    miFactorySales : TMenuItem;
    miMartFiles : TMenuItem;

    miMilkRecording : TMenuItem;

    FHeiferTypes : THeiferTypes;

    FSelectedHerdType : THerdType;
    FCountry : TCountry;

    EnableCartSpaceBar : Boolean;

    pmReconcileHerd : TPopupMenu;
    miReconcileHerd : TMenuItem;

    FAddToCartType : TAddToCartType;

    FAnimalFilterArray : TIntegerArray;

    FFilterWarning : Boolean;
    FFormShowing : Boolean;

    FAnimalSearching : Boolean;

    FAimMovementActions : TAimMovementActions;
    FAimMovementSummaries : TList;

    FSLHerdConfigFile : TStringList;

    FAnimalRemedyData : TAnimalRemedyData;

    FShutdownInProgress : Boolean;

    FParlourInfo : TParlourDetails;

    FFormResizing : Boolean;

    HerdReconcileActivated : Boolean;

    AIMMovementsActivated : Boolean;

    FHintStyleController : TcxHintStyleController;

    FSortedColumn : TcxGridColumn;

    procedure SetUpForm;
    procedure HideModules;
    procedure CheckMods;
    procedure SetCurrIndex(Value: String);
    procedure SetSortAsc(Value: Boolean);
    procedure SetThePanelWidths;
    function  CheckAnimalOKforBreeding: Boolean;

    function ShowParlourLink : Boolean;
    function ShowRationCalcLink : Boolean;
    function ShowAccsDef : Boolean;
    procedure ShowCrushFile(Sender : TObject);

    procedure SetDataSources;
    procedure LWClick(Sender : TObject);
    procedure InterHerdClick(Sender : TObject);
    procedure RefreshForm;
    function GetDefCountry: TCountry;
    procedure EnableBtn(Sender : TObject); //; Enable : Boolean);
    procedure LoadAllAnimals(bSaleDeaths : Boolean);
    procedure ApplySortToAnimalFileByIdAndOpenQuery;
    procedure AppMinimize(Sender: TObject);
    procedure AppRestore (Sender: TObject);
    procedure PLActivate(var msg: TMessage); message WM_plActivate;
    procedure PLDeActivate(var msg: TMessage); message WM_plDeActivate;
    procedure BladeRegistered(var msg: TMessage); message WM_BladeRegistered;
    procedure BladeNotRegistered(var msg: TMessage); message WM_BladeNotRegistered;
    procedure ShowReportsScreen(var msg: TMessage); message WM_ShowReportsScreen;
    procedure ShowSucklerCowEvents(var msg: TMessage); message WM_ShowSucklerCowEvents;

    procedure WMQueryEndSession( var Message: TWMQueryEndSession); message WM_QUERYENDSESSION;
    procedure RefreshGridViewExternalData(var msg: TMessage); message WM_RefreshGridViewExternalData;
    procedure RunProActiveActionLists;
    procedure RunActionWarningsReminders;
    procedure CheckSelectedHerd;
    procedure ResetColumnHeader(const ASelectedColumnIndex : Integer);
    procedure UpdateStatusBar;
    procedure ViewAnimal;
    procedure DoLocate(var Message:TMessage); message WM_Locate;

    procedure SetNatIDSearchText;

    procedure MovementsInClick(Sender : TObject);
    procedure CMMSPermitsClick(Sender : TObject);
    procedure CTSMovementsClick(Sender : TObject);
    procedure ShowGettingStarted(AUserView : Boolean = False);
    procedure ResetAnimalGridColumns;
    procedure StoreAnimalGridView;
    procedure RestoreAnimalGridView;
    procedure LoadAccountsCompanies();

    procedure SetGridStyles;

    procedure AddAllAnimalsToCart;
    procedure SetCartButtonStyle(const AStyleNormal : Boolean);

    procedure ShowFactorySales;
    procedure ShowMartImport;

    procedure BuildSearchColumnList;
    procedure SearchForAnimal;
    procedure SetSearchPanelVisible(const AVisible : Boolean);
    procedure ShowGroupEventClick(Sender : TObject);
    procedure ShowAWGroupEventClick(Sender : TObject);
    procedure ShowAWEventReview(Sender : TObject);
    procedure ShowGroupEvent(AEventType : Integer);
    procedure ShowAWGroupEvent(AEventType : Integer);
    procedure pmWeighingEventOnPopup(Sender: TObject);
    procedure UpdateBarcodeScannerControls;
    procedure CreateMilkRecorderCaption;
    procedure DoFilter(const AFilter: TQuickFilter; const ACaption : string);
    //procedure ReplacementCowsFilter;
    procedure HideAllNewEventPanelItems;
    procedure SetupMenuButtonContainer(AContainer : TPanel);
    procedure QuickSort(var AButtonArray : array of TcxButton; ALo, AHi: Integer);
    procedure SetupLinkButtons;

    procedure miFactorySalesClick(Sender : TObject);
    procedure miMartFilesClick(Sender : TObject);
//    procedure ShowAIBulls;

    procedure miMilkRecordingClick(Sender : TObject);

    procedure DefaultHandler(var Message); override;
    procedure BroadcastToAllForms( aMessage: Cardinal;
        aWParam, aLParam: Longint; ExcludeForm: TForm );
    procedure BringAIMClientToFront;

    procedure miReconcileHerdClick(Sender : TObject);
    procedure RefreshAllExternalData();
    function GetSyncButtonVisibility : Boolean;
    //   19/06/12 [V5.0 R7.3] /MK Additional Feature - New Procedure For Link To Weighing Scale.
    procedure ShowLinkToWeighingScale(Sender : TObject);

    function GetAnimalIdsBySqlFilter(AWhatSQL: Integer; ABaseFilter : TIntegerArray = nil): TIntegerArray;
    function GetAFiltersAsIntArray : TIntegerArray;
    procedure GroupPlannedBullClick(Sender: TObject);
    procedure GroupVaccinationClick(Sender: TObject);

    function ShowDraftGroupsMenu : Boolean;
    procedure CreateDraftGroupsMenu;
    procedure ClearDraftGroupOnClick(Sender: TObject);
    procedure ClearAndAddToDraftGroup(Sender: TObject);
    procedure AddToExistingDraftGroup(Sender: TObject);
    procedure AddToDraftGroup ( ADraftGroupID : Integer );
    procedure ClearDraftGroup ( ADraftGroupID : Integer );
    procedure DraftThisGroup(Sender: TObject);

    procedure ProcessAimMovements();
    procedure DisplayAimMovementSummary();
    procedure ProcessAIMHerdReconcile();

    procedure CheckAIMInstalled();
    function GetFQASDateCount: Integer;
    procedure ClearAnimalSelection();
    procedure SyncData(ADirection : TSyncDirection = soSyncDataBothWays);
    procedure CheckAttachments;
    procedure ShowParlourEvents;
    procedure DownloadInstallerIfMissing();
    procedure SetupServicesBtn;
    procedure ShowUpdateHerdDesignatorUtility;
    procedure ShowIndicatorToControl(APoint : TPoint; const AHintTitle, AHintText: string; APos : TcxCallOutPosition);
    procedure HideHintStyleController;
    procedure CreateAnimalCartHintStyleController;
    procedure CreateBordBiaHintStyleController;
    procedure ShowBordBiaEventAreaButton;
    procedure CreateGroupFromSelection(AGroupType: TGroupType; ASelectionType : TSelectionType);

    procedure ShowHideAnimalCategoryItems;
    procedure SoldAnimalFilter(const AShowCulled : Boolean = False);
    procedure DeadAnimalFilter;
    procedure ShowAIMOrStandardIrishRecScr;

    procedure ShowLinksMenu;

    procedure FocusAnimalOnMainGrid(const AAnimalID : Integer);

    procedure ProcessAIMCompCertNewCustomer;

    procedure RefreshAnimalGrid;
    procedure StockBullsInUseFilter;
   public
    { Public declarations }
    pbBar : TProgressbar;
    CheckCalfReg : Boolean;
    ReloadSetupQuery : Boolean;

    FQuickFilter : TQuickFilter;

    procedure Download;
    property CurrIndex : String read sCurrIndex write SetCurrIndex;
    property SortAsc : Boolean read iSortAsc write SetSortAsc;
    procedure SetUpQuery(const ReloadSQLFilter : Boolean = False);
    procedure SetUpCartQuery;
    procedure NameSearch(const AStartIndex : Integer = 0);
    procedure AddSearchNatIDData;
    procedure AddAnimal;
    procedure BuildOnFarmEventsMenu(AOwner : TMenu; AOwnerItem : TMenuItem);
    procedure AllAnimalFilter;
    procedure LeftHerdFilter;
    procedure BullsInUseFilter;
    procedure DeletedAnimalsFilter;
    //   13/03/12 [V5.0 R4.3] /MK Additional Feature - Renamed This Milking Cows Filter To Just CowsFilter.
    procedure BeefCattleFilter;
    procedure GetHeifers( const AYear : Word; AHeiferTypes : THeiferTypes );
    procedure MaleCalveFilter (const AYear : Word);
    procedure AllCalvesFilter (const AYear : Word);
    //   13/03/12 [V5.0 R4.3] /MK Additional Feature - New Procedures For Milking And Dry Cows Filter.
    //procedure MilkingCowsFilter;
    //procedure DryCowsFilter;

   //------------------- New Event Section Call Procedures -------------------//
    // Breeding
    procedure ShowCalvingEvent;
    procedure ShowHeatBullingEvent;
    procedure ShowServiceEvent;
    procedure ShowPDEvent;
    procedure ShowDryOffEvent;
    // Movements
    procedure ShowPurchaseEvent;
    procedure ShowSalesDeathEvent(const AIsSaleEvent : Boolean);
    procedure ShowMovementPermits;
    // Veterinary/Feeds
    procedure ShowVetPurchEvent;
    procedure ShowVetTreatEvent(ACrushTreat : Boolean);
    procedure ShowFeedPurchEvent;
    procedure ShowFeedAlloc;
    // Register/CalfReg
    procedure ShowReconcileHerd;
    procedure ShowOrderTags;
    procedure ShowRegisterRemarkEvent;
    procedure ShowCalfReg;
    procedure ShowICBFEventReg;
    // Groups
    procedure ShowGroupSetup;
    procedure ShowGroupMovements;
    procedure ShowPurchGroup;
    procedure ShowSalesGroup;
    // Management
    procedure ShowWeighingEvent;
    procedure ShowMilkRecording;
    procedure ShowParlourLinkScreen(const ADraftGroupName : String = '');
    procedure ShowRationCalc;
    procedure ShowBulkTank;
    // Block Events
    procedure ShowOnFarmEvents;
    procedure ShowMovementsIn;
    procedure ShowMovementsOut;
    procedure ShowBlockAnimalWelfare;
    procedure ShowCTSMovements;
    procedure ShowTempMovementsIn;
    procedure ShowTempMovementsOut;
   //--------------------------------------//

    procedure ContainerCheckDefFile;
    procedure ShowSingleAnimalEventMenu(const AMenuType : TMenuType);

    procedure ImportA1A2Results;

    function IsFilterFormActive : Boolean;

    procedure StartDownload;
    procedure OnFileDownloaded(Sender: TObject);

    procedure AddStockBullEvent(AInEvent: Boolean);

    property FFQASDateCount : Integer read GetFQASDateCount;

  end;

  procedure DrawRounded(Control: TWinControl) ;


var
   Menuform : TMenuForm;
   ActionReminderList : TKActionList;
   SystemType : TSystemType;
   WM_KINGSWOOD_FARMSYNC_COMPLETED : DWORD;
//   WM_KINGSWOOD_FARMSYNC_SETTINGSCHANGED : DWORD;
//   WM_KINGSWOOD_FARMSYNC_OPTIONSCHANGED : DWORD;

const
   cDefaultMenuButtonWidth = 94;
   cContainerTop = 39;
   cContainerLeft = 166;
   cContainerRight = 660;
   cBreedingContainerDescription = '  Breeding Events (Cows Only)';
   cMovementContainerDescription = '  Movement Events (including Mart/Factory Files)';
   cVetFeedsContainerDescription = '  Veterinary & Feed Purchases/Treatments/Allocations';
   cVetFeedsContainerNoAllocDescription = '  Veterinary & Feed Purchases/Treatments';
   cVetContainerDescription = '  Veterinary Purchases & Treatments';
   cAIMLinkEvRegContainerDescription_IRL = '  AIM Link/Animal Event Registration';
   cAIMLinkContainerDescription_IRL = '  AIM Link';
   cBovRegEvRegContainerDescription_Other = '  Bovine Register Maintanence/Event Registration';
   cBovRegContainerDescription_Other = '  Bovine Register Maintanence';
   cGroupsContainerDescriptionStd = '  Allocate Animals to Groups';
   cGroupsContainerDescriptionAdv = '  Allocate Animals to Groups (Purchase/Sale/Batch/Feed Groups)';
   cGroupsContainerDescriptionAdvNoPurch = '  Allocate Animals to Groups (Sale/Batch/Feed Groups)';
   cManagementContainerDescription = '  Animal Weights/Milk Recording/Bulk Tank';
   cManagementContainerWeighingOnlyDescription = '  Animal Weights';
   cAnimalWelfareContainerDescription = '  Suckler Cow Welfare Scheme Events';
   cBlockMovementsContainerDescription = '  Block Movement Events';
   cCrushContainerDescription = '  Crush Events';
   //   23/04/12 [V5.0 R5.2] /MK Change - New Description For Single Movements.
   cMovementContainerDescriptionEng = '  Movement Events';
   cKingswoodLinksContainerDescription = ' Kingswood Links';

   cEventSectDefaultHeight = 211;
   cEventSectNoVetLinkHeight = 205;
   cEventSectDealerHeight = 175;

implementation
uses
    Def, uSalesDeaths, DairyData, SetUpAnimals, Bullings, Services, PregDiag,
    Weighing, uHealth,uCalvings, uMediPurch, uMilkRec,
    uFilters, uSystem, uPurchases, uIndexes, uReTag, uGeneralRemark,
    uInterHerd, uTempMovements, HealthFilterU, ActionReminderFilt,
    ShellAPI, uCControl,
    // Added 11/06/1999 - FK
    BullReportsFilt, CowRepFilt, uCowEnrolFilt, BreedingAnalysisFilt, uHFSCalfReg,
    BrowseRegisterU, uHerdBrochureFlt, StockInHerdFilt, uDailyYieldGraph,
    uCalfRegFlt, uSalesReport, uTBTestDtRep, uSalesCatalogueFlt,
    uHeatServiceFilt, uUnitsSetUp, uMedicineSetUp, uCustomers, uSuppliers, uBuyers,
    uHerdSetUp, uDefaults, SetUpBreeds, uSetUpUsers, uSetUpMilkDisk, {uSlghtPremScr,}
    uMovPerRep,uWeighingFilt, uGroupSetUp, uLivestocksum,
    uEventsByGroup, uActiv, uMilkDiskReview, uBBPPurchScr,uPurchGrpRep,
    uFertIndicesRpt, QRExtra, HerdPassword,
    // ICBF event registration unit
    uICBFEventExport,
    // Factory Dockets
    uRemittance,
    // feed costs  19/5/00 - kr
    uManufacturers, uFeedPurch, uFeedAlloc, uFeedTypes,
    // Cattle movement notification report
//    uMoveNotify,
    // New Milk Recording Report SP 13/06/01
    uMilkRecSysScr,
    // Retag Screen SP 15/06/01
    uRetagScr, uRestrictAnimals, uGridPrint,
    // New Suckler 2002 unit
//    uSuckApplic,
    // New SucklFer 2002 Replacement Facility.
  //  uSuckSubstitute,
    // Import/Export Animal Facility
    uKImport, uAccDefComp, uMPEvents, MooreParkExport,
    { New Web Download Facility }
    uDownload,  FertAnalysisRpt, SaleEligibility, uAccsReps, { AnimalWaste, }
    uLiveStockValues, uCreateEvents,
    uQuotaMan, uPreSale, uHerdRec,
    uGlobalSettings, uFeedAllocEdit,
    uCrushDiskWeigh, uPedUpgradeReport, uHerdSelect, uMilkTankRead, KDBRoutines,
    uCMMSPermits, uBlade, { uPhoneLinkDownload, } uRationPerformMonitor,uUpdateAnimalNo,
    uAPHISRegistration, uDairyHerdHealthCert, SCCAnalysis, uPDAReportDefaults,
    uPDAExportSynch, cxUtils, uGroupUpdate, uGroupReport, cxFilter, FileCtrl, LiveStkClass,
    uEventFilter, cxDBLookupComboBox, uImageStore,
    uReproductiveSummaryInterface, uUpdateTables, uFertilityBenchmarking,
    uCAFREFertListData, cxLookAndFeelPainters, cxGridCommon, uDueToBeCulled,
    uHUKIFarmEvents, uNutrientProductionProjectionRptScr, AnimalWaste,
    uMartImport, uGettingStarted, uNINutrientProductionProjectionRptScr,
    uCMMSFileImport,uMartImportTypes, PDAConst, uCalvingHistoryEntry,
    uICBFPCDownloadImporter, uSetupWasteProdRates,
    uAWEventsByGroup, uFertilityTreatmentsReport,
    uSetupFertPrograms, uFertTreatmentsReview,
    uTagReplacementForm, uVersionHistory, uAnimalCart, uCTSLoginInfo,
    uCTSBirthReg, uCTSMovementReg, uCTSCattleOnHolding, uGridColourSelection,
    uHerdStatistics, uMovementsInHealthDefaultsGrid, uStockValuations,
    uEmailClient, uMailBoxHelper, uAnimalCartView, uSelectDamID, uDataBackup,
    EventRecording, uFileAttachmentImport, uNationalID,
    uBeefSalesCatalogue, uUKSireRegister, uReports, udatafix, uPreferences,
    uBeefProfitMonitor, uBeefAISireRegister, uAWReviewEvents,
    uAnimalEventTransfer, LMDWebDownloadFormUnit,
    UserMsgConst, uKingswoodController, uDataDownload,
    uFertilityCheckReport, uFertilityCheckEdit, uEventForm,
    uFertilityAnalysis, uLactationConsistencyChecker, uCTSRegInfo,
    uCrushBarcode, uAnimalBrowser, uCrushSalesGroup, uAIMClient,
    uTescoExport, uCrushAnimalFilter,
    uAimAnimalRegistration, ChkDebug, uApplicationLog,
    uElecWeigh, uStartupReminders, uAIMAnimalMovements,
    uAimAnimalMovementSummary, animalRemedyMedicineFixer, uDuplicateAnimals,
    uSyncWarning, uAnimal, uAIMAnimalMovementEdit, uDrugFinder;

{$R *.DFM}

var
   OldWindowProc : Pointer; {Variable for the old windows proc}
   MyMsg : LongInt; {custom systemwide message}

function NewWindowProc(WindowHandle: hWnd; TheMessage: LongInt; ParamW: LongInt; ParamL: LongInt): LongInt stdcall;
begin
   if TheMessage = MyMsg  then
      begin
         // Tell the application to restore, let it restore the form
         SendMessage(Application.handle, WM_SYSCOMMAND, SC_RESTORE, 0);
         SetForegroundWindow(Application.Handle);
         // We handled the message - we are done
         Result := 0;
         exit;
      end;
   // Call the original winproc
   Result := CallWindowProc(OldWindowProc, WindowHandle, TheMessage, ParamW, ParamL);
end;

procedure TMenuForm.SetCurrIndex(Value: String);
var
   i : Integer;
   CurrField : String;
begin
   if (Value <> sCurrIndex) then
      sCurrIndex := Value
   else
      begin
         // Set the Sort Order Property
         if SortAsc then
            SortAsc := FALSE
         else
            SortAsc := TRUE;
      end;
end;

procedure TMenuForm.SetSortAsc(Value: Boolean);
begin
   if (Value <> iSortAsc) then
      iSortAsc := Value;
end;

procedure TMenuForm.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TMenuForm.BullingButtonClick(Sender: TObject);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      if CheckAnimalOKforBreeding then
         Bullings.ShowBulling(AddBulling); // Display the Bulling  Form
end;

procedure TMenuForm.WeightButtonClick(Sender: TObject);
begin
   {
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
   *****************************************************************************
   Removed by SP 12/12/2003 requested by GL (for Richard Bourns) to facilitate weighin recording
   during Bed & Breakfast movements
   *****************************************************************************
   }

   Weighing.ShowWeight(AddWeight);
end;

procedure TMenuForm.bReportsClick(Sender: TObject);
begin
   // 03/02/2009 [Dev V3.8 R 5.9 ] /SP : Program Change - New preference "Use New Report Layout Style",
   // allows user to toggle between old Report Screen and New Report Screen.

   if UPPERCASE(Preferences.ValueAsString[cGSReportLayoutStyle]) = 'OLDLAYOUT' then
      begin
         MessageDlg('Reports Screen Not Enabled' +#13#10+
                     'To enable, click System at the top of the screen and then click Prefereneces.' +#13#10+
                     'Now click Use New Report Layout and click OK',mtWarning,[mbOK],0);
         sbReports.Down := False;
      end
   else
      begin
         WinData.FReportAnimalsInCart := False; 
         TfmReports.ShowReports(WinData.UserDefaultHerdID); // 08/01/09 [V3.9 R5.7] /SP Introduction of New Reports Screen Layout
         sbReports.Down := False;

         if ( GettingStartedScrActive ) then
            begin
               GettingStartedScrActive := False;
               ShowGettingStarted;
            end;

         if ( WinData.FReportAnimalsInCart ) then
            begin
               btnTopCart.Font.Size := 8;
               btnTopCart.Font.Style := [fsBold,fsItalic];
               btnTopCart.Font.Color := clBlue;
               actFilterCart.Execute;
               RefreshAllExternalData;
            end;

         //   12/01/18 [V5.7 R7.4] /MK Additional Feature - Refresh Animal Grid if >2 Weighings Report was ran to show OverAllGainPerDay value.
         if ( WinData.RefreshOverGainPerDay ) then
            begin
               WinData.AnimalFileByID.Close;
               WinData.AnimalFileByID.Open;
               WinData.RefreshOverGainPerDay := False;
            end;
      end;

   Update;
end;

procedure TMenuForm.ServiceClick(Sender: TObject);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      // Check the Animal Sex
      if CheckAnimalOKforBreeding then
         // Display the Services Form
         Services.ShowService(AddService);
end;

procedure TMenuForm.PDsButtonClick(Sender: TObject);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      // Check the Animal Sex
      if CheckAnimalOKforBreeding then
        begin

           if WinData.GlobalSettings.MandatoryBreedingEvents then
              begin
                 If NOT Windata.Events.Locate('AnimalID;AnimalLactNo;EventType',
                                              VarArrayOf([WinData.AnimalFileByIDID.Value,
                                              WinData.AnimalFileByIDLactNo.Value,
                                              CServiceEvent]),[]) then
                    begin
                       Messagedlg ('This Cow has no Service Record',mtError,[mbok],0);
                       Abort;
                    end;
                 If NOT Windata.Events.Locate('AnimalID;AnimalLactNo;EventType',
                                              VarArrayOf([WinData.AnimalFileByIDID.Value,
                                              WinData.AnimalFileByIDLactNo.Value,
                                              CPregDiagEvent]),[]) then
                    PregDiag.ShowPD(AddPD)
                 else
                    Messagedlg ('This Cow has a PD Record',mtInformation,[mbok],0);
              end
           // Test the Animal hasn't already got a PD Record for this Lactation
           else if NOT Windata.Events.Locate('AnimalID;AnimalLactNo;EventType',
                                        VarArrayOf([WinData.AnimalFileByIDID.Value,
                                        WinData.AnimalFileByIDLactNo.Value,
                                        CPregDiagEvent]),[]) then
              PregDiag.ShowPD(AddPD)
           else
              Messagedlg ('This Cow has a PD Record',mtinformation,[mbok],0);
        end; // Joanne Tighe 29/3/2004

   // refresh grid for possible event ( To be Culled ) created by the PregDiag event properties.
end;

procedure TMenuForm.DryOffButtonClick(Sender: TObject);
var
   OKcontinue : Boolean;
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      // Check the Animal Sex
      if CheckAnimalOKforBreeding then
         begin
            OKContinue := TRUE;
            // 0 Lactation animals should have a Calving date to be dried Off
            if ( WinData.AnimalFileByIDLactNo.AsInteger = 0 ) then
               OkContinue := ( MessageDLG('Animal has no Calving Date (Lactation 0)' + #13 +
                                          'Do you want to continue',mtWarning,[mbYes,mbNo],0) = mrYes );
            if OKContinue then
               begin
                  if WinData.GlobalSettings.MandatoryBreedingEvents then
                     begin
                        if not ( WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CServiceEvent) ) then
                           begin
                              Messagedlg ('This Cow has no Service Record',mtinformation,[mbok],0);
                              Abort;
                           end;
                        if not ( WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CPregDiagEvent) ) then
                           begin
                              Messagedlg ('This Cow has no PD Record',mtinformation,[mbok],0);
                              Abort;
                           end;
                     end;

                   if FSelectedHerdType <> htBeef then
                      begin
                         if not ( WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CDryOffEvent) ) then
                            uHealth.ShowHealth(AddDryingOff)
                         else
                            Messagedlg ('This Cow has a Drying Off Record',mtinformation,[mbok],0);
                     end;
               end;
         end;
end;

procedure TMenuForm.HealthClick(Sender: TObject);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      uHealth.ShowHealth(AddHealth);
end;

procedure TMenuForm.CalvingButtonClick(Sender: TObject);

    procedure ShowCalvingScr;
    begin
       if (FCountry = Ireland) then
          begin
             Windata.HerdIdentifierByHerdID(WinData.AnimalFileByIDHerdID.AsInteger);
          end
       else if ( WinData.GlobalSettings.NatIDToAnimalNo ) and ( FCountry = NIreland ) then
          begin
             // if NI herd, check for existance of Herd Identifier. If found
             // we can use this number to determine what value (from the natidnum)
             // should be inserted into the animalno field.
             if WinData.OwnerFile.Locate('ID', WinData.AnimalFileByIDHerdID.AsInteger,[ ]) then
                begin
                   if WinData.OwnerFileHerdIdentifier.AsString = '' then
                      begin
                         if MessageDlg('Your Herd Designator number cannot be found. '+#13#10+
                                       'This number is used to create the calf number.'+#13#10+#13#10+
                                       'Do you want to enter your Herd Designator number now?',mtConfirmation,[mbYes,mbNo],0) = idYes then
                            begin
                               uHerdSetup.ShowTheForm(False, 'HerdIdentifier');
                            end;
                      end;
                end;
          end;

       CheckCalfReg := False;
       uCalvings.ShowCalvings(Add);

       if ( WinData.CalvingSurvey <> nil ) and (WinData.CalvingSurvey.RegisterCalves) then
          begin
             //   24/06/14 [V5.3 R2.8] /MK Additional Feature - New unit uCalvesNoSires checks for calves without sires before registration.
             //   04/03/15 [V5.4 R1.7] /MK Additional Feature - Check if there are calves that sires with different breed code to calves.
             //   02/04/15 [V5.4 R2.4] /MK Bug Fix - Only check for SireBreedDifferToCalfBreed for Irish herds as APHIS/CTS send calf breed.
             if ( FCountry = Ireland ) then
               begin
                  if ( TfmCalvesNoSires.GetCalvesWithNoSires = 0 ) then
                     if ( TfmSireBreedDifferToCalfBreed.GetCalves = 0 ) then
                         ShowCalfReg;
               end
             else if ( FCountry <> Ireland ) then
                ShowCalfReg;
             //sbRegistration.Click;
          end
       else if WinData.ShowCalfRegReminder then
          begin
             WinData.ShowCalfRegReminder := False;
             if MessageDlg('Do you want to complete Calf Registration for this calf?', mtConfirmation, [mbYes,mbNo],0) = idYes then
                begin
                   //   02/04/15 [V5.4 R2.4] /MK Bug Fix - Only check for SireBreedDifferToCalfBreed for Irish herds as APHIS/CTS send calf breed.
                   if ( FCountry = Ireland ) then
                     begin
                        if ( TfmCalvesNoSires.GetCalvesWithNoSires = 0 ) then
                           if ( TfmSireBreedDifferToCalfBreed.GetCalves = 0 ) then
                               ShowCalfReg;
                     end
                   else if ( FCountry <> Ireland ) then
                      ShowCalfReg;
                end;
          end;
    end;

begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
         begin
            // Check the Animal Sex
            if CheckAnimalOKforBreeding then
               begin
                  // check old enough to breed

                  if WinData.HerdSpecies = cSpecies_Goats then
                     begin
                        { Check GOAT under 9 months }
                        { V3.8 R0.5 }
                        if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -9)) then
                            raise errormsg.CreateFmt(cCalvingAnimalUnder9Mths,[WinData.AnimalFileByIDNatIDNum.AsString, 9, FormatDate(Date,dsIrish)])
                        else if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -18)) then
                           begin
                              if MessageDlg(Format(cCalvingAnimalUnder18Mths,[WinData.AnimalFileByIDNatIDNum.AsString,18,FormatDate(Date,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
                                 Abort;
                           end;
                     end
                  else
                     begin
                        if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -12)) then
                           raise errormsg.CreateFmt(cCalvingAnimalUnder12Mths,[WinData.AnimalFileByIDNatIDNum.AsString, 12, FormatDate(Date,dsIrish)])
                        else
                          { Check if animal is under 18 months old, if so warn user }
                          { V3.8 R0.5 }

                          if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -18)) then
                             if MessageDlg(Format(cCalvingAnimalUnder18Mths,[WinData.AnimalFileByIDNatIDNum.AsString,18,FormatDate(Date,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
                                Abort;
                          { # V3.8 R0.5 }
                     end;

                   if ( WinData.EventDataHelper.GetLastEventDate(WinData.AnimalFileByIDID.Value, CCalvingEvent ) ) > ( IncMonth(Date, -3) ) then
                      if ( ( MessageDlg('It is less than 3 months since the last calving!', mtError, [mbOK], 0) ) = mrOK ) then
                         Abort;

                   if ( FSelectedHerdType = htDairy ) then { A check if Dry Off required for dairy herds }
                      begin
                         if ( ((WinData.GlobalSettings.MandatoryBreedingEvents) or (WinData.GlobalSettings.MandatoryDryOffEvent)) and
                              (WinData.AnimalFileByIDLactNo.Value > 0) and
                              not((WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CDryOffEvent))) ) then
                            Messagedlg('This Cow has no Drying Off Record',mtinformation,[mbok],0)
                         else
                            ShowCalvingScr;
                      end
                   else { A check for Dry Off is not required for non dairy herds. }
                      ShowCalvingScr
               end;
         end;
   EventGridAnimalEventsView.DataController.RefreshExternalData; // in case of CONDITION SCORE / HEALTH event recorded at time of calving.
end;

procedure TMenuForm.PurchButtonClickClick(Sender: TObject);
begin
   TfMediPurch.Execute;
end;

procedure TMenuForm.sbAddClick(Sender: TObject);
begin
   AddAnimal;
end;

procedure TMenuForm.HideModules;
begin
   Breeding1.Visible := False;      // Menu
   Suckler1.Visible := False;
   Management1.Visible := False;
   AnimalWeighing1.Visible := False;
   CowManagementReports1.Visible := False;
   MilkRecording1.Visible := False;
   MilkAnalysisReports1.Visible := False;
   PedigreeReports1.Visible := False;
   BrowseSireRegister1.Visible := False;
   SireSelection1.Visible := False;
   QuotaPlanner1.Visible := False;
   BeefManagement1.Visible := False; // Keiths MOD
   Slaughter1.Visible := False;
   Presale1.Visible := False;
end;

procedure TMenuForm.CheckMods;
var
  SysRegCountry : TCountry;
begin
   pRegisterCalfRegLink.Visible := True;
   pManagementLink.Visible := True;

   // Check if (1) BEEF Admin Basic
   if (Def.Definition.dUsePremiums) then
      begin
         btnFeedPurch.Visible := True;
         btnVetPurch.Visible := True;
         btnVetTreats.Visible := True;
         pGroupsLink.Visible := True;
      end;

   // Check if (2) Suckler Cow Events
   if (Def.Definition.dUseManCal) then
      begin
         pBreedingLink.Visible := True;
         lBreedingLink.Visible := True;
         pbBreedingLink.Visible := True;
         pBreedingContainter.Visible := True;
         lBreedingLink.Style.Font.Color := clBlack;
         pBreedingLink.BevelOuter := bvNone;
         pManagementLink.Visible := True;
         { DO NOT CHANGE THIS !!}

         btnCalfRegistration.Visible := True;

         btnWeighing.Visible := True;

         Breeding1.Visible             := True;
         Suckler1.Visible              := True;
         Management1.Visible           := True;
         AnimalWeighing1.Visible       := True;
         CowManagementReports1.Visible := True;
         ReLinkCalves1.Visible         := True;
     end
   else
      begin
         btnCalfRegistration.Visible := False;
         //   12/08/13 [V5.1 R9.1] /MK Change - Changes to show ICBF button for Irish Beef Systems.
         btnICBFEventReg.Visible     := True;
         btnICBFImport.Visible       := True;
         ReLinkCalves1.Visible          := False;
         pManagementLink.Visible        := False;
         if ( (WinData.GlobalSettings.DisplayCrushScreen) and (FSelectedHerdType = htBeef) and (Def.Definition.dUseCrush) ) then
            begin
               lBreedingLink.Visible := True;
               pBreedingLink.Visible := True;
               pBreedingContainter.Visible := True;
               lBreedingLink.Caption := 'Crush';
               lBreedingLink.OnClick(nil);
            end;
      end;

   // Check if (3) Quota Man
   if (Def.Definition.dUseQuotaMan) then
      begin
         QuotaPlanner1.Visible         := True;
         BrowseSireRegister1.Visible   := True;
         SireSelection1.Visible        := True;
         btnBulkTank.Visible           := True;
         pmiBulkTank.Visible           := True;
      end
   else
      begin
         btnBulkTank.Visible           := False;
         pmiBulkTank.Visible           := False;
      end;

   // Check if (4) Milk Recording
   if (Def.Definition.dUseMilkRec) then
      begin
         Dairy1.Visible                := True;
         MilkDiskParameters1.Visible   := True;
         //pFeedAlloc.Visible          := True;
         btnFeedAlloc.Visible          := True;
         FeedTypes1.Visible            := True;
         FeedAllocation1.Visible       := True;
      end
   else
      begin
         Dairy1.Visible              := False;
         MilkDiskParameters1.Visible := False;
         //pFeedAlloc.Visible        := False;
         btnFeedAlloc.Visible        := False;
         FeedTypes1.Visible          := False;
         FeedAllocation1.Visible     := False;
      end;

   // Check if (5) Pedigree
   if (Def.Definition.dUsePedigree) then
      PedigreeReports1.Visible    := True
   else
      PedigreeReports1.Visible    := False;

   // Check if (6) BEEF MANAGEMENT (KVB's)
   if (Def.Definition.dUseBeefMan) then
      begin
         pManagementLink.Visible  := True;
         BeefManagement1.Visible  := True;
         Slaughter1.Visible       := True;
         Presale1.Visible         := True;
         //   25/05/12 [V5.0 R7.0] /MK Change - Only Show Group Purchase If Beef Management And Crush or Preference Enabled - GL Request.
         btnPurchaseGroup.Visible := ( Def.Definition.dUseCrush ) and ( Preferences.ValueAsBoolean[cGSEnableBeefGroupPurchases] );
         btnSalesGroup.Visible    := True;
         btnFeedAlloc.Visible     := True;
         FeedTypes1.Visible       := True;
         FeedAllocation1.Visible  := True;
      end
   else
      begin
         BeefManagement1.Visible  := False;
         Slaughter1.Visible       := False;
         Presale1.Visible         := False;
         btnFeedAlloc.Visible     := True;
         FeedTypes1.Visible       := False;
         FeedAllocation1.Visible  := False;
         btnPurchaseGroup.Visible := False;
         btnSalesGroup.Visible    := False;
      end;

   // Added by KB 24/10/00 FeedPurch/FeedAlloc to appear ONLY with MilkRec & BeefMan Mods.
   if ( Def.Definition.dUseMilkRec ) OR ( Def.Definition.dUseBeefMan ) then
      begin
         cbFeedEvents.Visible          := True; // SP 29/05/2003
         btnFeedAlloc.Visible          := True;
         FeedTypes1.Visible            := True;
         FeedAllocation1.Visible       := True;
      end
   else
      begin
         cbFeedEvents.Visible          := False; // SP 29/05/2003
         btnFeedAlloc.Visible          := False;
         FeedTypes1.Visible            := False;
         FeedAllocation1.Visible       := False;
      end;

   GroupSetup1.Visible := ( Def.Definition.dUseManCal ) or ( Def.Definition.dUseBeefMan );
   pmiGroupSetup.Visible := GroupSetup1.Visible;

   btnFactorySales.Visible := True;
   btnFactorySales1.Visible := btnFactorySales.Visible;

   btnParlourLink.Visible := ShowParlourLink;
   btnRationCalc.Visible := ShowRationCalcLink;
   SysRegCountry := WinData.SystemRegisteredCountry;

   //   22/02/12 [V5.0 R4.0] /MK Change - Default AISireProvenDairy.Caption To Null.
   AISireProvenDairy.Caption := '';

   //   23/04/12 [V5.0 R5.2] /MK Change - If England Then Remove Register Remarks.
   actRegisterRemarks.Visible := False;

   lAIMICBFMore.Visible := False;
   actAIMMovements.Visible := False;

   if (SysRegCountry = Ireland) then
      begin
         //   22/02/12 [V5.0 R4.0] /MK Change - If Country = Ireland Then AISireProvenDairy.Caption Is Normal Caption.
         AISireProvenDairy.Caption := 'AI Sire (From Register)';
         //   22/02/12 [V5.0 R4.0] /MK Change - If Country = Ireland New AISireDairyCo.Visible := False.
         AISireDairyCo.Visible := False;
         psmDairyCoAI.Visible := False;
         lAIMICBFMore.Visible := True;
         if FSelectedHerdType = htBeef then
            lAIMICBFMore.Left := 350
         else
            lAIMICBFMore.Left := 450;
         actAIMMovements.Visible := True;
         if (AIMClient.ClientExists) then
            begin
               actReconcileHerd.Caption := 'AIM Herd'+ #13#10+'Reconcile';
               pmReconcileHerd := TPopupMenu.Create(nil);
               miReconcileHerd := TMenuItem.Create(pmFactorySales);
               miReconcileHerd.OnClick := miReconcileHerdClick;
               miReconcileHerd.Caption := 'Herd Reconcile - Scan Cards';
               pmReconcileHerd.Items.Add([miReconcileHerd]);
               btnReconcileHerd.Kind := cxbkDropDownButton;
               btnReconcileHerd.DropDownMenu := pmReconcileHerd;
            end
         else
            actReconcileHerd.Caption := 'CMMS'+#13#10+'Reconciliation';

         lAIMICBFMore.Visible := False;
         actRegisterRemarks.Visible := True;
      end
   else if SysRegCountry = England then
      begin
         actReconcileHerd.Caption := 'CTS Cattle'+#13#10+'On Holding';
         btnReconcileHerd.Kind := cxbkStandard;
      end
   else
      begin
         btnReconcileHerd.Kind := cxbkStandard;
         actReconcileHerd.Caption := 'Reconcile'+#13#10+'Herd';
      end;

   if ( SysRegCountry = NIreland ) then
      btnMartFiles.Action := actAPHISEPermit
   else
      btnMartFiles.Action := actMartFiles;

   btnMartFiles1.Action := actIMartFilesAttach;

   //   22/02/12 [V5.0 R4.0] /MK Change - If Country <> Ireland Then AISireProvenDairy.Caption Contains ICBF & AISireDairyCo.Visible.
   if ( FSelectedHerdType = htDairy ) then
      psmDairyAI.Caption := 'Dairy Register'
   else
      psmDairyAI.Caption := 'From Register';
   if ( SysRegCountry <> Ireland ) then
      begin
         AISireProvenDairy.Caption := 'AI Sire (From ICBF Register)';
         psmDairyAI.Caption := 'From ICBF Register';
         AISireDairyCo.Visible := True;
         psmDairyCoAI.Visible := True;
      end;

   //   25/08/14 [V5.3 R5.7] /MK Additional Feature - New Bord Bia system menu only available to Beef Crush users - IAD/GL request.
   SetBordBiaClient.Visible := ( Def.Definition.dUseCrush ) and ( FSelectedHerdType = htBeef );

   //   18/09/14 [V5.3 R6.3] /MK Change - Change left and caption of re-download attachment components for Beef herds.
   if ( FSelectedHerdType = htBeef ) then
      begin
         lRefreshAttachments.Left := 118;
         lRefreshAttachments.Caption := 'Check for new attachments';
         imgRefreshAttachments.Left := 288;
      end
   else
      begin
         lRefreshAttachments.Left := 276;
         lRefreshAttachments.Caption := 'Check for new mail attachments';
         imgRefreshAttachments.Left := 477;
      end;

   //   15/09/14 [V5.3 R6.2] /MK Additional Feature - New link to re-download attachments from within Links menu.
   lRefreshAttachments.Visible := ( SysRegCountry = Ireland );
   imgRefreshAttachments.Visible := lRefreshAttachments.Visible;

   //   02/12/15 [V5.5 R1.4] /MK Additional Feature - Made another drop down item to show Beef Sire Register for Dairy herds as well
   //                                                 as the Dairy Sire Register - GL/Declan O'Meara request.
   AISireFromBeefRegister.Visible := ( (SysRegCountry = Ireland) and (FSelectedHerdType = htDairy) );
   psmBeefAI.Visible := ( (SysRegCountry = Ireland) and (FSelectedHerdType = htDairy) );
   psmBeefAI.Caption := 'Beef Register';
   if ( AISireFromBeefRegister.Visible ) then
      AISireProvenDairy.Caption := 'AI Sire (From Dairy Register)'
   else
      AISireProvenDairy.Caption := 'AI Sire (From Register)';

   //   27/09/18 [V5.8 R3.0] /MK Additional Feature - Hide Block Events buttons if Preference for Dealer is turned on.
   lBlockEvents.Visible := ( not(WinData.ShowDealerControls) );
   pOnFarmEventsLink.Visible := lBlockEvents.Visible;
   pMovementsInOutLink.Visible := lBlockEvents.Visible;
   pGrpAnimalWelfareLink.Visible := lBlockEvents.Visible;
   imgFarmSafetyLogo.Left := 194;
   if ( not(lBlockEvents.Visible) ) then
      imgFarmSafetyLogo.Left := 24;

   //   27/09/18 [V5.8 R3.0] /MK Change - Change single purchase, sale, vet treatment and weighing to go into the block event screens.
   if ( not(lBlockEvents.Visible) ) then
      begin
         btnPurchases.Action := actMovementsIn;
         actMovementsIn.Caption := 'Purchases';
         btnSalesDeaths.Action := actMovementsOut;
         actMovementsOut.Caption := 'Sales';
         actGroupVetTreat.Caption := actVetTreat.Caption;
         btnVetTreats.Action := actGroupVetTreat;
         actGroupWeighing.Caption := actWeighing.Caption;
         btnWeighing.Action := actGroupWeighing;
      end
   else
      begin
         actMovementsIn.Caption := 'In';
         btnPurchases.Action := actPurchase;
         btnSalesDeaths.Action := actSalesDeaths;
         btnVetTreats.Action := actVetTreat;
         btnWeighing.Action := actWeighing;
      end;
end;

procedure TMenuForm.SetUpForm;
var
   SystemRegCountry : TCountry;
   ResetBeefCols : Boolean;
begin
   //   28/04/11 [V4.0 R9.8] /MK Change - Disable cbDefaultHerd If Not MultiHerd System.
   cbDefaultHerd.Enabled := WinData.MultiHerd;
   lHerdFarm.Visible := cbDefaultHerd.Visible;

   FCountry := WinData.DefCountry(StrToInt(cbDefaultHerd.Value));

   if ( cbDefaultHerd.Value <> '0' ) then
      FSelectedHerdType := HerdLookup.GetHerdType(StrToInt(cbDefaultHerd.Value))
   //   16/04/12 [V5.0 R4.9] /MK Bug Fix - Added Check If All Herds Then FSelectedHerdType Is First Herd In Owners <> NoneHerd.
   else if ( cbDefaultHerd.Value = '0') and ( WinData.UserDefaultHerdID = 0 ) then
      begin
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT ID FROM Owners');
               SQL.Add('WHERE ID <> '+IntToStr(WinData.NoneHerdID)+' ');
               Open;
               try
                  First;
                  FSelectedHerdType := HerdLookup.GetHerdType(Fields[0].AsInteger);
               finally
                  Close;
               end;
            finally
               Free;
            end;
      end;

   if ( FSelectedHerdType = htBeef ) then
      pBreedingContainter.Top := 62;

   //   06/05/11 [V4.1 R0.1] /MK Bug Fix - If Beef Herd Then DO NOT SHOW Animal Select - GL
   {
   lAnimalSelect.Visible := not(FSelectedHerdType = htBeef);
   Bevel3.Visible := not(FSelectedHerdType = htBeef);
   btnShowAnimalsOptions.Visible := not(FSelectedHerdType = htBeef);
   }
   //   23/07/18 [V5.8 R1.3] /MK Change - Show Animal Select regardless of herd type as some categories now show for Beef Herds.
   ShowHideAnimalCategoryItems;

   SystemRegCountry := WinData.SystemRegisteredCountry;
   if SystemType = stPDAStandalone then
      begin
         vSplitter.Hide;
         //Gradient.Height := 0;
         pGrid.Align := alClient;
         sbReports.Visible := False;
         ToolbarSep973.Visible := False;
         sbAnimalsPaddocks.Visible := False;
         ToolbarSep978.Visible := False;
         sbSheep.Visible := False;
         ToolbarSep977.Visible := False;
         sbAccounts.Visible := False;
         ToolbarSep976.Visible := False;
         sbMachinery.Visible := False;
         tsMachinery.Visible := False;
         sbGettingStarted.Visible := False;
         tsGettingStart.Visible := False;
         AnimalsEvents.Visible := False;
         View1.Visible := False;
         AnimalsReports.Visible := False;
         miPhoneLink.Visible := False;
         sbHerdStats.Visible := False;
         btnHerdStats.Visible := False;
         PDAReports.Visible := True;
      end
   else
      begin
         try
            PDAReports.Visible := False;
            WinData.UserDefaultHerdID := StrToInt(cbDefaultHerd.Value);
         except
            FCountry := Ireland;
         end;

         sbGettingStarted.Visible := ( WinData.GlobalSettings.DisplayGettingStarted );
         tsGettingStart.Visible := sbGettingStarted.Visible;
         sbMachinery.Visible := not sbGettingStarted.Visible;
         tsMachinery.Visible := not sbGettingStarted.Visible;;

         if not sbGettingStarted.Visible then
            begin
               // only show machinery link when getting started is not visible and machinery program exists
               MachineryLink.Visible := FileExists(cMachineryExePath);
               N19.Visible := MachineryLink.Visible;
            end;

         sbAnimalsPaddocks.Enabled := FileExists(ExtractFilePath(ParamStr(0))+'paddocks.exe '); // MK 19.08.09
         sbMachinery.Enabled := FileExists('C:\Machinery\Machinery.exe');  // MK 23.03.07
         sbAccounts.Enabled := FileExists('C:\Kingsacc\Winaccs.exe');   // MK 23.03.07
         sbaccsdbs.Visible := sbAccounts.Enabled;
         if sbAccounts.enabled then
            LoadAccountsCompanies();
         sbSheep.Enabled := FileExists('C:\KSheep\Ksheepw.exe');   // MK 23.03.07
         actGroupMovements.Visible := ( Def.Definition.dUseManCal ) OR ( Def.Definition.dUseBeefMan ) or ( WinData.ShowDealerControls );

         Self.Enabled := False;
         HideModules;
         DefaultAccsCompany1.Visible := ShowAccsDef;

         // Start New Procedure

         if FCountry = NIreland then
            begin
               miDARDDairyFertilityBenchmarks.Visible := True;
               N13.Visible := True;
               actCalfReg.Caption := 'APHIS Reg.';
               btnICBFEventReg.Action := actHUKIReg;

               if FSelectedHerdType <> htBeef then
                  lRegisterCalfRegLink.Caption := 'Register/Calf Reg'
               else
                  lRegisterCalfRegLink.Caption := 'Register';

               //   30/06/11 [V4.1 R2.1] /MK Additional Feature - Removed For New Event Buttons.
               btnMovementPermits.Visible := True;
               btnMovementPermits.Kind := cxbkStandard;
               actMovementPermits.Caption := 'APHIS'+#13#10+'Movement';
               actMovementPermits.OnExecute := actMovementPermitsExecute;
            end
         else if FCountry = England then
            begin
               miDARDDairyFertilityBenchmarks.Visible := False;
               N13.Visible := False;
               actCalfReg.Caption := 'CTS Birth Reg.';
               btnCalfRegistration.Kind := cxbkStandard;
               if FSelectedHerdType <> htBeef then
                  //   23/04/12 [V5.0 R5.2] /MK Change - If England Then Change Link To CTS Registration.
                  lRegisterCalfRegLink.Caption := 'CTS Registration'
               else
                  lRegisterCalfRegLink.Caption := 'Register';
               actICBFEventReg.Caption := 'HUKI Reg.';
               //   30/06/11 [V4.1 R2.1] /MK Additional Feature - Removed For New Event Buttons.
               btnMovementPermits.Visible := True;
               btnMovementPermits.Action := actMovementPermits;
               actMovementPermits.Caption := 'CTS Move.';
               actMovementPermits.OnExecute := CTSMovementsClick;
            end
         else if ( FCountry = Ireland ) then
            begin
               if ( AIMClient.ClientExists ) then
                  actCalfReg.Caption := 'AIM Calf'+#13#10+'Registration'
               else
                  actCalfReg.Caption := 'Calf'+#13#10+'Registration';

               //   14/11/11 [V5.0 R2.1] /MK Bug Fix - Setting The ICBF Action In Code.
               btnICBFEventReg.Action := actICBFEventReg;
               actICBFEventReg.Caption := 'ICBF Event'+#13#10+'Reg.';

               if ( Def.Definition.dUseManCal ) or ( Def.Definition.dUseBeefMan ) then
                  begin
                     //   12/08/13 [V5.1 R9.1] /MK Change - Changes to show ICBF button for Irish Beef Systems.
                     if ( AIMClient.ClientExists ) then
                        lRegisterCalfRegLink.Caption := 'AIM / ICBF'
                     else
                        begin
                           if ( FSelectedHerdType = htBeef ) then
                              lRegisterCalfRegLink.Caption := 'Register / ICBF'
                           else
                              lRegisterCalfRegLink.Caption := 'Register/Calf Reg.'
                        end;
                  end
               else
                  begin
                     if ( AIMClient.ClientExists ) then
                        lRegisterCalfRegLink.Caption := 'AIM'
                     else
                        lRegisterCalfRegLink.Caption := 'Register';
                  end;

               //   27/02/14 [V5.2 R8.7] /MK Change - Do not show Movement Permits/AIM Movements in Movement Menu for Irish Herd - GL request.
               btnMovementPermits.Visible := False;
               actMovementPermits.OnExecute := actMovementPermitsExecute;
               //   21/09/12 [V5.0 R9.9] /MK Bug Fix - Delphi lost drop-down-menu from btnMovementPermits Properties - now coded.
               ShowAIMOrStandardIrishRecScr;
            end
         //   12/08/13 [V5.1 R9.1] /MK Change - Added code to change New Zealand lRegisterCalfRegLink.Caption to Register.
         else
            begin
               lRegisterCalfRegLink.Caption := 'Register';
            end;

         // 1 Pic  = 119  // 2 Pics = 235   // 3 Pics = 351   // 4 Pics = 467  // 5 Pics = 579
         // All Buttons etc have been hidden (HideModules), these show them back

         CreateMooreParkExportFile1.Visible := ( FCountry = Ireland ) and ( FSelectedHerdType in [htDairy, htSuckler] );
         pmiCreateMooreparkFile.Visible := CreateMooreParkExportFile1.Visible;

         CreateWeeklyDiaryEvents1.Visible := ( FCountry = England ) and ( FSelectedHerdType in [htDairy, htSuckler] );
         pmiExportKCarson.Visible := CreateWeeklyDiaryEvents1.Visible;

         //   12/01/12 [V5.0 R3.3] /MK Additional Feature - Added New Tesco Herd Scoring Export Drop Down Option For English Herds Only.
         pmiExportTescoHerdScoringEvents.Visible := ( FCountry = England );

         //   04/07/17 /MK Bug Fix - CreateUKMilkRecorderOption should NOT be visible if OwnerFileUKMilkRecorder is DIY.
         CreateUKMilkRecorderOption.Visible := ( (FCountry <> Ireland) and
                                                 (Def.Definition.dUseMilkRec) and
                                                 (Length(WinData.OwnerFileUKMilkRecorder.AsString) > 0) and
                                                 (WinData.OwnerFileUKMilkRecorder.AsString <> cUKMilkRecorder_DIY) ) ;
         pmiCreatetMilkRecEvents.Visible := CreateUKMilkRecorderOption.Visible;

         pmiAHDBFile.Visible := ( FCountry = England );

         pmiCurrentHerd.Visible := WinData.ActiveFilter;
         ClearFilter1.Visible := WinData.ActiveFilter;

         {
         pmiHeifers.Visible := False;
         pmiDairyHeifers.Visible := False;
         pmiBeefHeifers.Visible := False;
         }

         if FSelectedHerdType = htDairy then
            begin
               //   12/03/11 [V4.0 R8.7] /MK Additional Feature - Remove New GridColumnCalvingDate If Herd Is Beef
               //   03/10/11 [V5.0 R1.0] /MK Change - Check If CalvingDate In Grid Cols Is Visible
               if (cxAnimalGridViewCalvingDate.Visible) then
                  begin
                     cxAnimalGridViewCalvingDate.Visible := True;
                     cxAnimalGridViewCalvingDate.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewCalvingDate.Visible := False;
                     cxAnimalGridViewCalvingDate.Hidden := False;
                  end;

               if (cxAnimalGridViewServiceDate.Visible) then
                  begin
                     cxAnimalGridViewServiceDate.Visible := True;
                     cxAnimalGridViewServiceDate.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewServiceDate.Visible := False;
                     cxAnimalGridViewServiceDate.Hidden := False;
                  end;

               if (cxAnimalGridViewDaysInMilk.Visible) then
                  begin
                     cxAnimalGridViewDaysInMilk.Visible := True;
                     cxAnimalGridViewDaysInMilk.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewDaysInMilk.Visible := False;
                     cxAnimalGridViewDaysInMilk.Hidden := False;
                  end;

               if (cxAnimalGridViewLactSCC.Visible) then
                  begin
                     cxAnimalGridViewLactSCC.Visible := True;
                     cxAnimalGridViewLactSCC.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewLactSCC.Visible := False;
                     cxAnimalGridViewLactSCC.Hidden := False;
                  end;

               if (cxAnimalGridViewLactYield.Visible) then
                  begin
                     cxAnimalGridViewLactYield.Visible := True;
                     cxAnimalGridViewLactYield.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewLactYield.Visible := False;
                     cxAnimalGridViewLactYield.Hidden := False;
                  end;

               if (cxAnimalGridViewLactSolids.Visible) then
                  begin
                     cxAnimalGridViewLactSolids.Visible := True;
                     cxAnimalGridViewLactSolids.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewLactSolids.Visible := False;
                     cxAnimalGridViewLactSolids.Hidden := False;
                  end;

               if (cxAnimalGridViewLatestYield.Visible) then
                  begin
                     cxAnimalGridViewLatestYield.Visible := True;
                     cxAnimalGridViewLatestYield.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewLatestYield.Visible := False;
                     cxAnimalGridViewLatestYield.Hidden := False;
                  end;

               if (cxAnimalGridViewLatestSolids.Visible) then
                  begin
                     cxAnimalGridViewLatestSolids.Visible := True;
                     cxAnimalGridViewLatestSolids.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewLatestSolids.Visible := False;
                     cxAnimalGridViewLatestSolids.Hidden := False;
                  end;

               if (cxAnimalGridViewBfatWeight.Visible) then
                  begin
                     cxAnimalGridViewBfatWeight.Visible := True;
                     cxAnimalGridViewBfatWeight.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewBfatWeight.Visible := False;
                     cxAnimalGridViewBfatWeight.Hidden := False;
                  end;

               if (cxAnimalGridViewProtWeight.Visible) then
                  begin
                     cxAnimalGridViewProtWeight.Visible := True;
                     cxAnimalGridViewProtWeight.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewProtWeight.Visible := False;
                     cxAnimalGridViewProtWeight.Hidden := False;
                  end;

               if (cxAnimalGridViewCalvingInterval.Visible) then
                  begin
                     cxAnimalGridViewCalvingInterval.Visible := True;
                     cxAnimalGridViewCalvingInterval.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewCalvingInterval.Visible := False;
                     cxAnimalGridViewCalvingInterval.Hidden := False;
                  end;

               if (cxAnimalGridViewJohnesResult.Visible) then
                  begin
                     cxAnimalGridViewJohnesResult.Visible := True;
                     cxAnimalGridViewJohnesResult.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewJohnesResult.Visible := False;
                     cxAnimalGridViewJohnesResult.Hidden := False;
                  end;

               if ( cxAnimalGridViewOverallGainPerDay.Visible ) then
                  begin
                     cxAnimalGridViewOverallGainPerDay.Visible := False;
                     cxAnimalGridViewOverallGainPerDay.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewOverallGainPerDay.Visible := False;
                     cxAnimalGridViewOverallGainPerDay.Hidden := True;
                  end;

               actDryOff.Caption := 'Drying Off';
               pBreedingContainter.Visible := True;
               CheckMods;
               if (Def.Definition.dUseManCal) then
                  begin
                     if WhichReg <> England then
                        actICBFEventReg.Visible := True;

                     actCalfReg.Visible := True;
                     pRegCalfRegContainter.Visible := True;
                     btnBulkTank.Visible := True;
                     pmiBulkTank.Visible := True;
                  end
               else
                  begin
                     btnBulkTank.Visible := False;
                     pmiBulkTank.Visible := False;
                     btnCalfRegistration.Visible := False;
                     //   12/08/13 [V5.1 R9.1] /MK Change - Changes to show ICBF button for Irish Beef Systems.
                     btnICBFEventReg.Visible := True;
                  end;

               if (Def.Definition.dUseQuotaMan) then
                   begin
                     btnBulkTank.Visible := True;
                     pmiBulkTank.Visible := True;
                   end
               else
                  begin
                     btnBulkTank.Visible := False;
                     pmiBulkTank.Visible := False;
                  end;

               if (Def.Definition.dUseMilkRec) then
                  begin
                     btnMilkRec.Visible := True;
                     Management1.Visible := True;
                     MilkRecording1.Visible := True;
                     MilkAnalysisReports1.Visible := True;
                     BrowseSireRegister1.Visible := True;
                     SireSelection1.Visible := True;
                     QuotaPlanner1.Visible := True;
                  end
               else if ( not(Def.Definition.dUseMilkRec) ) then
                  begin
                     btnMilkRec.Visible := False;
                     Management1.Visible := False;
                     MilkRecording1.Visible := False;
                     MilkAnalysisReports1.Visible := False;
                     BrowseSireRegister1.Visible := False;
                     SireSelection1.Visible := False;
                     QuotaPlanner1.Visible := False;
                  end;

               //   20/09/12 [V5.0 R9.9] /MK Bug Fix - If Beef Herd and BeefMan Module then don't show Milk Rec or Bulk Tank
               if (Def.Definition.dUseBeefMan) and (FSelectedHerdType = htBeef) then
                  begin
                     btnBulkTank.Visible := False;
                     pmiBulkTank.Visible := False;
                     btnMilkRec.Visible := False;
                  end;

               //   20/09/12 [V5.0 R9.9] /MK Bug Fix - If Beef Herd and BeefMan Module then don't show Milk Rec or Bulk Tank
               if (Def.Definition.dUseBeefMan) and (Def.Definition.dUseMilkRec) and (FSelectedHerdType = htBeef) then
                  begin
                     btnMilkRec.Visible := False;
                     btnBulkTank.Visible := False;
                     pmiBulkTank.Visible := False;
                  end;

               btnReconcileHerd.Visible := True;
               btnICBFEventReg.Visible := True;

               {
               //   06/02/13 [V5.1 R4.1] /MK Change - GL asked me to add all Heifers for Dairy Herds.
               pmiHeifers.Visible := True;
               pmiDairyHeifers.Visible := True;
               pmiBeefHeifers.Visible := True;
               }

               lBreedingLink.OnClick(nil);
            end
         else if FSelectedHerdType = htSuckler then
            begin
               //   12/03/11 [V4.0 R8.7] /MK Additional Feature - Remove New GridColumnCalvingDate If Herd Is Beef
               //   03/10/11 [V5.0 R1.0] /MK Change - Check If CalvingDate In Grid Cols Is Visible
               if (cxAnimalGridViewCalvingDate.Visible) then
                  begin
                     cxAnimalGridViewCalvingDate.Visible := True;
                     cxAnimalGridViewCalvingDate.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewCalvingDate.Visible := False;
                     cxAnimalGridViewCalvingDate.Hidden := False;
                  end;

               if (cxAnimalGridViewServiceDate.Visible) then
                  begin
                     cxAnimalGridViewServiceDate.Visible := True;
                     cxAnimalGridViewServiceDate.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewServiceDate.Visible := False;
                     cxAnimalGridViewServiceDate.Hidden := False;
                  end;

               if not(cxAnimalGridViewDaysInMilk.Visible) then
                  begin
                     cxAnimalGridViewDaysInMilk.Visible := False;
                     cxAnimalGridViewDaysInMilk.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewDaysInMilk.Visible := False;
                     cxAnimalGridViewDaysInMilk.Hidden := True;
                  end;

               if not(cxAnimalGridViewLactSCC.Visible) then
                  begin
                     cxAnimalGridViewLactSCC.Visible := False;
                     cxAnimalGridViewLactSCC.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewLactSCC.Visible := False;
                     cxAnimalGridViewLactSCC.Hidden := True;
                  end;

               if not(cxAnimalGridViewLactYield.Visible) then
                  begin
                     cxAnimalGridViewLactYield.Visible := False;
                     cxAnimalGridViewLactYield.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewLactYield.Visible := False;
                     cxAnimalGridViewLactYield.Hidden := True;
                  end;

               if not(cxAnimalGridViewLactSolids.Visible) then
                  begin
                     cxAnimalGridViewLactSolids.Visible := False;
                     cxAnimalGridViewLactSolids.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewLactSolids.Visible := False;
                     cxAnimalGridViewLactSolids.Hidden := True;
                  end;

               if not(cxAnimalGridViewLatestYield.Visible) then
                  begin
                     cxAnimalGridViewLatestYield.Visible := False;
                     cxAnimalGridViewLatestYield.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewLatestYield.Visible := False;
                     cxAnimalGridViewLatestYield.Hidden := True;
                  end;

               if not(cxAnimalGridViewLatestSolids.Visible) then
                  begin
                     cxAnimalGridViewLatestSolids.Visible := False;
                     cxAnimalGridViewLatestSolids.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewLatestSolids.Visible := False;
                     cxAnimalGridViewLatestSolids.Hidden := True;
                  end;

               if not(cxAnimalGridViewBfatWeight.Visible) then
                  begin
                     cxAnimalGridViewBfatWeight.Visible := False;
                     cxAnimalGridViewBfatWeight.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewBfatWeight.Visible := False;
                     cxAnimalGridViewBfatWeight.Hidden := True;
                  end;

               if not(cxAnimalGridViewProtWeight.Visible) then
                  begin
                     cxAnimalGridViewProtWeight.Visible := False;
                     cxAnimalGridViewProtWeight.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewProtWeight.Visible := False;
                     cxAnimalGridViewProtWeight.Hidden := True;
                  end;

               if (cxAnimalGridViewJohnesResult.Visible) then
                  begin
                     cxAnimalGridViewJohnesResult.Visible := True;
                     cxAnimalGridViewJohnesResult.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewJohnesResult.Visible := False;
                     cxAnimalGridViewJohnesResult.Hidden := True;
                  end;

               if (cxAnimalGridViewCalvingInterval.Visible) then
                  begin
                     cxAnimalGridViewCalvingInterval.Visible := True;
                     cxAnimalGridViewCalvingInterval.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewCalvingInterval.Visible := False;
                     cxAnimalGridViewCalvingInterval.Hidden := False;
                  end;

               if ( cxAnimalGridViewOverallGainPerDay.Visible ) then
                  begin
                     cxAnimalGridViewOverallGainPerDay.Visible := True;
                     cxAnimalGridViewOverallGainPerDay.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewOverallGainPerDay.Visible := False;
                     cxAnimalGridViewOverallGainPerDay.Hidden := False;
                  end;

               actDryOff.Caption := 'Weaning';

               btnDryOff.Visible := True;
               CheckMods;
               if (Def.Definition.dUseManCal) then
                  begin
                     Suckler1.Visible  := True;
                     btnICBFEventReg.Visible := True;
                     btnCalfRegistration.Visible := True;
                  end
               else // for mod 1, suckler herd.
                  begin
                     btnCalfRegistration.Visible := False;
                     //   12/08/13 [V5.1 R9.1] /MK Change - Changes to show ICBF button for Irish Beef Systems.
                     btnICBFEventReg.Visible := True;

                     btnBulkTank.Visible := False;
                     pmiBulkTank.Visible := False;
                  end;

               if (Def.Definition.dUseQuotaMan) then
                  begin
                     btnBulkTank.Visible := True;
                     pmiBulkTank.Visible := True;
                  end
               else
                  begin
                     btnBulkTank.Visible := False;
                     pmiBulkTank.Visible := False;
                  end;

               //case of Suckler herd with KVB's Beef Management
               btnMilkRec.Visible := False;
               //   20/09/12 [V5.0 R9.9] /MK Bug Fix - If Beef Herd and BeefMan Module then don't show Milk Rec or Bulk Tank
               if (Def.Definition.dUseBeefMan) and (FSelectedHerdType = htBeef) then
                  begin
                     btnBulkTank.Visible := False;
                     pmiBulkTank.Visible := False;
                  end;

               btnReconcileHerd.Visible := True;

               //pmiHeifers.Visible := True;

               //bBreedingClick(nil);
               lBreedingLink.OnClick(nil);
            end
         else if FSelectedHerdType = htBeef then
            begin
               CheckMods;
               btnCalfRegistration.Visible := False;

               //   12/08/13 [V5.1 R9.1] /MK Change - Changes to show ICBF button for Irish Beef Systems.
               btnICBFEventReg.Visible := True;

               Suckler1.Visible  := False;
               lBreedingLink.Visible := ( (WinData.GlobalSettings.DisplayCrushScreen) and (Def.Definition.dUseCrush) );
               pBreedingLink.Visible := lBreedingLink.Visible;
               pbBreedingLink.Visible := pBreedingLink.Visible;
               Breeding1.Visible := False;

               //   12/03/11 [V4.0 R8.7] /MK Additional Feature - Remove New GridColumnCalvingDate If Herd Is Beef
               //   03/10/11 [V5.0 R1.0] /MK Change - Check If CalvingDate In Grid Cols Is Visible
               if not(cxAnimalGridViewCalvingDate.Visible) then
                  begin
                     cxAnimalGridViewCalvingDate.Visible := False;
                     cxAnimalGridViewCalvingDate.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewCalvingDate.Visible := False;
                     cxAnimalGridViewCalvingDate.Hidden := True;
                  end;

               if not(cxAnimalGridViewServiceDate.Visible) then
                  begin
                     cxAnimalGridViewServiceDate.Visible := False;
                     cxAnimalGridViewServiceDate.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewServiceDate.Visible := False;
                     cxAnimalGridViewServiceDate.Hidden := True;
                  end;

               if not(cxAnimalGridViewDaysInMilk.Visible) then
                  begin
                     cxAnimalGridViewDaysInMilk.Visible := False;
                     cxAnimalGridViewDaysInMilk.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewDaysInMilk.Visible := False;
                     cxAnimalGridViewDaysInMilk.Hidden := True;
                  end;

               if not(cxAnimalGridViewLactSCC.Visible) then
                  begin
                     cxAnimalGridViewLactSCC.Visible := False;
                     cxAnimalGridViewLactSCC.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewLactSCC.Visible := False;
                     cxAnimalGridViewLactSCC.Hidden := True;
                  end;

               if not(cxAnimalGridViewLactYield.Visible) then
                  begin
                     cxAnimalGridViewLactYield.Visible := False;
                     cxAnimalGridViewLactYield.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewLactYield.Visible := False;
                     cxAnimalGridViewLactYield.Hidden := True;
                  end;

               if not(cxAnimalGridViewLactSolids.Visible) then
                  begin
                     cxAnimalGridViewLactSolids.Visible := False;
                     cxAnimalGridViewLactSolids.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewLactSolids.Visible := False;
                     cxAnimalGridViewLactSolids.Hidden := True;
                  end;

               if not(cxAnimalGridViewLatestYield.Visible) then
                  begin
                     cxAnimalGridViewLatestYield.Visible := False;
                     cxAnimalGridViewLatestYield.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewLatestYield.Visible := False;
                     cxAnimalGridViewLatestYield.Hidden := True;
                  end;

               if not(cxAnimalGridViewLatestSolids.Visible) then
                  begin
                     cxAnimalGridViewLatestSolids.Visible := False;
                     cxAnimalGridViewLatestSolids.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewLatestSolids.Visible := False;
                     cxAnimalGridViewLatestSolids.Hidden := True;
                  end;

               if not(cxAnimalGridViewBfatWeight.Visible) then
                  begin
                     cxAnimalGridViewBfatWeight.Visible := False;
                     cxAnimalGridViewBfatWeight.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewBfatWeight.Visible := False;
                     cxAnimalGridViewBfatWeight.Hidden := True;
                  end;

               if not(cxAnimalGridViewProtWeight.Visible) then
                  begin
                     cxAnimalGridViewProtWeight.Visible := False;
                     cxAnimalGridViewProtWeight.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewProtWeight.Visible := False;
                     cxAnimalGridViewProtWeight.Hidden := True;
                  end;

               if (cxAnimalGridViewJohnesResult.Visible) then
                  begin
                     cxAnimalGridViewJohnesResult.Visible := True;
                     cxAnimalGridViewJohnesResult.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewJohnesResult.Visible := False;
                     cxAnimalGridViewJohnesResult.Hidden := True;
                  end;

               if (cxAnimalGridViewCalvingInterval.Visible) then
                  begin
                     cxAnimalGridViewCalvingInterval.Visible := False;
                     cxAnimalGridViewCalvingInterval.Hidden := True;
                  end
               else
                  begin
                     cxAnimalGridViewCalvingInterval.Visible := False;
                     cxAnimalGridViewCalvingInterval.Hidden := True;
                  end;

               if ( cxAnimalGridViewOverallGainPerDay.Visible ) then
                  begin
                     cxAnimalGridViewOverallGainPerDay.Visible := True;
                     cxAnimalGridViewOverallGainPerDay.Hidden := False;
                  end
               else
                  begin
                     cxAnimalGridViewOverallGainPerDay.Visible := False;
                     cxAnimalGridViewOverallGainPerDay.Hidden := False;
                  end;

               if (Def.Definition.dUseQuotaMan) then
                  begin
                     btnBulkTank.Visible := False;
                     pmiBulkTank.Visible := False;
                  end;

               if (Def.Definition.dUseBeefMan) OR (Def.Definition.dUseManCal) then // KVB's Mod
                  begin
                     AnimalWeighing1.Visible := True;
                     MilkRecording1.Visible := False;
                     btnWeighing.Visible := True;
                     btnMilkRec.Visible := False;
                  end;

               btnReconcileHerd.Visible := True;

               cxAnimalGridViewCalvingDate.Visible := False;
               cxAnimalGridViewCalvingDate.Hidden := True;

               cxAnimalGridViewServiceDate.Visible := False;
               cxAnimalGridViewServiceDate.Hidden := True;

               //   01/03/11 [V4.0 R8.6] /MK Change - If Beef Herd Then Movements Click Not Premium/CalfReg Click.
               if ( (WinData.GlobalSettings.DisplayCrushScreen) and (Def.Definition.dUseCrush) ) then
                  lBreedingLink.OnClick(nil)
               else
                  lMovementsLink.OnClick(nil);

            end;

         // If England or Not Suckler or Beef Herd Type Then Hide Animal Welfare Options
         if ( FCountry <> Ireland ) or ( not(Def.Definition.dUseManCal) ) or ( FSelectedHerdType = htBeef ) then
            begin
               pOnFarmEventsLink.Top := 30;
               pMovementsInOutLink.Top := 107;
               pGrpAnimalWelfareLink.Visible := False;
               //   18/03/14 [V5.2 R9.0] /MK Additional Feature - Single Animal Welfare menu changed to Kingswood Links
               //pAnimalWelfareLink.Visible := False;
               //   07/08/14 [V5.3 R4.4] /MK Change - If Links menu visible increase height of lEventsSection.
               if ( not(pKingswoodLink1.Visible) ) then
                  lEventsSection.Height := cEventSectNoVetLinkHeight
               else if ( WinData.ShowDealerControls ) then
                  lEventsSection.Height := cEventSectDealerHeight
               else
                  lEventsSection.Height := cEventSectDefaultHeight;
            end
         else
            begin
               pOnFarmEventsLink.Top := 33;
               pMovementsInOutLink.Top := 107;
               pGrpAnimalWelfareLink.Visible := True;
               lEventsSection.Height := cEventSectDefaultHeight;
            end;

         //   01/07/14 [V5.3 R3.0] /MK Additional Feature - Add new Farm Safety Logo and link to Farm Safety page - requested/found by GL.
         //                                                 Only to be shown for Irish Herds as web page is Irish.
         imgFarmSafetyLogo.Visible := FCountry = Ireland;

         btnMilkRec.Glyph := nil;
         // ----------  Add DropDownBoxes To Factory Sales & Mart Files ---------- //
         if ( ( WinData.GlobalSettings.DownloadMailAttachments ) and ( FCountry = Ireland ) ) then
            begin
               pmFactorySales := TPopupMenu.Create(nil);
               miFactorySales := TMenuItem.Create(pmFactorySales);
               miFactorySales.OnClick := miFactorySalesClick;
               miFactorySales.Caption := 'Factory Sales Screen';
               pmFactorySales.Items.Add([miFactorySales]);
               btnFactorySales.Kind := cxbkDropDownButton;
               btnFactorySales.DropDownMenu := pmFactorySales;

               pmMartFiles := TPopupMenu.Create(nil);
               miMartFiles := TMenuItem.Create(pmMartFiles);
               miMartFiles.OnClick := miMartFilesClick;
               miMartFiles.Caption := 'Mart Files Screen';
               pmMartFiles.Items.Add([miMartFiles]);
               btnMartFiles.Kind := cxbkDropDownButton;
               btnMartFiles.DropDownMenu := pmMartFiles;

               pmMilkRecording := TPopupMenu.Create(nil);
               miMilkRecording := TMenuItem.Create(pmMartFiles);
               miMilkRecording.OnClick := miMilkRecordingClick;
               miMilkRecording.Caption := 'Milk Recording Screen';
               pmMilkRecording.Items.Add([miMilkRecording]);
               btnMilkRec.Kind := cxbkDropDownButton;
               btnMilkRec.DropDownMenu := pmMilkRecording;
               btnMilkRec.Caption := 'Milk'+cCRLF+'Recording';
               WinData.LoadBtnImage(WinData.SingleEvents24BitImageList,btnMilkRec.Glyph,31);
            end
         else
            begin
               btnFactorySales.Kind := cxbkStandard;
               btnMartFiles.Kind := cxbkStandard;
               btnMilkRec.Kind := cxbkStandard;
               btnMilkRec.Caption := 'Milk Recording';
               WinData.LoadBtnImage(WinData.SingleEvents32BitImageList,btnMilkRec.Glyph,27);
            end;

         if WinData.UseScanner then
            imgBarcode.Visible := True
         else
            imgBarcode.Visible := False;

         if ( Def.Definition.dUseManCal ) and ( FSelectedHerdType <> htBeef ) then
            // breeding herd
            sbAddAnimalType.DropDownMenu := pmNewAddSireList
         else
            // Non-breeding herd
            begin
               sbAddAnimalType.DropDownMenu := nil;
               sbAddAnimalType.Caption := 'Add Animal';
            end;
      end;

   Self.Enabled := True;

   pmiImportICBFData.Visible := ICBFPCDownload1.Visible;
   pmiA1A2ResultFile.Visible := FSelectedHerdType = htDairy;
   //   13/03/20 [V5.9 R2.9] /MK Change - Only show Import Transponder Data to Cart option if Electronic Weighing module is enabled - GL request.
   pmiImportTransponderDataToCart.Visible := Def.Definition.dUseElecWeigh;

   ICBFPCDownload1.Visible := ( actICBFEventReg.Caption = 'ICBF Event'+#13#10+'Reg.' ) and ( btnICBFEventReg.Visible) and ( SystemRegCountry=Ireland );
   //   17/11/16 [V5.6 R3.2] /MK Change - Show Import button if Parlour Link is available.
   btnExport.Visible := ( not(WinData.ShowDealerControls) );
   btnImport.Enabled := ( (ICBFPCDownload1.Visible) or (btnParlourLink.Visible) or (FCountry = England) ) and ( btnExport.Visible );
   btnImport.Visible := btnExport.Visible;

   //   12/03/18 [V5.7 R8.2] /MK Change - Show the Calc Gain/Day button greyed out where type is not Suckler - GL request.
   //   12/05/21 [V6.0 R1.1] /MK Change - Moved btnRefreshAnimals button above the grid of animals - no need to disable it as all herds will use it eventually.
   {
   btnRefreshAnimals.Enabled := ( FSelectedHerdType = htSuckler );
   btnRefreshAnimals.LookAndFeel.Kind := lfFlat;
   btnRefreshAnimals.Colors.Default := $0069CCFC;
   btnRefreshAnimals.Colors.Disabled := $0069CCFC;
   btnRefreshAnimals.Colors.Hot := $0069CCFC;
   btnRefreshAnimals.Colors.Normal := $0069CCFC;
   btnRefreshAnimals.Colors.Pressed := $0069CCFC;
   if ( not(btnRefreshAnimals.Enabled) ) then
      begin
         btnRefreshAnimals.LookAndFeel.Kind := lfOffice11;
         btnRefreshAnimals.Colors.Default := $20000000;
         btnRefreshAnimals.Colors.Disabled := $20000000;
         btnRefreshAnimals.Colors.Hot := $20000000;
         btnRefreshAnimals.Colors.Normal := $20000000;
         btnRefreshAnimals.Colors.Pressed := $20000000;
      end;
   }

   btnFeedDiary.Enabled := ( (Def.Definition.dUseManCal) or (Def.Definition.dUseBeefMan) ) and ( WinData.UsingFeedAllocation );

   CreateEBIValuesYoungstockonly1.Visible := ( SystemRegCountry = Ireland ) and ( FSelectedHerdType <> htBeef );
   CMMSFileImport1.Visible := (SystemRegCountry=Ireland);
   UpdateAnimalNumberField1.Visible := (SystemRegCountry<>NIreland);

   //   01/03/17 [V5.6 R6.5] /MK Change - No need to show Premium History Utility anymore - GL/SP request.
   //PremiumHistoryReport1.Visible := (SystemRegCountry=Ireland);

   if ( SystemRegCountry = Ireland ) then
      DefaultHealthEventsAPHISMovementsIn1.Caption := 'Default &Health Events'
   else
      DefaultHealthEventsAPHISMovementsIn1.Caption := 'Default &Health Events (APHIS Movements In)';

   cxAnimalGridViewEBI.Visible := ( SystemRegCountry <> NIreland ) and ( FSelectedHerdType in [htSuckler, htDairy] );
   cxAnimalGridViewEBI.Hidden := ( not(cxAnimalGridViewEBI.Visible) );
   //   02/12/15 [V5.5 R1.4] /MK Change - Change caption of EBI column to Mat. Index ( short for maternal index ) for suckler herds.
   if ( cxAnimalGridViewEBI.Visible ) then
      begin
         if ( FSelectedHerdType = htSuckler ) then
            cxAnimalGridViewEBI.Caption := 'Mat. Index'
         else if ( not(SystemRegCountry in [Ireland, NIreland]) ) then
            cxAnimalGridViewEBI.Caption := 'SCI'
         else
            cxAnimalGridViewEBI.Caption := 'EBI';
      end;

   //   17/05/13 [V5.1 R7.1] /MK Additional Feature - Added Transponder field to main grid.
   //   08/08/18 [V5.8 R2.2] /MK Change - Show Transponder Column if Dairy herd and Parlour or Ration calc modules are using transponder numbers - UCD.
   cxAnimalGridViewTransponderNo.Visible := ( (FSelectedHerdType = htDairy) and
                                              ((Def.Definition.dUseParlour) or (Def.Definition.dUseRationCalc) or (WinData.UsingTransponderNumbers)) and
                                              (cxAnimalGridViewTransponderNo.Visible) );
   cxAnimalGridViewTransponderNo.Hidden := ( FSelectedHerdType = htBeef );
   if ( not(cxAnimalGridViewTransponderNo.Hidden) ) then
      cxAnimalGridViewTransponderNo.Hidden := ( not((Def.Definition.dUseParlour) or (Def.Definition.dUseRationCalc) or (WinData.UsingTransponderNumbers)) );

   cxAnimalGridViewCowFamily.Visible := ( (FSelectedHerdType = htDairy) and (cxAnimalGridViewCowFamily.Visible) );
   cxAnimalGridViewCowFamily.Hidden := ( FSelectedHerdType = htBeef );

   cxAnimalGridViewPDStatus.Visible := ( (FSelectedHerdType = htDairy) and (cxAnimalGridViewPDStatus.Visible) );
   cxAnimalGridViewPDStatus.Hidden := ( FSelectedHerdType = htBeef );

   cxAnimalGridViewRT.Visible := False;
   cxAnimalGridViewRT.Hidden := True;

   cxAnimalGridViewTT.Visible := False;
   cxAnimalGridViewTT.Hidden := True;

   if FSelectedHerdType = htBeef then
      begin
         cxAnimalGridViewHerdBookNo.Visible := False;
         cxAnimalGridViewHerdBookNo.Hidden := True;

         cxAnimalGridViewName.Visible := False;
         cxAnimalGridViewName.Hidden := True;
      end
   else
      begin
         cxAnimalGridViewHerdBookNo.Hidden := False; // if previous herd was beef and subsequently changed
         cxAnimalGridViewName.Hidden := False;
      end;

   //   09/12/13 [V5.2 R6.8] /MK Bug Fix - Quality Assured field should only appear for Irish BeefMan Herds.
   //   03/07/14 [V5.3 R3.1] /MK Change - Show Quality Assured field for Suckler herds - Hugh Tracey.
   cxAnimalGridViewQualityAssured.Hidden := ( not((Def.Definition.dUseBeefMan) and (FSelectedHerdType in [htSuckler, htBeef]) and (FCountry = Ireland)) );
   cxAnimalGridViewQualityAssured.Visible := ( not(cxAnimalGridViewQualityAssured.Hidden) ) and ( cxAnimalGridViewQualityAssured.Visible );

   //   03/12/19 [V5.9 R1.4] /MK Additional Feature - Only show No. Movements column if Irish Beef Herd with Beef Management module, like QA column.
   cxAnimalGridViewQANoMovements.Hidden := ( not((Def.Definition.dUseBeefMan) and (FSelectedHerdType in [htSuckler, htBeef]) and (FCountry = Ireland)) );
   cxAnimalGridViewQANoMovements.Visible := ( not(cxAnimalGridViewQANoMovements.Hidden) ) and ( cxAnimalGridViewQANoMovements.Visible );

   //   03/01/20 [V5.9 R1.6] /MK Change - Don't show A1A2 Result column if not a dairy herd.
   cxAnimalGridViewA1A2Result.Hidden := FSelectedHerdType <> htDairy;
   cxAnimalGridViewA1A2Result.Visible := ( not(cxAnimalGridViewA1A2Result.Hidden) ) and ( cxAnimalGridViewA1A2Result.Visible );

   //   23/02/11 [V4.0 R8.4] /MK Change - If System Is Ireland Then Show ConditionScore.
   if (SystemRegCountry=Ireland) then
      begin
         actOrderTags.Caption := 'Order Tags';
         btnAIMMovementEnq.Kind := cxbkStandard;
         btnAIMMovementEnq.Action := actOrderTags;
      end
   //   23/04/12 [V5.0 R5.2] /MK Change - If England Then Change Button To Movement Reg.
   else if (SystemRegCountry = England) then
      begin
         btnAIMMovementEnq.Kind := cxbkStandard;
         btnAIMMovementEnq.Action := actMovementPermits;
      end
   else if (SystemRegCountry = NIreland) then
      begin
         btnAIMMovementEnq.Caption := 'Retagging';
         btnAIMMovementEnq.Action := actOrderTags;
         btnAIMMovementEnq.Kind := cxbkStandard;
      end;

   if ( WinData.GlobalSettings.DisplayMovementFeedColsInGridView ) and ( FSelectedHerdType = htBeef ) then
      begin
         GetRegValue(Reg_DefaultPath + 'Misc\' + DataDir + '\' + 'ResetBeefGridCols', 'Reset', ResetBeefCols );

         if ResetBeefCols then   // This value is set to true when DisplayMovementFeedColsInGridView value is changed in uGlobalSettings.pas
            begin
               SetRegValue(Reg_DefaultPath + 'Misc\' + DataDir + '\' + 'ResetBeefGridCols', 'Reset', False );

               cxAnimalGridViewDaysOnFarm.Hidden := False;
               cxAnimalGridViewDaysOnFarm.Visible := True;

               //   12/12/13 [V5.2 R6.9] /MK Additional Feature - Always hide FQASDays column.
               cxAnimalGridViewPurchFQASDays.Hidden := False;
               cxAnimalGridViewPurchFQASDays.Visible := True;

               cxAnimalGridViewPurchFQAS.Hidden := False;
               cxAnimalGridViewPurchFQAS.Visible := True;

               cxAnimalGridViewSaleDate.Hidden := False;
               cxAnimalGridViewSaleDate.Visible := True;

               cxAnimalGridViewCustomerName.Hidden := False;
               cxAnimalGridViewCustomerName.Visible := True;

               cxAnimalGridViewSalePrice.Hidden := False;
               cxAnimalGridViewSalePrice.Visible := True;

               cxAnimalGridViewSaleCosts.Hidden := False;
               cxAnimalGridViewSaleCosts.Visible := True;

               cxAnimalGridViewPurchComment.Hidden := False;
               cxAnimalGridViewPurchComment.Visible := True;

               cxAnimalGridViewLotNumber.Hidden := False;
               cxAnimalGridViewLotNumber.Visible := True;

               cxAnimalGridViewSupplierName.Hidden := False;
               cxAnimalGridViewSupplierName.Visible := True;

               cxAnimalGridViewPurchPrice.Hidden := False;
               cxAnimalGridViewPurchPrice.Visible := True;

               cxAnimalGridViewPurchWeight.Hidden := False;
               cxAnimalGridViewPurchWeight.Visible := True;

               cxAnimalGridViewPurchDate.Hidden := False;
               cxAnimalGridViewPurchDate.Visible := True;

               cxAnimalGridViewPurchCosts.Hidden := False;
               cxAnimalGridViewPurchCosts.Visible := True;

               cxAnimalGridViewPurchCommission.Hidden := False;
               cxAnimalGridViewPurchCommission.Visible := True;

               cxAnimalGridViewPurchTransport.Hidden := False;
               cxAnimalGridViewPurchTransport.Visible := True;

               cxAnimalGridViewPricePerKg.Hidden := False;
               cxAnimalGridViewPricePerKg.Visible := True;

               cxAnimalGridViewColdDeadWt.Hidden := False;
               cxAnimalGridViewColdDeadWt.Visible := True;

               cxAnimalGridViewSalesGrade.Hidden := False;
               cxAnimalGridViewSalesGrade.Visible := True;

               cxAnimalGridViewGrossMargin.Hidden := False;
               cxAnimalGridViewGrossMargin.Visible := True;
            end;
      end
   else
      begin
         cxAnimalGridViewDaysOnFarm.Hidden := True;
         cxAnimalGridViewDaysOnFarm.Visible := False;

         cxAnimalGridViewPurchFQASDays.Hidden := True;
         cxAnimalGridViewPurchFQASDays.Visible := False;

         cxAnimalGridViewPurchFQAS.Hidden := True;
         cxAnimalGridViewPurchFQAS.Visible := False;

         cxAnimalGridViewSaleDate.Hidden := True;
         cxAnimalGridViewSaleDate.Visible := False;

         cxAnimalGridViewSalePrice.Hidden := True;
         cxAnimalGridViewSalePrice.Visible := False;

         cxAnimalGridViewSaleCosts.Hidden := True;
         cxAnimalGridViewSaleCosts.Visible := False;

         cxAnimalGridViewCustomerName.Hidden := True;
         cxAnimalGridViewCustomerName.Visible := False;

         cxAnimalGridViewPurchComment.Hidden := True;
         cxAnimalGridViewPurchComment.Visible := False;

         cxAnimalGridViewLotNumber.Hidden := True;
         cxAnimalGridViewLotNumber.Visible := False;

         cxAnimalGridViewSupplierName.Hidden := True;
         cxAnimalGridViewSupplierName.Visible := False;

         cxAnimalGridViewPurchPrice.Hidden := True;
         cxAnimalGridViewPurchPrice.Visible := False;

         cxAnimalGridViewPurchWeight.Hidden := True;
         cxAnimalGridViewPurchWeight.Visible := False;

         cxAnimalGridViewPurchDate.Hidden := True;
         cxAnimalGridViewPurchDate.Visible := False;

         cxAnimalGridViewPurchCosts.Hidden := True;
         cxAnimalGridViewPurchCosts.Visible := False;

         cxAnimalGridViewPurchCommission.Hidden := True;
         cxAnimalGridViewPurchCommission.Visible := False;

         cxAnimalGridViewPurchTransport.Hidden := True;
         cxAnimalGridViewPurchTransport.Visible := False;

         cxAnimalGridViewPricePerKg.Hidden := True;
         cxAnimalGridViewPricePerKg.Visible := False;

         cxAnimalGridViewColdDeadWt.Hidden := True;
         cxAnimalGridViewColdDeadWt.Visible := False;

         cxAnimalGridViewSalesGrade.Hidden := True;
         cxAnimalGridViewSalesGrade.Visible := False;

         cxAnimalGridViewGrossMargin.Hidden := True;
         cxAnimalGridViewGrossMargin.Visible := False;
      end;

   //   03/10/11 [V5.0 R1.0] /MK Change - Check If ConditionScore In Grid Cols Is Visible
   if ( FCountry = Ireland ) and ( FSelectedHerdType <> htBeef ) then
      begin
         if (cxAnimalGridViewConditionScore.Visible) then
            begin
               cxAnimalGridViewConditionScore.Visible := True;
               cxAnimalGridViewConditionScore.Hidden := False;
            end
         else
            begin
               cxAnimalGridViewConditionScore.Visible := False;
               cxAnimalGridViewConditionScore.Hidden := False;
            end;
      end
   else
      begin
         cxAnimalGridViewConditionScore.Visible := False;
         cxAnimalGridViewConditionScore.Hidden := True;
      end;

   cxAnimalGridViewPurchFQAS.Visible := ( FCountry = NIreland ) and ( cxAnimalGridViewPurchFQAS.Visible ) and ( WinData.OwnerFileFQAS.AsBoolean );
   cxAnimalGridViewPurchFQAS.Hidden := ( not((FCountry = NIreland) and (WinData.OwnerFileFQAS.AsBoolean)) );
   if ( not(cxAnimalGridViewPurchFQAS.Hidden) ) and ( FCountry = NIreland ) then
      cxAnimalGridViewPurchFQAS.Hidden := ( FSelectedHerdType <> htBeef );
   cxAnimalGridViewPurchFQASDays.Visible := ( FCountry = NIreland ) and ( cxAnimalGridViewPurchFQASDays.Visible ) and ( WinData.OwnerFileFQAS.AsBoolean );
   cxAnimalGridViewPurchFQASDays.Hidden := ( not((FCountry = NIreland) and (WinData.OwnerFileFQAS.AsBoolean)) );
   if ( not(cxAnimalGridViewPurchFQASDays.Hidden) ) and ( FCountry = NIreland ) then
      cxAnimalGridViewPurchFQASDays.Hidden := ( FSelectedHerdType <> htBeef );
   cxAnimalGridViewDaysToFQAS.Visible := ( FCountry = NIreland ) and ( cxAnimalGridViewDaysToFQAS.Visible );
   cxAnimalGridViewDaysToFQAS.Hidden := ( FCountry <> NIreland );
   if ( not(cxAnimalGridViewDaysToFQAS.Hidden) ) and ( FCountry = NIreland ) then
      cxAnimalGridViewDaysToFQAS.Hidden := ( FSelectedHerdType <> htBeef );

   //   08/12/17 [V5.7 R6.1] /MK Bug Fix - Dam AnimalNo, Dam NatID and Sire No were hidden if herd was Suckler or Beef. Changed to hide of Beef herd only - Heinz Eggert.
   cxAnimalGridViewDamAnimalNo.Visible := ( FSelectedHerdType <> htBeef ) and ( cxAnimalGridViewDamAnimalNo.Visible );
   cxAnimalGridViewDamAnimalNo.Hidden := ( FSelectedHerdType = htBeef );
   cxAnimalGridViewDamNo.Visible := ( FSelectedHerdType <> htBeef ) and ( cxAnimalGridViewDamNo.Visible );
   cxAnimalGridViewDamNo.Hidden := ( FSelectedHerdType = htBeef );
   cxAnimalGridViewSireNo.Visible := ( FSelectedHerdType <> htBeef ) and ( cxAnimalGridViewSireNo.Visible );
   cxAnimalGridViewSireNo.Hidden := ( FSelectedHerdType = htBeef );

   cxAnimalGridViewStatus.Visible := ( FSelectedHerdType = htDairy );
   cxAnimalGridViewStatus.Hidden := ( FSelectedHerdType <> htDairy );

   btnClearSelect.Visible := WinData.ActiveFilter;

   gbAnimalComments.Visible := WinData.GlobalSettings.DisplayAnimalComments;
   AnimalCommentsSplitter.Visible := gbAnimalComments.Visible;

   // Access to AIM Transactions
   actAIM31ARequest.Visible := WinData.CanMakeAIMRequests;
   actAIM31bRequest.Visible := WinData.CanMakeAIMRequests;
   actAIMMovementNotification.Visible := WinData.CanMakeAIMRequests;
   actAIMMovementEnquiry.Visible := WinData.CanMakeAIMRequests;
   actGoToCC31ACart.Visible := WinData.CanMakeAIMRequests;
   actGoToCC31BCart.Visible := WinData.CanMakeAIMRequests;
   actGoToCC31AFilter.Visible := WinData.CanMakeAIMRequests;
   actGoToCC31BFilter.Visible := WinData.CanMakeAIMRequests;
   actQueryAimAnimalDetailByBatch.Visible := WinData.CanMakeAIMRequests;

   actSyncSettings.Visible := WinData.SyncServiceIsAvailable;
   actSyncOptions.Visible := WinData.SyncServiceIsAvailable;
   btnSyncSettings.Enabled := GetSyncButtonVisibility();
   miHerdSync.Visible := WinData.SyncServiceIsAvailable;
   RemoveSyncingFromThisMachine1.Visible := TfmFarmSyncSettings.SyncConfigured(DataDir, WinData.GetSyncingHerd(), stHerd);

   btnTempMoveOut.Visible := ( WinData.GlobalSettings.ShowBlockTempMovements );
   btnTempMoveIn.Visible := ( WinData.GlobalSettings.ShowBlockTempMovements );
   if ( WinData.GlobalSettings.ShowBlockTempMovements ) then
      begin
         btnMovementsIn.Left := 206;
         btnMovementsOut.Left := 304;
         pBlockMovementsContainer.Width := 408;
      end
   else
      begin
         btnMovementsIn.Left := 10;
         btnMovementsOut.Left := 108;
         pBlockMovementsContainer.Width := 208;
      end;

   UpdateStatusBar;

   if ( FCountry = Ireland ) then
      begin
         btnBordBiaRedTrac.Width := 66;
         btnBordBiaRedTrac.Action := actBordBia;
         WinData.LoadBtnImage(StoreImages,btnBordBiaRedTrac.Glyph,0);
      end
   else
      begin
         btnBordBiaRedTrac.Width := 84;
         btnBordBiaRedTrac.Action := actRedTractor;
         WinData.LoadBtnImage(StoreImages,btnBordBiaRedTrac.Glyph,1);
      end;

   ShowLinksMenu;

   pmiDanRyanImport.Visible := ( Def.Definition.dUseDanRyanImport );

   ImportParlourData1.Visible := ( Def.Definition.dUseParlour );

   pmiReverseFilter.Visible := WinData.ActiveFilter;
   N50.Visible := pmiReverseFilter.Visible;

   pmiCreateFromFilter.Visible := ( WinData.ActiveFilter ) and ( WinData.FilteredAnimals.RecordCount > 0 );
   N54.Visible := pmiCreateFromFilter.Visible;

   ShowUpdateHerdDesignatorUtility;

   //   01/03/17 [V5.6 R6.5] /MK Change - Only show Download Installer Utility if the file doesn't exist - SP/GL request.
   DownloadKingswoodInstaller1.Visible := ( not(FileExists(ApplicationPath + cKInstallerProgram)) );
   N34.Visible := DownloadKingswoodInstaller1.Visible;

   //   02/03/17 [V5.6 R6.5] /MK Change - Only show CMMS Movement Import Utility if Kingswood Office User - SP/GL request.
   //   CMMSFileImport1.Visible := ( (DirExists('C:\Kingswd')) or (DirExists('C:\Kingswood\Delphi Development\Delphi 5\Herd')) );
   //   24/11/17 [V5.7 R4.7] /MK Change - Remove this option as system generation CMMS Import has this option built in - GL request.
   CMMSFileImport1.Visible := False;

   ShowDeletedAnimals1.Visible := WinData.HasDeletedAnimals;

   miFixAnimalLactationNumbers.Visible := ( FSelectedHerdType <> htBeef ) and ( not(WinData.AnimalLactNoFixCompleted) );

   UpdateAnimalLactations1.Visible := ( FSelectedHerdType <> htBeef );

   RemoveDuplicateAIBulls1.Visible := ( FSelectedHerdType <> htBeef ) and ( TfmDuplicateAnimals.DuplicatesFound(taAIBulls) );

   HistoricalCalving1.Visible := ( FSelectedHerdType <> htBeef );

   ResetActiveBullList.Visible := ( FSelectedHerdType <> htBeef );

   miMoveEventLactNo.Visible := ( FSelectedHerdType <> htBeef );

   ShowBordBiaEventAreaButton;

   actFeedDiary.Enabled := WinData.UsingFeedAllocation;

   //   24/07/18 [V5.8 R1.3] /MK Change - Don't show Moorepark drop-down-list from Calving if Suckler herd.
   //   16/11/20 [V5.9 R7.3] /MK Change - If its a Suckler herd only show the help drop-down-menu.
   if ( FSelectedHerdType = htDairy ) then
      btnCalving.DropDownMenu := mGroup
   else
      btnCalving.DropDownMenu := pmSuckCalvingHelp;
end;

procedure TMenuForm.SetThePanelWidths;

   function SetTheWidth(CPanel: TPanel) : Integer;
   var
      i,
      PanelWidth : Integer;
   begin
      PanelWidth := 0;
      with CPanel do
         begin
            for i := 0 to ControlCount-1 do
               begin
                  if (Controls[i] is TPanel) then
                     if (Controls[i] as TPanel).Visible then
                        PanelWidth := (Controls[i] as TPanel).Width + PanelWidth;
               end;
            Result := PanelWidth + 4;
         end;
   end;

begin

end;

procedure TMenuForm.SetUpQuery(const ReloadSQLFilter : Boolean);
var
   SelectedGroups : String;
   FilterResult : Boolean; // SP 25/09/2002:-
   FilterString : string;

   procedure InherdAnimalsOnly;
   begin
      // Never alter this first line to go over 2 line as the Mass Events uses it
      with WinData.AnimalFileByID.SQL do
         begin
            Clear;
            Add('SELECT DISTINCT (A.ID), A.* FROM Animals A    ');
            Add('WHERE (AnimalDeleted=FALSE)');
            Add('AND   (InHerd=TRUE)        ');
            if WinData.UserDefaultHerdID > 0 then
               Add('AND (HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')')
            else
               Add('AND (HerdID <> ' + IntToStr(WinData.NONEHerdID) + ')');
         end;
   end;

   procedure HandleError;
   begin
      ShowMessage('Unable to load filters, contact Kingswood');
      InherdAnimalsOnly;
      ApplySortToAnimalFileByIdAndOpenQuery();
   end;

   procedure DoSQLFilter;
   var
      EBIFilterBySexValue : String;
   begin
      with WinData.AnimalFileByID.SQL do
         begin
            Clear;
            if (SelectedGroups <> '') then
               Add('SELECT DISTINCT (A.ID), A.* FROM Animals A, GrpLinks G')
            else
               Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');

            if Length(fFilters.InnerJoinSQLEvents) > 0 then
               begin
                  Strings[0] := Strings[0] + ' , Events E';
                  Add(fFilters.InnerJoinSQLEvents);
                  if Length(fFilters.EventDateRangeSQL ) > 0 then
                     Add(fFilters.EventDateRangeSQL);
                  Add('AND (AnimalDeleted=FALSE)');
               end
            else
               Add('WHERE (AnimalDeleted=FALSE) ');

            if (SelectedGroups <> '') then
               begin
                  Add('AND ((A.ID = G.AnimalID)');
                  Add('AND  (G.GroupID IN ' + SelectedGroups + '))');
               end;

            if fFilters.BreedsSQL <> '' then
               Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');

            if FSQLFilter.SQLOp <> sqlBreedingStock then
               begin
                  if Length(fFilters.SexSQL) > 0 then
                     Add(fFilters.SexSQL);
               end;

            // Check the Filter Forms info
            if ( Length(fFilters.DOBSQL) > 0 ) then
               Add(fFilters.DOBSQL)
            else if ( Length(fFilters.AgeInMonthsFilterSQL) > 0 ) then
               Add(fFilters.AgeInMonthsFilterSQL)
            else if ( Length(fFilters.DaysOnFarmSQL) > 0 ) then
               Add(fFilters.DaysOnFarmSQL);

            if Length(fFilters.LactSQL) > 0 then
               Add(fFilters.LactSQL);

            Add('AND A.ID IN (SELECT DISTINCT F.AnimalID FROM  '+ FSQLFilter.FilteredTableName + ' F )');

            if fFilters.FilterByConditionScore then
               begin
                  FilterString := IntArrayToSQLInString(HerdLookup.GetAnimalsWithConditionScoreBetween(WinData.UserDefaultHerdID,
                                                                                                       fFilters.FilterTable.FieldByName('CondScoreFrom').AsFloat,
                                                                                                       fFilters.FilterTable.FieldByName('CondScoreTo').AsFloat));

                  if FilterString <> '()' then
                     Add('AND A.ID IN ' + FilterString )
                  else
                     Add('AND A.ID IN (0)')
               end;

            if fFilters.FilterByEBI then
               begin
                  if (fFilters.cbFemale.Checked and not fFilters.cbBull.Checked) then
                     EBIFilterBySexValue := 'Female'
                  else if (not fFilters.cbFemale.Checked and fFilters.cbBull.Checked) then
                     EBIFilterBySexValue := 'Bull';

                  FilterString := IntArrayToSQLInString(
                        HerdLookup.GetAnimalsWithEBIBetween(WinData.UserDefaultHerdID,
                              fFilters.FilterTable.FieldByName('EBIFrom').Value,
                              fFilters.FilterTable.FieldByName('EBITo').Value,
                              EBIFilterBySexValue));

                  if FilterString <> '()' then
                     Add('AND A.ID IN ' + FilterString )
                  else
                     Add('AND A.ID IN (0)')
               end;

            if fFilters.FilterByMilkYield then
               begin
                  FilterString := IntArrayToSQLInString(
                     HerdLookup.GetAnimalsWithMilkYieldBetween(WinData.UserDefaultHerdID,
                        fFilters.FilterTable.FieldByName('MilkYieldFrom').Value,
                        fFilters.FilterTable.FieldByName('MilkYieldTo').Value));

                  if FilterString <> '()' then
                     Add('AND A.ID IN ' + FilterString )
                  else
                     Add('AND A.ID IN (0)')
               end;

            if fFilters.FilterByRatCalcMilkYield then
               begin
                  FilterString := IntArrayToSQLInString(
                     HerdLookup.GetAnimalsWithRatCalcMilkYieldBetween(WinData.UserDefaultHerdID,
                        fFilters.FilterTable.FieldByName('MilkYieldFrom').Value,
                        fFilters.FilterTable.FieldByName('MilkYieldTo').Value));

                  if FilterString <> '()' then
                     Add('AND A.ID IN ' + FilterString )
                  else
                     Add('AND A.ID IN (0)')
               end;

            if fFilters.FilterByOverallGainPerDay then
               begin
                  FilterString := IntArrayToSQLInString(
                     HerdLookup.GetAnimalsWithOverallGainPerDayBetween(WinData.UserDefaultHerdID,
                        fFilters.FilterTable.FieldByName('OverallGainPerDayFrom').Value,
                        fFilters.FilterTable.FieldByName('OverallGainPerDayTo').Value));

                  if FilterString <> '()' then
                     Add('AND A.ID IN ' + FilterString )
                  else
                     Add('AND A.ID IN (0)')
               end;

            if fFilters.FilterBySCC then
               begin
                  FilterString := IntArrayToSQLInString(
                     HerdLookup.GetAnimalsWithSCCBetween(WinData.UserDefaultHerdID,
                        fFilters.FilterTable.FieldByName('SCCFrom').Value,
                        fFilters.FilterTable.FieldByName('SCCTo').Value));

                  if FilterString <> '()' then
                     Add('AND A.ID IN ' + FilterString )
                  else
                     Add('AND A.ID IN (0)')
               end;

            if fFilters.FilterByA1A2Result then
               FilterString := fFilters.A1A2ResultSQL;
         end;
   end;

var
   SqlText : String;
   OldAnimalFileByIDSqlText : String;
   FilteredAnimalIds : TIntegerArray;

   ConditionScoreAnimalIds : TIntegerArray;
   arrayIndex, i : Integer;
   EBIFilterBySexValue : string;
begin
   SetLength(FilteredAnimalIds, 0);
   { SP 25/09/2002: New Filters Added.
                    SQL layout and syntax changed }
   Update;

   WinData.GetSelectedGroups(SelectedGroups);

   // open form for viewing (add = false, view = true)
   cxAnimalGridView.DataController.BeginFullUpdate;
   WinData.AnimalFileByID.DisableControls;
   try

   // Save the current Animals ID
   if ( not Assigned(OnActivate)) and (WinData.AnimalFileByID.Active) then // form is displayed on screen.
      CurrAnimal := WinData.AnimalFileByIdID.AsInteger
   else
      CurrAnimal := 0;

   if ReloadSQLFilter then
      with WinData do
         begin
            OldAnimalFileByIDSqlText := AnimalFileByID.SQL.Text;
            AnimalFileByID.SQL.Clear;

            { Populate SearchNatID Field, strip NatID string of all None Alpha/Num Chars, allows user to search on natid without spaces/hyphens etc.  }
            AddSearchNatIDData;

            if WinData.ActiveFilter then
               begin
                  // SP 25/09/2002:-
                  if FSQLFilter = nil then
                     FSQLFilter := TSQLFilter.Create;
                  FSQLFilter.HerdID   := WinData.UserDefaultHerdID;

                  if ( fFilters.ShowAnimalsOnStockDate ) then
                     begin
                        FSQLFilter.SQLOp := sqlAllStock;
                        FSQLFilter.StockDate := fFilters.dStockDate;
                        if FSQLFilter.OpenSQL(cAllStockOnDate) then
                           begin
                              DoSQLFilter;
                              ApplySortToAnimalFileByIdAndOpenQuery();
                           end
                        else
                           HandleError;
                     end
                  else if ( fFilters.ShowAnimalsBornIntoHerd ) then
                      begin
                         //   07/11/12 [V5.1 R0.8] /MK Bug Fix - Program was not setting FSQLFilter.SQLOp for BornIntoHerd.
                         FSQLFilter.SQLOp := sqlBornIntoHerd;
                         if FSQLFilter.OpenSQL(cBornIntoHerd) then
                            begin
                               DoSQLFilter;
                               ApplySortToAnimalFileByIdAndOpenQuery();
                            end
                         else
                            HandleError;
                     end
                  else
                     begin
                        if ( fFilters.FemaleStatus <> fsNone) then
                           begin
                              case fFilters.FemaleStatus of
                                 fsNotServed    : FilteredAnimalIds := GetAnimalIdsBySqlFilter(cNotServed, FAnimalFilterArray);
                                 fsServedNotPDd : FilteredAnimalIds := GetAnimalIdsBySqlFilter(cServedNotPDd, FAnimalFilterArray);
                                 fsNotPregnant  : FilteredAnimalIds := GetAnimalIdsBySqlFilter(cNotPregnant, FAnimalFilterArray);
                                 fsPregnant     : FilteredAnimalIds := GetAnimalIdsBySqlFilter(cPregnant, FAnimalFilterArray);
                                 fsServedCount  : FilteredAnimalIds := GetAnimalIdsBySqlFilter(cServedCount, FAnimalFilterArray);
                              end;
                           end;

                        if Length(fFilters.AIBullSQL) > 0 then
                           begin
                              AnimalFileByID.SQL.Clear;
                              AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
                              AnimalFileByID.SQL.Add('INNER JOIN BullSemenStk B ON (B.AnimalID=A.ID)');
                              AnimalFileByID.SQL.Add('WHERE (A.AnimalDeleted=FALSE)');
                              AnimalFileByID.SQL.Add('AND   (A.Sex="'+cSex_Bull+'")');
                              AnimalFileByID.SQL.Add('AND   (B.InUse = True)');
                              AnimalFileByID.SQL.Add('AND   (A.Breeding = True)');
                              if fFilters.BreedsSQL <> '' then
                                 AnimalFileByID.SQL.Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');

                              ApplySortToAnimalFileByIdAndOpenQuery();
                           end
                        else if Length(fFilters.RetagSQL) > 0 then
                           begin
                              AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
                              AnimalFileByID.SQL.Add('LEFT JOIN Afdoa AF ON (AF.AID=A.ID)');
                              AnimalFileByID.SQL.Add(fFilters.RetagSQL);
                              AnimalFileByID.SQL.Add('AND (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
                              AnimalFileByID.SQL.Add('AND (A.AnimalDeleted=FALSE)');
                              AnimalFileByID.SQL.Add('AND (InHerd=TRUE)');
                              if fFilters.BreedsSQL <> '' then
                                 AnimalFileByID.SQL.Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');
                              if (Length(fFilters.LactSQL) > 0) then
                                 AnimalFileByID.SQL.Add(fFilters.LactSQL);
                              ApplySortToAnimalFileByIdAndOpenQuery();
                           end
                        else if Length(fFilters.LeftHerdSQL) > 0 then
                           begin
                              AnimalFileByID.SQL.Clear;
                              AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
                              AnimalFileByID.SQL.Add('WHERE A.ID IN (SELECT E.AnimalID FROM Events E WHERE E.EventType = '+IntToStr(CSaleDeathEvent)+ ')');
                              AnimalFileByID.SQL.Add('AND (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
                              AnimalFileByID.SQL.Add('AND (A.AnimalDeleted=FALSE)');
                              if fFilters.BreedsSQL <> '' then
                                 AnimalFileByID.SQL.Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');

                              ApplySortToAnimalFileByIdAndOpenQuery();
                           end
                        else if Length(fFilters.NoneHerdSQL) > 0 then
                           begin
                              AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
                              AnimalFileByID.SQL.Add(fFilters.NoneHerdSQL);
                              AnimalFileByID.SQL.Add('AND (A.AnimalDeleted=FALSE)');
                              if fFilters.BreedsSQL <> '' then
                                 AnimalFileByID.SQL.Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');

                              if (Length(fFilters.LactSQL) > 0) then
                                 AnimalFileByID.SQL.Add(fFilters.LactSQL);
                              ApplySortToAnimalFileByIdAndOpenQuery();
                           end
                        else
                           begin
                              AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');

                              if (SelectedGroups <> '') then
                                 AnimalFileByID.SQL.Add(',GrpLinks G');

                              //   26/07/12 [V5.0 R8.1] /MK Bug Fix - Needed to add Left Join for Events as filter not working correctly for events.
                              if (Length(fFilters.InnerJoinSQLEvents) > 0) then
                                 AnimalFileByID.SQL.Add('LEFT JOIN Events E On (E.AnimalID = A.ID)');

                              if ((Length(fFilters.DairySQL) > 0) or (Length(fFilters.BeefSQL) > 0)) then
                                 AnimalFileByID.SQL.Add('LEFT JOIN Breeds B On (B.ID=A.PrimaryBreed) ');

                              if Length(fFilters.InnerJoinSQLEvents) > 0 then
                                 begin
                                    AnimalFileByID.SQL.Add(fFilters.InnerJoinSQLEvents);
                                    if Length(fFilters.EventDateRangeSQL ) > 0 then
                                       AnimalFileByID.SQL.Add(fFilters.EventDateRangeSQL);
                                    AnimalFileByID.SQL.Add('AND (AnimalDeleted=FALSE)');
                                 end
                              else
                                 AnimalFileByID.SQL.Add('WHERE (AnimalDeleted=FALSE)');

                              if fFilters.BreedsSQL <> '' then
                                 AnimalFileByID.SQL.Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');

                              if ((Length(fFilters.NonBreedingSQL) > 0) AND (Length(fFilters.BreedingSQL) > 0)) then
                                 AnimalFileByID.SQL.Add('AND A.Breeding IS NOT NULL ')
                              else if (Length(fFilters.BreedingSQL) > 0)  then
                                 AnimalFileByID.SQL.Add(fFilters.BreedingSQL)
                              else if (Length(fFilters.NonBreedingSQL) > 0) then
                                 AnimalFileByID.SQL.Add(fFilters.NonBreedingSQL);

                              if ((Length(fFilters.DairySQL) > 0) AND (Length(fFilters.BeefSQL) > 0)) then
                                 AnimalFileByID.SQL.Add('AND B.EligibleforPremium IS NOT NULL ')
                              else if (Length(fFilters.DairySQL) > 0) then
                                 AnimalFileByID.SQL.Add(fFilters.DairySQL)
                              else if (Length(fFilters.BeefSQL) > 0) then
                                 AnimalFileByID.SQL.Add(fFilters.BeefSQL);

                              if (SelectedGroups <> '') then
                                 begin
                                    AnimalFileByID.SQL.Add('AND ((A.ID = G.AnimalID)');
                                    AnimalFileByID.SQL.Add('AND  (G.GroupID IN ' + SelectedGroups + '))');
                                 end;

                              if ( NOT WinData.ShowAllAnimals ) And ( NOT fFilters.ShowSales ) then
                                 AnimalFileByID.SQL.Add('AND (InHerd=TRUE)');
                              if WinData.UserDefaultHerdID > 0 then
                                 AnimalFileByID.SQL.Add('AND (HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')')
                              else if NOT WinData.ShowAllAnimals then
                                 AnimalFileByID.SQL.Add('AND (HerdID <> ' + IntToStr(WinData.NONEHerdID) + ')');

                              // Check the Filter Forms info
                              if Length(fFilters.SexSQL) > 0 then
                                 AnimalFileByID.SQL.Add(fFilters.SexSQL);

                              // Check the Filter Forms info
                              if ( Length(fFilters.DOBSQL) > 0 ) then
                                 AnimalFileByID.SQL.Add(fFilters.DOBSQL)
                              else if ( Length(fFilters.AgeInMonthsFilterSQL) > 0 ) then
                                 AnimalFileByID.SQL.Add(fFilters.AgeInMonthsFilterSQL)
                              else if ( Length(fFilters.DaysOnFarmSQL) > 0 ) then
                                 AnimalFileByID.SQL.Add(fFilters.DaysOnFarmSQL);

                              // Check the Filter Forms info for Lactation Number
                              if Length(fFilters.LactSQL) > 0 then
                                 AnimalFileByID.SQL.Add(fFilters.LactSQL);

                              // Add Condition Score Events To Filter
                              if fFilters.FilterByConditionScore then
                                 begin
                                    FilterString := IntArrayToSQLInString(HerdLookup.GetAnimalsWithConditionScoreBetween(WinData.UserDefaultHerdID,
                                                     fFilters.FilterTable.FieldByName('CondScoreFrom').AsFloat,
                                                     fFilters.FilterTable.FieldByName('CondScoreTo').AsFloat));

                                    if FilterString <> '()' then
                                       AnimalFileByID.SQL.Add('AND A.ID IN ' + FilterString )
                                    else
                                       AnimalFileByID.SQL.Add('AND A.ID IN (0)')
                                 end;

                               if fFilters.FilterByEBI then
                                  begin
                                     if (fFilters.cbFemale.Checked and not fFilters.cbBull.Checked) then
                                        EBIFilterBySexValue := 'Female'
                                     else if (not fFilters.cbFemale.Checked and fFilters.cbBull.Checked) then
                                        EBIFilterBySexValue := 'Bull';
                                     FilterString := IntArrayToSQLInString(
                                           HerdLookup.GetAnimalsWithEBIBetween(WinData.UserDefaultHerdID,
                                                 fFilters.FilterTable.FieldByName('EBIFrom').Value,
                                                 fFilters.FilterTable.FieldByName('EBITo').Value,
                                                 EBIFilterBySexValue));
                                     if FilterString <> '()' then
                                        AnimalFileByID.SQL.Add('AND A.ID IN ' + FilterString )
                                     else
                                        AnimalFileByID.SQL.Add('AND A.ID IN (0)')
                                  end;

                               if fFilters.FilterByMilkYield then
                                  begin
                                     FilterString := IntArrayToSQLInString(
                                           HerdLookup.GetAnimalsWithMilkYieldBetween(WinData.UserDefaultHerdID,
                                                 fFilters.FilterTable.FieldByName('MilkYieldFrom').Value,
                                                 fFilters.FilterTable.FieldByName('MilkYieldTo').Value));

                                     if FilterString <> '()' then
                                        AnimalFileByID.SQL.Add('AND A.ID IN ' + FilterString )
                                     else
                                        AnimalFileByID.SQL.Add('AND A.ID IN (0)')
                                  end;

                               if fFilters.FilterByRatCalcMilkYield then
                                  begin
                                     FilterString := IntArrayToSQLInString(
                                           HerdLookup.GetAnimalsWithRatCalcMilkYieldBetween(WinData.UserDefaultHerdID,
                                                 fFilters.FilterTable.FieldByName('MilkYieldFrom').Value,
                                                 fFilters.FilterTable.FieldByName('MilkYieldTo').Value));
                                     if FilterString <> '()' then
                                        AnimalFileByID.SQL.Add('AND A.ID IN ' + FilterString )
                                     else
                                        AnimalFileByID.SQL.Add('AND A.ID IN (0)')
                                  end;

                               if fFilters.FilterByOverallGainPerDay then
                                  begin
                                     FilterString := IntArrayToSQLInString(
                                           HerdLookup.GetAnimalsWithOverallGainPerDayBetween(WinData.UserDefaultHerdID,
                                                 fFilters.FilterTable.FieldByName('OverallGainPerDayFrom').Value,
                                                 fFilters.FilterTable.FieldByName('OverallGainPerDayTo').Value));

                                     if FilterString <> '()' then
                                        AnimalFileByID.SQL.Add('AND A.ID IN ' + FilterString )
                                     else
                                        AnimalFileByID.SQL.Add('AND A.ID IN (0)')
                                  end;

                               if fFilters.FilterBySCC then
                                  begin
                                     FilterString := IntArrayToSQLInString(
                                        HerdLookup.GetAnimalsWithSCCBetween(WinData.UserDefaultHerdID,
                                           fFilters.FilterTable.FieldByName('SCCFrom').Value,
                                           fFilters.FilterTable.FieldByName('SCCTo').Value));

                                     if FilterString <> '()' then
                                        AnimalFileByID.SQL.Add('AND A.ID IN ' + FilterString )
                                     else
                                        AnimalFileByID.SQL.Add('AND A.ID IN (0)')
                                  end;

                              if (fFilters.FemaleStatus <> fsNone) then
                                 begin
                                    if (length(FilteredAnimalIds) = 0) then
                                       begin
                                          SetLength(FilteredAnimalIds,1);
                                          FilteredAnimalIds[0] := -1;
                                       end;
                                    WinData.AnimalFileByID.SQL.Add('AND A.ID IN '+IntArrayToSQLInString(FilteredAnimalIds));
                                 end
                              else
                                 if ( Length(FAnimalFilterArray) > 0 ) and ( FQuickFilter <> qfNone ) then
                                    WinData.AnimalFileByID.SQL.Add('AND A.ID IN '+IntArrayToSQLInString(FAnimalFilterArray));

                              //   26/03/12 [V5.0 R4.5] /MK Change - Check For New Option Not In Group Within Group Grid.
                              if ( WinData.FFilterByNotInGroup ) then
                                 begin
                                    WinData.AnimalFileByID.SQL.Add('AND A.ID NOT IN (SELECT AnimalID FROM '+WinData.GroupLinks.TableName+') ');
                                 end;

                              if ( fFilters.FilterByA1A2Result ) then
                                 WinData.AnimalFileByID.SQL.Add(fFilters.A1A2ResultSQL);

                              ApplySortToAnimalFileByIdAndOpenQuery();

                           end;

                        // Set ActiveFilter To True
                        pmiCurrentHerd.Visible := True;
                        ClearFilter1.Visible := True;
                     end;

               end
            else if ( WinData.UserDefaultHerdID = AllHerds ) then
                LoadAllAnimals(False)
            else
               begin
                  InherdAnimalsOnly;
                  ApplySortToAnimalFileByIdAndOpenQuery();
               end;
         end
   else
      begin
         if FQuickFilter in [qfDairyHeifersThisYear, qfDairyHeifersLastYear, qfBeefHeifersThisYear, qfBeefHeifersLastYear,
                             qfAllHeifersThisYear, qfAllHeifersLastYear, qfMaleCalvesThisYear, qfMaleCalvesLastYear,
                             qfAllCalvesThisYear, qfAllCalvesLastYear, qfDeletedAnimals] then
            begin
               DoFilter( FQuickFilter, btnShowAnimalsOptions.Caption );
            end
         else
            begin
               OldAnimalFileByIDSqlText := Windata.AnimalFileByID.SQL.Text;
               Windata.AnimalFileByID.SQL.Clear;
               Windata.AnimalFileByID.SQL.Text := OldAnimalFileByIDSqlText;
               WinData.AnimalFileByID.Prepare;
               WinData.AnimalFileByID.Open;
            end;
      end;
   finally
      try
         cxAnimalGridView.DataController.EndFullUpdate;
         Windata.AnimalFileByID.EnableControls;
      except
         on e : Exception do
            begin
               //ResetAnimalGridColumns;
               //RestoreAnimalGridView;
            end;
      end;

      FocusAnimalOnMainGrid(CurrAnimal);
   end;

   if WinData.ActiveFilter then
      begin
         btnTopFilter.Caption := 'Fi&lter On ';
         btnTopFilter.Font.Size := 8;
         btnTopFilter.Font.Style := [fsBold,fsItalic];
         btnTopFilter.Font.Color := clBlue;
      end
   else if cxAnimalGridView.DataController.Filter.FilterText <> '' then
      begin
         cxAnimalGridView.DataController.Filter.Active := True;
      end
   else
      begin
         btnTopFilter.Caption := 'Fi&lter';
         btnTopFilter.Font.Size := 8;
         btnTopFilter.Font.Style := [];
         btnTopFilter.Font.Color := clBlack;
      end;

   pmiReverseFilter.Visible := WinData.ActiveFilter;
   N50.Visible := pmiReverseFilter.Visible;

   pmiCreateFromFilter.Visible := ( WinData.ActiveFilter ) and ( WinData.FilteredAnimals.RecordCount > 0 );
   N54.Visible := pmiCreateFromFilter.Visible;

   SetupServicesBtn;

   Update;
end;

procedure TMenuForm.FormActivate(Sender: TObject);
var
   b : Boolean;
begin
   OnActivate := nil;

   //   17/04/18 [V5.7 R8.8] /MK Bug Fix - Removed Invalidate and Update as Repaint already calls these Windows procedures.
   //   13/09/18 [V5.8 R2.8] /MK Change - Added try except around repaint because on one user's machine, since the above change, the unspecified error appeared - Scott (Fletchers).
   try
      Repaint;
   except
      ApplicationLog.LogError('Unable to do Repaint');
   end;

   // 17/07/2012 SP - close the main form if program cannot open due to db errors
   if (not WinData.AnimalFileById.Active) then
      begin
         Close;
         Exit;
      end;

   BuildSearchColumnList;

   Caption := 'Kingswood Herd Management - '+HerdVerNo;

   pSearch.Height := 89;
   Bevel1.Width := PSearch.Width-1;

   CheckPhoneLinkOnStartup.Checked := WinData.SearchPhoneLink; // SP 27/09/2002.
   ShowHintsatStartup.Checked := WinData.ShowHints;

   case WinData.PhoneLinkType of
      plNOKIA   : NokiaLink1.Checked := TRUE;
      plSIEMENS : SiemensGSMModule1.Checked := TRUE
   else
      begin
         NokiaLink1.Checked := False;
         SiemensGSMModule1.Checked := False;
      end;
   end;

   //   08/10/18 [V5.8 R3.0] /MK Change - Removed EuroCheck as no longer required.
   {
   Application.ProcessMessages;
   WinData.EuroCheck;
   }

   if ( FSelectedHerdType <> htBeef ) and  ( WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = Ireland ) then
      WinData.CheckAISireRegister;

   Update;

   RemoveAnimalNoDuplicates1.Visible := TfmDuplicateAnimals.DuplicatesFound(taAllAnimals);
   RemoveDuplicateAIBulls1.Visible := TfmDuplicateAnimals.DuplicatesFound(taAIBulls);

   WinData.CreatePhoneLinkEvents;
   Update;

   WinData.CreatePDAEvents(False);
   Update;

   //   30/10/12 [V5.1 R0.7] /MK Additional Feature - Create ActionReminderList for new reminders screen.
   ActionReminderList := TKActionList.Create;
   Update;

   //   30/10/12 [V5.1 R3.1] /MK Additional Feature - Show reminders screen.
   TfmStartupReminders.ShowTheForm;
   Update;

   //   30/10/12 [V5.1 R3.1] /MK Additional Feature - Create ActionReminderList after new reminder screen closes.
   FreeAndNil(ActionReminderList);
   Update;

   //   30/08/12 [V5.0 R8.7] /MK Additional Feature - Show new unit uDeptLinkAdvert if Country is Ireland.
   //   22/10/12 [V5.1 R0.5] /MK Additional Feature - Show uDeptLinkAdvert if AIMClient does not exist.
   if ( WinData.SystemRegisteredCountry = Ireland ) and ( not(AIMClient.ClientExists) ) then
      begin
         TfmDeptLinkAdvert.Show;
         Update;
      end;

   //   02/12/15 [V5.5 R1.4] /MK Additional Feature - Show new uKingswoodAppInfo screen if user does not have FarmSync and ShowKingswoodAppInfo registry value is True.
   if ( not(WinData.SyncServiceIsAvailable) ) then
      if ( WinData.GlobalSettings.DisplayKingswoodAppInfoScreen ) then
         TfmKingswoodAppInfo.ShowTheForm;
   Update;

   //   15/10/18 [V5.8 R3.1] /MK Additional Feature - Show uHerdNewFeatures depending on whether user has turned off these preferences.
   if ( WinData.GlobalSettings.ShowAIMSyncFeature ) or ( WinData.GlobalSettings.ShowVetLinkFeature ) then
      begin
         TfmHerdNewFeatures.ShowTheForm;
         Update;
      end;

   //   25/10/11 [V5.0 R1.6] /MK Change - If HerdType = Beef Then IAD Crush Screen If Dairy Then New AnimalBrowser Screen.
   if ( WinData.GlobalSettings.DisplayCrushScreen ) then
      if ( not( Def.Definition.dUseManCal ) ) and ( FSelectedHerdType = htBeef ) and ( Def.Definition.dUseCrush ) then
         begin
            TfmCrushBarCode.Show(True);
            SetUpQuery;
            Update;
         end;

   //   10/03/14 [V5.2 R8.9] /MK Additional Feature - Check to see if cows were served after a positive PD after main grid opens.
   if ( FSelectedHerdType = htDairy ) then
      begin
         fmCowsServedAfterPD.ShowTheForm;
         Update;
      end;

   //   06/11/14 [V5.3 R8.9] /MK Change - If ICBF events have been reset to be resent then show ICBF screen.
   if ( WinData.FICBFEventsToBeResent ) then
      begin
         uICBFEventExport.ShowTheForm;
         Update;
      end;

   //   15/09/15 [V5.4 R8.5] /MK Additional Feature - Store the amount of sync data (animals, events, medicines, etc) when the program opens.
   if ( TfmFarmSyncSettings.SyncConfigured(DataDir, WinData.GetSyncingHerd(), stHerd) ) and
      ( TfmFarmSyncSettings.SyncOnProgramStartup(DataDir, stHerd, WinData.UserDefaultHerdId) ) then
         begin
            actSyncData.Execute;
            WinData.SetSessionStateCount(True);
            Update;
         end;

   EnableCartSpaceBar := False;

   MenuForm.sbExit.Enabled := True;

   //   03/03/15 [V5.4 R2.8] /MK Additional Feature - Check if bulls have calving events.
   if ( TCalvingsFix.HasMaleCalvings(WinData.KingData.Directory) ) then
      begin
         MessageDlg('A discrepancy in the calvings has been found.'+cCRLF+
                    'Contact Kingswood.',mtError,[mbOK],0);
         Update;
      end;

   if ( Def.Definition.dUseParlour ) then
      begin
         ShowParlourEvents;
         Update;
      end;

   pmiClearSoldAnimalTransponders.Visible := Def.Definition.dUseParlour;

   //   07/04/16 [V5.5 R4.9] /MK Bug Fix - Check to see if the Country is Ireland and the HerdType is Dairy or Suckler.
   if ( WinData.SystemRegisteredCountry = Ireland ) and ( FSelectedHerdType <> htBeef ) then
      if ( WinData.AnimalLactNoNeedsCorrecting ) then
         begin
            MessageDlg('There may be a problem with incorrect lactation numbers in your herd.'+cCRLF+
                       'Please contact Kingswood Computing at +353-1-4599491 at your ealiest convenience.',mtWarning,[mbOK],0);
            Update;
         end;

   HerdLookup.qGroupsNotUsed.Open;
   DeleteGroupsNotUsed.Visible := ( HerdLookup.qGroupsNotUsed.RecordCount > 0 );
   HerdLookup.qGroupsNotUsed.Close;

   Update;
   FFormShowing := True;
end;

procedure TMenuForm.SalesButton1Click(Sender: TObject);
var
   CallSetupQuery : Boolean;
begin
   // ensure animal has breed assigned before allowing sale/death event.
   If WinData.AnimalFileByIDPrimaryBreed.AsInteger <= 0 then
      begin
         MessageDLG('Animal Breed must be entered before entering Sale/Death Event',mtWarning,[mbOK],0);
         Abort;
      end;

   if NOT WinData.HasSaleDeath(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger) then
      begin
         if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                        WinData.AnimalFileByIDHerdID.AsInteger,
                                        WinData.AnimalFileByIDAnimalNo.AsString,
                                        WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
         begin
            // Need to locate a Sales Record for an animal if it exists.
            if WinData.Events.Locate('AnimalId;EventType',VarArrayOf([WinData.AnimalFileByIDID.AsVariant, cSaleDeathEvent]),[] ) then
               CallSetupQuery := uSalesDeaths.ShowSalesDeaths(AmendSaleDeath, False)  //Changed Procedure call to include PreSale Boolean
            else   // Create a new Sales record
               CallSetupQuery := uSalesDeaths.ShowSalesDeaths(AddSale, False);   //Changed Procedure call to include PreSale Boolean
            if CallSetupQuery then
               SetUpQuery;
         end;
      end
   else
      MessageDlg('Sale/Death event already exists',mtInformation,[mbOK],0);
end;

procedure TMenuForm.sbMilkRec1Click(Sender: TObject);
var
   FileName : string;
   NoOfAttachments : Integer;
   FileCount : Integer;
   FileSaved : Boolean;
begin
   CheckSelectedHerd;
   if ( (WinData.SystemRegisteredCountry = Ireland) AND (WinData.ICBFMMR) ) then
      begin
          FileCount :=  0;
          if WinData.GlobalSettings.DownloadMailAttachments then
            begin
               if ( not(WinData.FAttachmentsDownloaded) ) then
                  CheckAttachments;

               FileName := TfmFileAttachmentImport.execute(itICBF, cbDefaultHerd.Text, FileCount);
               if (FileExists(FileName)) then
                  begin
                     TfMilkRec.ImportICBFFile(FileName,FileSaved);
                  end;
            end
         else
            begin
               uMilkRec.CreateAndShow(1,FileSaved);
            end;
      end
   else
      uMilkRec.CreateAndShow(0,FileSaved);
end;

procedure TMenuForm.bBackUpClick(Sender: TObject);
begin
   TfmDataBackup.execute
end;

procedure TMenuForm.bSystemClick(Sender: TObject);
begin
   uSystem.ShowForm(Sys);
end;

procedure TMenuForm.cbDefaultHerd1Change(Sender: TObject);
begin
   Enabled := False;
   Screen.Cursor := crHourGlass;
   Update;
   try
   if cbDefaultHerd.Value = '' then Exit;
   if not AllAnimalsShowing then
      begin
         if WinData.UserDefaultHerdID <> StrToInt(cbDefaultHerd.Value) then
            begin
               WinData.UserDefaultHerdID := StrToInt(cbDefaultHerd.Value);
               //WinData.UserDefaultHerdID;  // Set the UserHerdType
               if sbAccounts.Enabled then
                  LoadAccountsCompanies();
               SetUpQuery(True);
            end;
         SetupForm;
      end;
   finally
      Enabled := True;
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.bBreeding2Exit(Sender: TObject);
begin
   (Sender as Tbitbtn).font.Color := clblack;
   (Sender as Tbitbtn).font.Style := [];
end;

procedure TMenuForm.ReIndex1Click(Sender: TObject);
begin
   ReIndexAll(True);
   WinData.OpenAndCheckTables;
   WinData.AnimalFileByID.Active := True;
end;

procedure TMenuForm.BovineHerdRegister1Click(Sender: TObject);
begin
   EnableBtn(Sender);;
   try
      RefreshForm;
      WinData.CreateAndShowForm(TCowRepfilter);
   finally
      EnableBtn(Sender);;
   end;
end;

procedure TMenuForm.StockOnHand1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      StockInHerdFilt.ShowForm( StockOnHand );
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.PurchaseSalesAnalysis1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      StockInHerdFilt.ShowForm(PurchSales);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.PremiumReport1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      StockInHerdFilt.ShowForm(Premiums);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.VeterinaryTreatments1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      HealthFilterU.ReportType := rtMediTreat;
      try
         Application.CreateForm(THeatlthFilter, HeatlthFilter);
         HeatlthFilter.ShowModal;
      except
         ShowMessage('Cannot show this Form - close program and re-boot');
      end;
   finally
      HeatlthFilter.Free;
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.VeterinaryPurchases1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      try
         RefreshForm;
         HealthFilterU.ReportType := rtMediFeedPurch;
         Application.CreateForm(THeatlthFilter, HeatlthFilter);
         HeatlthFilter.ShowModal;
      except
         ShowMessage('Cannot show this Form - close program and re-boot');
      end;
   finally
      HeatlthFilter.Free;
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.CalfRegistration1Click(Sender: TObject);
begin
   uCalfRegFlt.ShowForm;
end;

procedure TMenuForm.HeatsAndServices1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uHeatServiceFilt.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.BullsUsedInHerd1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      BullReportsFilt.ShowForm(2);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.BrowseSireRegister1Click(Sender: TObject);
var
   id : Integer;
   CallSetupQuery : Boolean;

   procedure ShowDairySireRegister;
   begin
      //   09/05/16 [V5.5 R6.1] /MK Change - As program now moves the sires.db into the web/TempBackup folder when the user is
      //                                     taking a backup, the program needs to check for the sires.db in the database.
      if ( not(FileExists(WinData.KingData.Directory+'Sires.db')) ) then
         begin
            MessageDlg('Sires table is missing. Click New Version to download the Sire Register.',mtError,[mbOK],0);
            Exit;
         end;
      if ( not(WinData.Sires.Active) ) then
         WinData.Sires.Open;
      CallSetupQuery := True;
      WinData.CreateAndShowForm(TBrowseSireRegister)
   end;

begin
   CallSetupQuery := False;
   EnableBtn(Sender);
   try
      id := WinData.AnimalFileByIDID.AsInteger;
      try
         cxAnimalGridView.DataController.BeginFullUpdate;
         cxAnimalGridView.DataController.LockDataChangedNotify;
         try
            if WinData.SystemRegisteredCountry = Ireland then
               begin
                  if ( HerdLookup.GetHerdTypeAsString(WinData.UserDefaultHerdID) = cDairyHerd ) then
                     ShowDairySireRegister
                  else
                     TfmBeefAISireRegister.execute(TfmBeefAISireRegister,CallSetupQuery);
               end
            else
               //   22/02/12 [V5.0 R4.0] /MK Change - If Country <> Ireland Then Only Show DairySireList.
               ShowDairySireRegister;

            Screen.Cursor := crHourGlass;
            try
               if CallSetupQuery then
                  begin
                     WinData.AnimalFileByID.Close;
                     WinData.AnimalFileByID.Open;
                  end;
               cxAnimalGridView.Datacontroller.BeginLocate;
               try
                  WinData.AnimalFileByID.Locate('ID', id, []);
                  Update;
               finally
                  cxAnimalGridView.Datacontroller.EndLocate;
               end;
            finally
               Screen.Cursor := crDefault;
            end;
         except
         end;
      finally
         cxAnimalGridView.DataController.UnLockDataChangedNotify;
         cxAnimalGridView.DataController.EndFullUpdate;
      end;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.SireSelection1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      BullReportsFilt.ShowForm(1);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.QuotaPlanner1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
     TfmFertTreatmentsReview.Execute;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.BestCowsInHerd1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      BreedingAnalysisFilt.ShowForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.CowEnrolmentFormMR21Click(Sender: TObject);
begin
   uCowEnrolFilt.ShowForm;
end;

procedure TMenuForm.MilkProductionGraphs1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uDailyYieldGraph.ShowForm;
   finally
     EnableBtn(Sender);
   end;
end;

procedure TMenuForm.HerdBrochure1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uHerdBrochureFlt.ShowForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.SalesCatelog1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   try
      EnableBtn(Sender);
      if FSelectedHerdType = htDairy then
         uSalesCatalogueFlt.ShowForm
      else
         TfmBeefSalesCatalogue.execute(TfmBeefSalesCatalogue);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.FirstAnimal1Click(Sender: TObject);
begin
   cxAnimalGridView.DataController.DataSet.First;
end;

procedure TMenuForm.NextAnimal1Click(Sender: TObject);
begin
   cxAnimalGridView.DataController.DataSet.Next;
end;

procedure TMenuForm.PreviousAnimal1Click(Sender: TObject);
begin
   cxAnimalGridView.DataController.DataSet.Prior;
end;

procedure TMenuForm.LastAnimal1Click(Sender: TObject);
begin
   cxAnimalGridView.DataController.DataSet.Last;
end;

procedure TMenuForm.PrintSetup1Click(Sender: TObject);
begin
   PrinterSetup.Execute;
end;

procedure TMenuForm.HerdSettings1Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfHerdSetUp);
   SetUpForm;
end;

procedure TMenuForm.MilkDiskParameters1Click(Sender: TObject);
begin
   uSetUpMilkDisk.CreateAndShow(FCountry);
end;

procedure TMenuForm.SetNationalIDtype1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   WinData.CreateAndShowForm(TfDefaults);
end;

procedure TMenuForm.Customers1Click(Sender: TObject);
var
   ID : Integer;
begin
   uCustomers.ShowTheForm(TRUE, ID);
end;

procedure TMenuForm.Suppliers1Click(Sender: TObject);
var
   ID : Integer;
begin
   uSuppliers.ShowTheForm(TRUE, ID);
end;

procedure TMenuForm.Breeds1Click(Sender: TObject);
begin
   SetUpBreeds.ShowTheForm(FALSE);
end;

procedure TMenuForm.Buyers1Click(Sender: TObject);
var
   ID : Integer;
begin
   uBuyers.ShowTheForm(TRUE, ID);
end;

procedure TMenuForm.SystemUsers1Click(Sender: TObject);
begin
   uSetupUsers.ShowTheForm(False);
end;

procedure TMenuForm.Menu1Click(Sender: TObject);
var
   i : Integer;
begin
   if Menu1.Checked then
      try
         for i := 0 to MainMenu.Items.Count-1 do
            MainMenu.Items[i].Visible := FALSE;
         Menu1.Checked := FALSE;
      except
         //
      end;
end;

procedure TMenuForm.Statusbar1Click(Sender: TObject);
begin
   if Statusbar1.Checked then
      Statusbar.Hide
   else
      Statusbar.Show;
   Statusbar1.Checked := NOT(Statusbar1.Checked);
end;

procedure TMenuForm.ToolBar2Click(Sender: TObject);
begin
   If Dock97.Visible Then
      begin
         Dock97.Hide;
         Toolbar2.Checked := False;
      end
   else
      begin
         Dock97.Show;
         Toolbar2.Checked := True;
      end;
   EventIcons1Click(Sender);
end;

procedure TMenuForm.sbHelp1Click(Sender: TObject);
begin
   WinData.HTMLHelp('mainscreen.htm');
   {
   if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = Ireland then
      begin
         WinData.HTMLHelp('gettingstarted.htm');
      end
   else if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = NIreland then
      begin
         WinData.HTMLHelp('gettingstartedNI.htm');
      end
   else if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = England then
      begin
         WinData.HTMLHelp('gettingstartedGB.htm');
      end;
   }
end;

procedure TMenuForm.VisitKingswoodOnline1Click(Sender: TObject);
begin
   OpenUrl('http://www.kingswood.ie/');
end;

procedure TMenuForm.Index1Click(Sender: TObject);
begin
   WinData.HTMLHelp('index.htm');
   Windata.HelpSocket.ShowIndexTAB;
end;

procedure TMenuForm.SearchforHelpOn1Click(Sender: TObject);
begin
   Windata.HelpSocket.ShowSearchTab;
   WinData.HTMLHelp('index.htm');
end;

procedure TMenuForm.HowtoUseHelp1Click(Sender: TObject);
begin
   WinData.HTMLHelp('howtousehelp.htm');
end;

procedure TMenuForm.SalesReport1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      // KB's Sales Report
      uSalesReport.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.ResolutionOptions1Click(Sender: TObject);
begin
   uSystem.ShowForm(Res);
end;

procedure TMenuForm.EventIcons1Click(Sender: TObject);
begin
   if EventIcons1.Checked = True then
      begin
         vSplitter.Hide;
         //Gradient.Height := 0;
         pGrid.Top := 283 + 173;
         EventIcons1.Checked := False;
      end
   else
      begin
         pGrid.Height := 283;
         //Gradient.Height := 173;
         vSplitter.Show;
         EventIcons1.Checked := True;
      end;
end;

procedure TMenuForm.MovementPermits1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      CheckSelectedHerd;
      TfmStockValuationReport.ShowStockValuationReport;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.FormCreate(Sender: TObject);
const
   cSingleEvent = 'Single %s Event';
   cMultipleEvent = 'Block %ss';
var
   EmailClient : string;
   ItemIndex : Integer;
begin
   Width := Screen.Width;
   Height := Screen.Height;
   
   FShutdownInProgress := True;

   cxAnimalGridView.DataController.DataSource := WinData.AnimalSourceByID;
   EventGridAnimalEventsView.DataController.DataSource := WinData.EventSource;

   //   13/02/15 [V5.4 R2.6] /MK Bug Fix - Datasource was lost for FeedEvents..
   EventGridFeedEventsView.DataController.DataSource := WinData.dsFeedEvents;

   //   05/08/14 [V5.3 R3.3] /MK Bug Fix - Datasource was lost for mAnimalComments after Delphi crash.
   mAnimalComments.Databinding.DataSource := WinData.dsAnimalsExt;

   FFormShowing := False;

   miTestFacility.Visible := DirectoryExists('C:\Kingswood\Delphi Development\Delphi 5\Herd'); // debug

   //   18/01/12 [V5.0 R3.5] /MK Change - New cxButtons Added For EventDiary And Herd Stats.
   sbEventGrid.Visible := False;
   sbHerdStats.Visible := False;

   // Register a custom windows message
   MyMsg := RegisterWindowMessage('Kingswood Herd Management');
   // Set MenuForm's windows proc to ours and remember the old window proc
   OldWindowProc := Pointer(SetWindowLong(MenuForm.Handle,GWL_WNDPROC,LongInt(@NewWindowProc)));

   SetGridStyles;

   ReloadSetupQuery := False;

   GettingStartedScrActive := False;

   if Def.Definition.dPDAStandalone then
      SystemType := stPDAStandalone
   else
      SystemType := stStandard;

   Windata.ReportInEuro := True; // do not change this value!!!
   Application.OnMinimize := MenuForm.AppMinimize;
   Application.OnRestore := MenuForm.AppRestore;

   SetDataSources;
   RestoreAnimalGridView;
   kRoutines.CheckHighLightedControls(Self, clRed);
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbReports.Glyph, cBtnImgPrint);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph, cBtnImgHelp);
   WinData.LoadBtnImage(WinData.Images,sbBackup.Glyph, cBtnImgFloppy2);

//   WinData.LoadBtnImage(sbAddAnimal.Glyph, cBtnImgAdd);

//   EventGridAnimalEventsViewEventType.Properties.look
   Blade1.Visible := WinData.GlobalSettings.BladeRegistered;
   DefaultEmailClient1.Visible := (WinData.SystemRegisteredCountry in [Ireland, NIreland]) and ( FileExists(IncludeTrailingBackslash( ApplicationPath ) + KingswoodMailBoxDLL));

   Email1.Visible := ( (WinData.SystemRegisteredCountry in [Ireland, NIreland]) and (WinData.DefaultEmailClient <> cEmailClient_MS));

   AllAnimalsShowing := False;
   RetagColumn1.Checked := True;

   Reg := TRegistry.Create;

   pmHeatBullingEvent := TPopupMenu.Create(nil);

   miHeatBullingSingleEvent := TMenuItem.Create(pmHeatBullingEvent);
   miHeatBullingSingleEvent.Caption := Format(cSingleEvent, [cStrHeatBulling]);

   miHeatBullingMultiEvent := TMenuItem.Create(pmHeatBullingEvent);
   miHeatBullingMultiEvent.Caption := Format(cMultipleEvent, [cStrHeatBulling]);
   miHeatBullingMultiEvent.Tag := CBullingEvent;
   miHeatBullingMultiEvent.OnClick := ShowGroupEventClick;
   pmHeatBullingEvent.Items.Add([miHeatBullingSingleEvent,miHeatBullingMultiEvent]);

   pmServiceEvent := TPopupMenu.Create(nil);
   miServiceSingleEvent := TMenuItem.Create(pmServiceEvent);
   miServiceSingleEvent.Caption := Format(cSingleEvent, [cStrService]);

   miServiceMultiEvent := TMenuItem.Create(pmServiceEvent);
   miServiceMultiEvent.Caption := Format(cMultipleEvent, [cStrService]);
   miServiceMultiEvent.Tag := CServiceEvent;
   miServiceMultiEvent.OnClick := ShowGroupEventClick;
   pmServiceEvent.Items.Add([miServiceSingleEvent,miServiceMultiEvent]);

   pmScanPDEvent := TPopupMenu.Create(nil);
   miScanPDSingleEvent := TMenuItem.Create(pmScanPDEvent);
   miScanPDSingleEvent.Caption := Format(cSingleEvent, [cStrPregDiagnosis]);

   miScanPDMultiEvent := TMenuItem.Create(pmScanPDEvent);
   miScanPDMultiEvent.Caption := Format(cMultipleEvent, [cStrPregDiagnosis]);
   miScanPDMultiEvent.Tag := CPregDiagEvent;
   miScanPDMultiEvent.OnClick := ShowGroupEventClick;
   pmScanPDEvent.Items.Add([miScanPDSingleEvent,miScanPDMultiEvent]);

   pmDryOffEvent := TPopupMenu.Create(nil);
   miDryOffSingleEvent := TMenuItem.Create(pmDryOffEvent);
   miDryOffSingleEvent.Caption := Format(cSingleEvent, [cStrDryOff]);

   miDryOffMultiEvent := TMenuItem.Create(pmDryOffEvent);
   miDryOffMultiEvent.Caption := Format(cMultipleEvent, [cStrDryOff]);
   miDryOffMultiEvent.Tag := CDryOffEvent;
   miDryOffMultiEvent.OnClick := ShowGroupEventClick;
   pmDryOffEvent.Items.Add([miDryOffSingleEvent,miDryOffMultiEvent]);

   pmVetTreatmentsEvent := TPopupMenu.Create(nil);
   miVetTreatmentsSingleEvent := TMenuItem.Create(pmVetTreatmentsEvent);
   miVetTreatmentsSingleEvent.Caption := Format(cSingleEvent, [cStrVetTreatment]);

   miVetTreatmentsMultiEvent := TMenuItem.Create(pmVetTreatmentsEvent);
   miVetTreatmentsMultiEvent.Caption := Format(cMultipleEvent, [cStrVetTreatment]);
   miVetTreatmentsMultiEvent.Tag := CHealthEvent;
   miVetTreatmentsMultiEvent.OnClick := ShowGroupEventClick;
   pmVetTreatmentsEvent.Items.Add([miVetTreatmentsSingleEvent,miVetTreatmentsMultiEvent]);

   pmPurchaseEvent := TPopupMenu.Create(nil);
   miPurchaseMultiEvent := TMenuItem.Create(pmPurchaseEvent);
   miPurchaseMultiEvent.Caption := Format(cMultipleEvent, [cStrPurchase]);
   miPurchaseMultiEvent.Tag := CPurchaseEvent;
   miPurchaseMultiEvent.OnClick := pFileImportClick;
   pmPurchaseEvent.Items.Add([miPurchaseMultiEvent]);

   pmWeighingEvent := TPopupMenu.Create(nil);
   pmWeighingEvent.OnPopup := pmWeighingEventOnPopup;

   miWeighingLW := TMenuItem.Create(pmWeighingEvent);
   miWeighingLW.OnClick := LWClick;
   miWeighingLW.Caption := '&Pre-Sale Weighing';

   miWeighingIHM := TMenuItem.Create(pmWeighingEvent);
   miWeighingIHM.OnClick := InterHerdClick;
   miWeighingIHM.Caption := '&Inter Herd Movement';

   miWeighingLinkToScale := TMenuItem.Create(pmWeighingEvent);
   miWeighingLinkToScale.OnClick := ShowLinkToWeighingScale;
   miWeighingLinkToScale.Caption := 'Link To Weighing Scale';

   pmWeighingEvent.Items.Add([miWeighingLW,miWeighingIHM,miWeighingLinkToScale]);
   btnWeighing.DropDownMenu := pmWeighingEvent;

   pmDisbuddingEvent := TPopupMenu.Create(nil);
   with pmDisbuddingEvent do
      begin
         Items.Add( TMenuItem.Create(pmDisbuddingEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cSingleEvent, [cStrDisbudding]);

         Items.Add( TMenuItem.Create(pmDisbuddingEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cMultipleEvent, [cStrDisbudding]);
         Items[ItemIndex].OnClick := ShowAWGroupEventClick;
         Items[ItemIndex].Tag := CDisbuddingEvent;

         Items.Add( TMenuItem.Create(pmDisbuddingEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := '-';

         Items.Add( TMenuItem.Create(pmDisbuddingEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := cReviewAnimalWelfareEvents;
         Items[ItemIndex].OnClick := ShowAWEventReview;
      end;

   pmCastrationEvent := TPopupMenu.Create(nil);
   with pmCastrationEvent do
      begin
         Items.Add( TMenuItem.Create(pmCastrationEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cSingleEvent, [cStrCastration]);

         Items.Add( TMenuItem.Create(pmCastrationEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cMultipleEvent, [cStrCastration]);
         Items[ItemIndex].OnClick := ShowAWGroupEventClick;
         Items[ItemIndex].Tag := CCastrateEvent;

         Items.Add( TMenuItem.Create(pmCastrationEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := '-';

         Items.Add( TMenuItem.Create(pmCastrationEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := cReviewAnimalWelfareEvents;
         Items[ItemIndex].OnClick :=  ShowAWEventReview;
      end;

   pmStartMealFeedEvent := TPopupMenu.Create(nil);
   with pmStartMealFeedEvent do
      begin
         Items.Add( TMenuItem.Create(pmStartMealFeedEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cSingleEvent, [cStrMealFeeding]);

         Items.Add( TMenuItem.Create(pmStartMealFeedEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cMultipleEvent, [cStrMealFeeding]);
         Items[ItemIndex].OnClick := ShowAWGroupEventClick;
         Items[ItemIndex].Tag := CMealFeedingEvent;

         Items.Add( TMenuItem.Create(pmStartMealFeedEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := '-';

         Items.Add( TMenuItem.Create(pmStartMealFeedEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := cReviewAnimalWelfareEvents;
         Items[ItemIndex].OnClick :=  ShowAWEventReview;
      end;

   pmWeaningEvent := TPopupMenu.Create(nil);
   with pmWeaningEvent do
      begin
         Items.Add( TMenuItem.Create(pmWeaningEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cSingleEvent, [cStrWeaning]);

         Items.Add( TMenuItem.Create(pmWeaningEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cMultipleEvent, [cStrWeaning]);
         Items[ItemIndex].OnClick := ShowAWGroupEventClick;
         Items[ItemIndex].Tag := CWeaningEvent;

         Items.Add( TMenuItem.Create(pmWeaningEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := '-';

         Items.Add( TMenuItem.Create(pmWeaningEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := cReviewAnimalWelfareEvents;
         Items[ItemIndex].OnClick :=  ShowAWEventReview;
      end;

   BuildOnFarmEventsMenu(pmAnimalCartPopup, OnFarmEvents1);
   BuildOnFarmEventsMenu(pmFilterMenu, OnFarmEvents2);

   miPhoneLink.Enabled := def.Definition.dUsePhoneLink;
   miPDALink.Enabled := def.Definition.dUsePhoneLink; // PhoneLink module will include PDA

   miFacilitator.Visible := WinData.AdvisoryRoleActive;

   miCrushXMLSep.Visible := ( Def.Definition.dUseCrush ) and ( DirectoryExists(cCrushXMLFileLocation) );
   miCrushXMLImport.Visible := miCrushXMLSep.Visible;

   CurrIndex := 'SortAnimalNo';

   SortAsc := TRUE;

   //   28/11/19 [V5.9 R1.3] /MK Bug Fix - Richard Claxton was getting an "Unspecified Error" when trying to put an icon in the SysTray.
   try
      ShowIcon.Active := TRUE;
   except
      on e : Exception do
         begin
            ApplicationLog.LogException(e);
            ApplicationLog.LogError(e.Message);
         end;
   end;

   // set id event flag - 8/12/00 - kr
   WinData.IDEvent := False;

   // fill in tips - kr 19/10/00
   if WinData.ShowHints then
      try
         Reg.RootKey := HKEY_CURRENT_USER;
         if (Reg.OpenKey('Software\Kingswood\KHMTips',False)) then
            AMTip.LoadFromRegistry('Software\Kingswood\KHMTips',True)
         else
            try
               AMTip.TipsToShow.LoadFromFile(ApplicationPath + 'KHMTips.txt');
            except
               messagedlg('Tips are unavailable - Please contact Kingswood',mtInformation,[mbOK],0);
            end;
      finally
         Reg.Free;
      end;

   if WinData.ActiveFilter then
      WinData.ActiveFilter := False;

   cbDefaultHerd.Value := IntToStr(WinData.UserDefaultHerdID);
   SetupForm;

   if ( WinData.AnimalFileByID.Active ) and (WinData.AnimalFileByID.RecordCount > 0 ) then
      WinData.AnimalFileByID.First;

   if Def.Definition.dUsePhoneLink then
      begin
         if ( WinData.PDALinkExport <> nil ) then
            ExportToPDA.Enabled := WinData.PDALinkExport.Active;
      end;

   RunPDAHerdInstaller.Enabled := PDAHerdInstallerExists;
   RunPDAFieldsInstaller.Enabled := PDAFieldsInstallerExists;

   lRecNo.Caption := '';
   UpdateStatusBar;
   AnimalCartFiltered := False;

   FSQLFilter := TSQLFilter.Create;

   DrawRounded(pBreedingLink);
   DrawRounded(pMovementsLink);
   DrawRounded(pVeterinaryFeedsLink);
   DrawRounded(pRegisterCalfRegLink);
   DrawRounded(pGroupsLink);
   DrawRounded(pManagementLink);
   DrawRounded(pKingswoodLink1);

   DrawRounded(pOnFarmEventsLink);
   DrawRounded(pMovementsInOutLink);
   DrawRounded(pGrpAnimalWelfareLink);

   DrawRounded(pParlourEventsLink);
   pParlourEventsLink.Visible := False;
   pParlourEventsLink.Visible := ( (WinData.GlobalSettings.DisplayCrushScreen) and (FSelectedHerdType = htDairy) );
   pParlourEventsLink.Top := 175;

   DrawRounded(pBordBiaLink);
   ShowBordBiaEventAreaButton;

   SetUpQuery(True);

   SetSearchPanelVisible(not WinData.GlobalSettings.AnimalGridHideSearchBar);

   FAimMovementActions := TAimMovementActions.Create;

   FQuickFilter := qfNone;

   FParlourInfo := TParlourDetails.Create;
   ChangeAnimalDetails1.Visible := ( Def.Definition.dUseParlour ) and ( Length(FParlourInfo.ParlourType) > 0 );
   ChangeAnimalDetails2.Visible := ( not(ChangeAnimalDetails1.Visible) );

   //   13/10/16 [V5.6 R2.0] /MK Additional Feature - Default the EventGrid Width - TGM/Alan Irwin.
   if ( WinData.MainScreenEventGridWidth > 0 ) then
      Panel13.Width := WinData.MainScreenEventGridWidth;

   FFormResizing := False;
   HerdReconcileActivated := False;
   AIMMovementsActivated := False;

   HideHintStyleController;

   //   09/04/19 [V5.8 R8.6] /MK Additional Feature - Added new utility to call new AutoArchive program that clears all sales in the
   //                                                 the database. This was intended to be used by Martin Hallissey after his Animals table
   //                                                 had reached 14000 records within 3 months. New Const aAutoArchiveSerialNos created
   //                                                 with Martin's Serial Number but this can be extended to an array if any else needs it.
   //                                                 The AutoArchive program needs to be installed manually by TeamViewer.
   pmiAutoArchive.Visible := ( Def.Definition.dSerialNo = aAutoArchiveSerialNos ) and ( FileExists(ApplicationPath+'AutoArchive.exe') );
end;

procedure TMenuForm.FormDestroy(Sender: TObject);
begin
   HideHintStyleController;
   //   13/10/16 [V5.6 R2.0] /MK Additional Feature - Save the default EventGrid Width - TGM/Alan Irwin.
   WinData.MainScreenEventGridWidth := Panel13.Width;

   if pmHeatBullingEvent <> nil then
      FreeAndNil(pmHeatBullingEvent);
   if pmServiceEvent <> nil then
      FreeAndNil(pmServiceEvent);
   if pmScanPDEvent <> nil then
      FreeAndNil(pmScanPDEvent);
   if pmDryOffEvent <> nil then
      FreeAndNil(pmDryOffEvent);
   if pmVetTreatmentsEvent <> nil then
      FreeAndNil(pmVetTreatmentsEvent);
   if pmWeighingEvent <> nil then
      FreeAndNil(pmWeighingEvent);
   if pmDisbuddingEvent <> nil then
      FreeAndNil(pmDisbuddingEvent);
   if pmCastrationEvent <> nil then
      FreeAndNil(pmCastrationEvent);
   if pmStartMealFeedEvent <> nil then
      FreeAndNil(pmStartMealFeedEvent);
   if pmWeaningEvent <> nil then
      FreeAndNil(pmWeaningEvent);
   if pmPurchaseEvent <> nil then
      FreeAndNil(pmPurchaseEvent);
   SafeFreeAndNil(FSQLFilter);
   if ( FParlourInfo <> nil ) then
      FreeAndNil(FParlourInfo);

   StoreAnimalGridView;
   // Set MenuForm's window proc back to it's original procedure
   SetWindowLong(MenuForm.Handle,GWL_WNDPROC,LongInt(OldWindowProc));
end;

procedure TMenuForm.sbFiltersClick(Sender: TObject);
begin
   LastHerdID := WinData.UserDefaultHerdID;

   if ( FQuickFilter <> qfNone ) then
      // FFilterWarning only shows this message once from when the program opens.
      if ( FFilterWarning ) then
         begin
            MessageDlg('You are about to apply a filter after selecting an animal cateogry.'+cCRLFx2+
                       'Certain filter options will not be available.'+cCRLFx2+
                       'Click on Clear Select button if you wish to go back to Current Herd.',mtInformation,[mbOK],0);
            FFilterWarning := False;
         end;

   fFilters.ShowForm;
   btnClearSelect.Visible := WinData.ActiveFilter;

   pmiReverseFilter.Visible := WinData.ActiveFilter;
   N50.Visible := pmiReverseFilter.Visible;

   pmiCreateFromFilter.Visible := ( WinData.ActiveFilter ) and ( WinData.FilteredAnimals.RecordCount > 0 );
   N54.Visible := pmiCreateFromFilter.Visible;
end;

procedure TMenuForm.KingswoodHerdManagement1Click(Sender: TObject);
begin
   Application.Restore;
   Application.BringToFront;
end;

procedure TMenuForm.Weighing1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uWeighingFilt.ShowTheForm(wrtWeightGain);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbActivitiesSinceLastTestClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uActiv.ShowForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbMilkSysRecClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      WinData.CreateAndShowForm(TfMilkRecSysScr);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbMilkDiskReviewClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uMilkDiskReview.CreateAndShow;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbAnimalsPaddocks1Click(Sender: TObject);
begin
   sbAnimalsPaddocks.Enabled := False;
   try
      WinData.CallProg.Fields;
   finally
      sbAnimalsPaddocks.Enabled := True;
   end;
end;

procedure TMenuForm.ShowHintsatStartupClick(Sender: TObject);
begin
   if ShowHintsatStartUp.Checked then
      ShowHintsatStartUp.Checked := FALSE
   else
      ShowHintsatStartUp.Checked := TRUE;
   WinData.ShowHints := ShowHintsatStartUp.Checked;
end;

procedure TMenuForm.AMTipExecuted(Sender: TObject; StartNextTime: Boolean);
begin
   WinData.ShowHints := StartNextTime;
end;

procedure TMenuForm.sbBeefPurchGrpRepClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      TfPurchGrpRep.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
end;

function TMenuForm.CheckAnimalOKforBreeding : Boolean;
begin
   // Assumes you are using the Current record from the Animals Table
   RESULT := FALSE;
   if NOT ( WinData.AnimalFileByIDBreeding.AsBoolean ) then // Must be a breeding Animal
      ShowMessage('Animal is marked as NOT used for Breeding')
   else if ( WinData.AnimalFileByIdSex.Value = 'Female' ) then // Check the Animal Sex
      RESULT := TRUE
   else if ( WinData.AnimalFileById.IsEmpty ) then
      ShowMessage('No Animals Showing')
   else
      ShowMessage('This is a Male Animal');
end;

procedure TMenuForm.sbICBFRegClick(Sender: TObject);
begin
   uICBFEventExport.ShowTheForm;
end;

procedure TMenuForm.BackUpTimerTimer(Sender: TObject);
begin
   // if menuform is active call backup every hour
   // else > one hour and not active change timer to every 5 seconds
   // until menuform is reactivated and call backup  -  added 31/3/00 kr
   if Self.Active then
      begin
         if MessageDlg('It has been one hour since you opened this program.'+#13+
                       'Would you like to back-up your information?',
                                      mtInformation,[mbYes,mbNo],0) = mrYes then
            begin
               sbBackupClick(Sender)
            end
         else
            try
               // close & re-open tables and database
               WinData.KingData.CloseDataSets;
               WinData.OpenTables;
            except
               ShowMessage('An Error has occured with the Database - ReStart Program' +
                            #13#13 + 'If problem persists Contact Kingwood');
            end;
         BackUpTimer.Interval := 3600000;
      end
end;

procedure TMenuForm.AutoBackup1Click(Sender: TObject);
begin
   if AutoBackup1.Checked = True then
      begin
         BackUpTimer.Interval := 0;
         AutoBackUp1.Checked  := False;
      end
   else
      begin
         BackUpTimer.Interval := 3600000;
         AutoBackUp1.Checked  := True;
      end;
end;

procedure TMenuForm.sbFeedPurchClick(Sender: TObject);
begin
   WinData.FdStkEvents.Append;
   WinData.CreateAndShowForm(TfFeedPurch);
end;

procedure TMenuForm.sbFeedAllocClick(Sender: TObject);
begin
   // Kill the link to AnimalFileByID
   WinData.FeedEvents.DisableControls;
   WinData.FeedEvents.MasterFields := '';
   WinData.FeedEvents.MasterSource := nil;

   uFeedAlloc.ShowTheForm(0);

   // Reset the link to AnimalFileByID
   WinData.FeedEvents.MasterFields := 'ID';
   WinData.FeedEvents.MasterSource := Windata.AnimalSourceByID;
   WinData.FeedEvents.EnableControls;

   btnFeedDiary.Enabled := ( (Def.Definition.dUseManCal) or (Def.Definition.dUseBeefMan) ) and ( WinData.UsingFeedAllocation );
end;

procedure TMenuForm.sbAccountsClick(Sender: TObject);
begin
   if not FileExists('C:\Kingsacc\Farmgate.def') then
      begin
         MessageDlg('Farmgate.def file missing. Contact Kingswood.',mtError,[mbOK],0);
         Exit;
      end;

   if sbReports.Down then
      WinData.CreateAndShowForm(TfmAccsReps)
   else
      begin
         sbAccounts.Enabled := False;
         try
            if Definition.dUseKingsAccs then
               begin
                  WinData.CallProg.Accounts(' M ' + RegistrySerialNum, WinData.UserDefaultHerdID);
                  LoadAccountsCompanies;
               end
            else
               begin
                  WinData.CallProg.Accounts(' M ', WinData.UserDefaultHerdID);
                  LoadAccountsCompanies;
               end;
         finally
            sbAccounts.Enabled := True;
         end;
      end;
end;

procedure TMenuForm.sbSheepClick(Sender: TObject);
begin
   sbSheep.Enabled := False;
   try
      WinData.CallProg.Sheep;
   finally
      sbSheep.Enabled := True;
   end;
end;

procedure TMenuForm.sbReportGenerator(Sender: TObject);
var
   ButtonName : string;
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      // hint should have been used!
      if ( Sender is TMenuItem ) then
         ButtonName := (Sender As TMenuItem).Name
      else
         ButtonName := (Sender As TSpeedButton).Name;

      // check sender then open report generator and pass parameters
      if ((ButtonName = 'sbHerdRG') or (ButtonName = 'miHerdRG')) then
         WinData.CallProg.ReportGenerator(rgmHerd)
      else if ((ButtonName = 'sbHealthRG') or (ButtonName = 'miHealthRG')) then
         WinData.CallProg.ReportGenerator(rgmHealth)
      else if ((ButtonName = 'sbCowFertilityRG') or (ButtonName = 'miFertRepGen')) then
         WinData.CallProg.ReportGenerator(rgmCowFertility)
      else if  ((ButtonName = 'sbPedigreeRG') or (ButtonName = 'miPedigreeRG')) then
         WinData.CallProg.ReportGenerator(rgmPedigree)
      else if  ((ButtonName = 'sbCalfPerformance') or (ButtonName = 'miCalfPerform')) then
         WinData.CallProg.ReportGenerator(rgmCalfPerformance)
      else if  ((ButtonName = 'sbMilkReportGeneratorRG') or (ButtonName = 'miMilkReportGeneratorRG')) then
         WinData.CallProg.ReportGenerator(rgmMilkPerformance);

   finally
      EnableBtn(Sender);
   end;

end;

procedure TMenuForm.FeedTypes1Click(Sender: TObject);
begin
   //uFeedTypes.ShowTheForm(0,TRUE);
end;

procedure TMenuForm.AMTipBtnCloseClick(Sender: TObject);
begin
   // save any tip changes
   AMTip.SaveToRegistry('Software\Kingswood\KHMTips');
end;

procedure TMenuForm.sbRationCalcClick(Sender: TObject);
begin
   WinData.CallProg.RationCalc;
end;

procedure TMenuForm.EuroClick(Sender: TObject);
begin
   Euro.Checked := True;
   Pound.Checked := False;
   WinData.ReportInEuro := Euro.Checked;
end;

procedure TMenuForm.PoundClick(Sender: TObject);
begin
   Pound.Checked := True;
   Euro.Checked := False;
   WinData.ReportInEuro := Euro.Checked;
end;

procedure TMenuForm.SpeedButton1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      WinData.CreateAndShowForm(TfRestrictAnimals);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.RestrictedAnimalsReport1Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfRestrictAnimals);
end;

function TMenuForm.ShowParlourLink: Boolean;
var
   ParlinkPath : String;
begin
   Result := False;
   ParlinkPath := ExtractFilePath(ParamStr(0))+'Parlink.exe';
   try
      if FileExists(ParlinkPath) and ( FSelectedHerdType = htDairy ) then
         Result := True
      else
         Result := False;
   except
   end;
end;

function TMenuForm.ShowRationCalcLink: Boolean;
var
   RationCalcPath : String;
begin
   Result := False;
   RationCalcPath := ExtractFilePath(ParamStr(0))+'Ration.exe';
   try
      if FileExists(RationCalcPath) and ( FSelectedHerdType = htDairy ) then
         Result := True
      else
         Result := False;
   except
   end;
end;

procedure TMenuForm.sbHerdStatsClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfmHerdStatistics, fmHerdStatistics);
      fmHerdStatistics.ShowModal;
   finally
      fmHerdStatistics.Free;
   end;
end;

procedure TMenuForm.sbPedigreeRegClick(Sender: TObject);
begin
   if FCountry = Ireland then
      uICBFEventExport.ShowTheForm
   else // for both NI and England
      begin
         cxAnimalGridView.DataController.BeginFullUpdate;
         try
            uHFSCalfReg.ShowForm;
         finally
            cxAnimalGridView.DataController.EndFullUpdate;
         end;
      end;
end;

procedure TMenuForm.sbRegistrationClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if FCountry = NIreland then
      uAPHISRegistration.ShowForm(APHISBirths)
   else if FCountry = England then
      TfmCTSWSBirthReg.Execute
   else
      uCalfRegFlt.ShowForm;
   if ReloadSetupQuery then
      begin
         ReloadSetupQuery := false;
         SetUpQuery();
      end;
end;

procedure TMenuForm.DefaultAccsCompany1Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TAccDefComp);
end;

function TMenuForm.ShowAccsDef: Boolean;
begin
   Result := False;
   try
      if FileExists('C:\KingsAcc\WinAccs.exe') then
         Result := True
      else
         Result := False;
   except
   end;
end;

procedure TMenuForm.ConditionScore1Click(Sender: TObject);
var
   FormCaption : String;
   Tag : Integer;
begin
   if ( Sender is TMenuItem ) then
      begin
         Tag := (Sender as TMenuItem).Tag;
         FormCaption := (Sender As TMenuItem).Caption;
      end
   else if ( Sender is TSpeedButton ) then
      begin
         Tag := (Sender as TSpeedButton).Tag;
         FormCaption := (Sender As TSpeedButton).Caption;
      end
   else if ( Sender is TRxSpeedButton ) then
      begin
         Tag := (Sender as TRxSpeedButton).Tag;
         FormCaption := (Sender As TRxSpeedButton).Caption;
      end
   else if ( Sender is TImage ) then
      begin
         Tag := (Sender as TImage).Tag;
         FormCaption := (Sender As TImage).Hint;
      end
   else if ( Sender is TcxButton ) then
      begin
         Tag := (Sender as TcxButton).Tag;
         FormCaption := (Sender As TcxButton).Caption;

         if FormCaption = 'Disbudding' then
            Tag := 12
         else if FormCaption = 'Weaning' then
            Tag := 7
         else if FormCaption = 'Castration' then
            Tag := 1
         else if FormCaption = 'Start Meal Feed' then
            Tag := 11;

      end;

   if ( Tag > -1 ) then

   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
         Case Tag of
                { Condition Score }
            0 : if (WinData.AnimalFileByIDSex.AsString <> 'Female') then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(ECON, AddAWE, FormCaption);
                { Castrate }
            1 : if (WinData.AnimalFileByIDSex.AsString <> 'Bull') then
                   MessageDlg('Animal sex must be a Bull!',mtInformation,[mbOK],0)
                else
                   begin
                      uMPEvents.ShowTheForm(ECST, AddAWE, FormCaption);
                      SetUpQuery;
                   end;
                { Abortion }
            2 : if (WinData.AnimalFileByIDSex.AsString <> 'Female') then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(EABR, AddAWE, FormCaption);
                { Diagnose Problem }
            3 : if (WinData.AnimalFileByIDSex.AsString <> 'Female') then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(EDNP, AddAWE, FormCaption);
                { Embryo Implant/Transfer }
            4 : if (WinData.AnimalFileByIDSex.AsString <> 'Female') then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(EIMP, AddAWE, FormCaption);
                { Mastitis }
            5 : if WinData.AnimalFileByIDSex.AsString <> 'Female' then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(EMST, AddAWE, FormCaption);
                { To be Cull *** Check what Sex conditions apply }
            6 : uMPEvents.ShowTheForm(ETBC, AddAWE, FormCaption);
                { Weaning }
            7 : begin
                   // - 05/11/2010 do not allow creation of weaning using single entry screen.
                   // force user into group events screen.

                   // 02/08/2013 - SP - Removed message below allowing for immediate access to block weaning without
                   // any ui interaction.
                   TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TWean);
                   SetUpQuery;
                end;

                { Internal Exam }
            8 : if WinData.AnimalFileByIDSex.AsString <> 'Female' then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(EINT, AddAWE, FormCaption);
                { Run Bull In }
            9 : if WinData.AnimalFileByIDSex.AsString <> 'Female' then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(ERBI, AddAWE, FormCaption);
                { Run Bull Out }
            10: if WinData.AnimalFileByIDSex.AsString <> 'Female' then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(ERBO, AddAWE, FormCaption);
                { Meal Feeding }
            11: uMPEvents.ShowTheForm(EMLF, AddAWE, FormCaption);
                { Disbudding }
            12: uMPEvents.ShowTheForm(EDBU, AddAWE, FormCaption);
                { Milk Temperament }
            13: if not(WinData.HasMilkTemperament(WinData.AnimalFileByIDID.AsInteger,WinData.AnimalFileByIDHerdID.AsInteger)) then
                   uMPEvents.ShowTheForm(EMTS, AddAWE, FormCaption)
                else
                   MessageDlg('Milk Temperament event already exists',mtInformation,[mbOK],0);
         end;
end;

function TMenuForm.GetDefCountry: TCountry;
begin
   Result := Ireland;
   if cbDefaultHerd.Value = '0' then
      Result := Ireland
   else if WinData.OwnerFile.Locate('ID', cbDefaultHerd.Value,[] ) then
      if WinData.OwnerFile.FieldByName('Country').AsInteger = 12 then
         Result := NIreland
      else if WinData.OwnerFile.FieldByName('Country').AsInteger = 1 then
         Result := Ireland
      else
         Result := Other;
end;

procedure TMenuForm.SetDataSources;
begin
   cbDefaultHerd.LookupSource := WinData.dsHerdDefaults;
   riEventTypes.Properties.ListSource := HerdLookup.dsEventTypes;
   riHerdCombo.Properties.ListSource := WinData.dsHerdDefaults;
end;

procedure TMenuForm.SpeedButton19Click(Sender: TObject);
begin
   uBBPPurchScr.CreateAndShow;
end;

procedure TMenuForm.pBeefSalesClick(Sender: TObject);
begin
   ShowFactorySales;
end;

procedure TMenuForm.pFileImportClick(Sender: TObject);
var
   DatabaseUpdated : Boolean;
begin
   uKImport.CreateShowForm(TPurchase, DatabaseUpdated, False);
   Application.ProcessMessages;

   if DatabaseUpdated then
      begin
         Menuform.Enabled := False; // prevent any clicking during database operations
         try
            WinData.KingData.CloseDataSets; // Close the Dataset
            WinData.OpenAndCheckTables;
            SetupQuery(True);
         finally
            Menuform.Enabled := True; // Release
         end;

      end;
end;

procedure TMenuForm.pFileExportClick(Sender: TObject);
var
   DatabaseUpdated : Boolean;
begin
   UKImport.CreateShowForm(TSaleDeath, DatabaseUpdated, False);
   Application.ProcessMessages;

   if DatabaseUpdated then
      begin

         Menuform.Enabled := False; // prevent any clicking during database operations
         try
            WinData.KingData.CloseDataSets; // Close the Dataset
            WinData.OpenAndCheckTables;
            SetupQuery(True);
         finally
            Menuform.Enabled := True; // Release
         end;

      end;
end;

procedure TMenuForm.Panel8Click(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TNoEvent,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.sbExtensLivestkProjClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      uLivestockSum.ShowTheForm(Extens, nil);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.InterHerdClick(Sender: TObject);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
   begin
      uInterHerd.ShowInterHerd(AddInterHerd);
      SetUpQuery;
   end;
end;

procedure TMenuForm.sbNatIdSearchResetClick(Sender: TObject);
begin
   SetNatIDSearchText;
end;

procedure TMenuForm.sbAnimalViewClick(Sender: TObject);
begin
   ViewAnimal;
end;

procedure TMenuForm.RefreshForm;
begin
   MenuForm.Refresh;
end;

procedure TMenuForm.sbFertAnalysisClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      FertAnalysisRpt.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.LWClick(Sender: TObject);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      uPreSale.ShowPreSale(AddPreSale);
end;

procedure TMenuForm.CreateMooreParkExportFile1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   Update;
   MooreParkExport.CreateExportFile(WinData.UserDefaultHerdID);
   Update;
end;

procedure TMenuForm.sbSalesPlannerClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rtSalesPlanner);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.DiseaseTestStatus1Click(Sender: TObject);
begin
   RefreshForm;
   // KB's TB test Date Report
   uTBTestDtRep.ShowTheForm;
end;

procedure TMenuForm.RestrictedAnimalsReport2Click(Sender: TObject);
begin
   RefreshForm;
   WinData.CreateAndShowForm(TfRestrictAnimals);
end;

procedure TMenuForm.SalesPlanner1Click(Sender: TObject);
begin
  SaleEligibility.CreateAndShow(rtSalesPlanner);
end;

procedure TMenuForm.PremiumHistoryEligibility1Click(Sender: TObject);
begin
   RefreshForm;
   StockInHerdFilt.ShowForm(Premiums);
end;

procedure TMenuForm.Extensification1Click(Sender: TObject);
begin
   RefreshForm;
   uLivestockSum.ShowTheForm(Extens, nil);
end;

procedure TMenuForm.SlaughterPremium1Click(Sender: TObject);
begin
   HerdPassword.CreateAndShow(SlaughterPremiums);
end;

procedure TMenuForm.BeefPremium1Click(Sender: TObject);
begin
   HerdPassword.CreateAndShow(BeefPremiums);
end;

procedure TMenuForm.ReLinkCalves1Click(Sender: TObject);
begin
   HerdPassword.CreateAndShow(CalvingEvents);
end;

procedure TMenuForm.KingswoodComputing1Click(Sender: TObject);
begin
   ShellExecute(Self.Handle,'open','mailto:info@kingswood.ie',nil,nil,SW_SHOWNORMAL);
end;

procedure TMenuForm.Bandon1Click(Sender: TObject);
begin
   ShellExecute(Self.Handle,'open','mailto:ereg@sws.ie',nil,nil,SW_SHOWNORMAL);
end;

procedure TMenuForm.ICBF1Click(Sender: TObject);
begin
   ShellExecute(Self.Handle,'open','mailto:animalevents@icbf.com',nil,nil,SW_SHOWNORMAL);
end;

procedure TMenuForm.EnableBtn(Sender: TObject);
begin
   if Sender is TSpeedButton then
      with (Sender as TSpeedButton) do // SP 30/09/2002
         Enabled := not Enabled;
end;

procedure TMenuForm.CheckPhoneLinkOnStartupClick(Sender: TObject);
begin
   // SP 27/09/2002
   if CheckPhoneLinkOnStartup.Checked then
      CheckPhoneLinkOnStartup.Checked := False
   else
      CheckPhoneLinkOnStartup.Checked := True;
   WinData.SearchPhoneLink  := CheckPhoneLinkOnStartup.Checked;
   // SP 27/09/2002.
end;

procedure TMenuForm.InventoryValuations1Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfmLiveStockValues);
end;

procedure TMenuForm.NokiaLink1Click(Sender: TObject);
begin
   NokiaLink1.Checked := True;
   SiemensGSMModule1.Checked := False;
end;

procedure TMenuForm.sbParlourClick(Sender: TObject);
begin
   WinData.CallProg.ParlourLink(Handle,'');
end;

procedure TMenuForm.LoadAllAnimals(bSaleDeaths : Boolean);
begin
   cxAnimalGridView.DataController.BeginFullUpdate;
   WinData.AnimalFileByID.DisableControls;
   try
      WinData.AnimalFileByID.Active := False;
      WinData.AnimalFileByID.SQL.Clear;
      WinData.AnimalFileByID.SQL.Add('SELECT * FROM Animals A    ');
      WinData.AnimalFileByID.SQL.Add('WHERE (AnimalDeleted=FALSE)');
      if not bSaleDeaths then
         WinData.AnimalFileByID.SQL.Add('AND InHerd = True        ');

      //   16/04/12 [V5.0 R4.9] /MK Change - Added Check If Multi Herd Then Only Show Animals In All Herds And Not None Herd.
      if ( ( WinData.MultiHerd ) and ( not(bSaleDeaths) ) ) then
         WinData.AnimalFileByID.SQL.Add('AND HerdID <> '+IntToStr(WinData.NONEHerdID)+' ');

      ApplySortToAnimalFileByIdAndOpenQuery();
      WinData.ActiveFilter := bSaleDeaths;
      btnClearSelect.Visible := bSaleDeaths;
   finally
      WinData.AnimalFileByID.EnableControls;
      cxAnimalGridView.DataController.EndFullUpdate;
   end;
end;

procedure TMenuForm.cbAllAnimalsClick(Sender: TObject);
begin
   Update;
   Enabled := False;
   try
      WinData.ShowAllAnimals := cbAllAnimals.Checked;
      if cbAllAnimals.Checked then
         begin
            pmiCurrentHerd.Visible := True;
            ClearFilter1.Visible := True;
            cbAllAnimals.Font.Color := clBlue;
            AllAnimalsShowing := True;
            LastHerdID := WinData.UserDefaultHerdID;
            Screen.Cursor := crHourglass;
            cbDefaultHerd.KeyValue := AllHerds;
            Screen.Cursor := crHourglass;
            try
               Update;
               LoadAllAnimals(True);
            finally
               Screen.Cursor := crDefault;
            end;
         end
      else
         begin
            actClearFilter.Execute;
            pmiCurrentHerd.Visible := False;
            ClearFilter1.Visible := False;
            cbAllAnimals.Font.Color := clBlack;
            cbDefaultHerd.KeyValue := LastHerdID;
            AllAnimalsShowing := False;
            Screen.Cursor := crHourglass;
            try
               Update;
               SetUpQuery(True);
            finally
               Screen.Cursor := crDefault;
            end;
         end;
   finally
      Enabled := True;
      Update;
   end;
end;

procedure TMenuForm.cbAllEventsClick(Sender: TObject);
begin
   if cbFeedEvents.Checked then
      begin
         cbFeedEvents.Font.Color := clBlack;
         cbFeedEvents.Checked := False;
      end;

   if cbAllEvents.Checked then
      begin
         EventGridAnimalEventsViewAnimalLactNo.Options.Filtering := True;
         cbAllEvents.Font.Color := clBlue;
         WinData.Events.MasterFields := 'ID';
         //   31/07/12 [V5.0 R8.3] /MK Change - If AllEvents Then Change DataField To ServiceDateLastLact.
         cxAnimalGridViewServiceDate.DataBinding.FieldName := 'ServiceDateLastLact';
      end
   else
      begin
         EventGridAnimalEventsViewAnimalLactNo.Options.Filtering := False;
         cbAllEvents.Font.Color := clBlack;
         WinData.Events.MasterFields := 'ID;LactNo';
         //   31/07/12 [V5.0 R8.3] /MK Change - If not(AllEvents) Then Change DataField To ServiceDateThisLact.
         cxAnimalGridViewServiceDate.DataBinding.FieldName := 'ServiceDateThisLact';
      end;
end;

procedure TMenuForm.cbFeedEventsClick(Sender: TObject);
begin
   //   06/10/17 [V5.7 R3.6] /MK Change - Don't show All Events if Feed Events is ticked to stop confusion of un-ticking Feed Events to go back to normal events - GL request.
   if cbFeedEvents.Checked then
      begin
         cbFeedEvents.Font.Color := clBlue;
         cbAllEvents.Checked := False;
         cbAllEvents.Font.Color := clBlack;
         cbAllEvents.Visible := False;
         EventGridLevel.GridView := EventGridFeedEventsView;
      end
   else
      begin
         cbFeedEvents.Font.Color := clBlack;
         cbFeedEvents.Checked := False;
         cbAllEvents.Visible := True;
         cbAllEventsClick(nil);
         EventGridLevel.GridView := EventGridAnimalEventsView;
      end;
end;

procedure TMenuForm.Settings1Click(Sender: TObject);
begin
   PL := TPhoneLink.Create;
   try
      PL.ShowSettings;
   finally
      PL.Free;
   end;
end;

procedure TMenuForm.Checkfornewevents1Click(Sender: TObject);
begin
   if def.Definition.dUsePhoneLink then
      begin
         with TCreateEvents.create do
            try
               if ( WinData.PhoneLinkType in ([plNOKIA, plSIEMENS]) ) then
                  begin
                     LinkType  := TEventFileSource( WinData.PhoneLinkType );
                     CreateEvents;
                  end;
            finally
               Free;
            end;
      end;
end;

procedure TMenuForm.Perferences1Click(Sender: TObject);
begin
   Windata.CreateAndShowForm(TfmGlobalSettings);
   SetGridStyles;
   Email1.Visible := ((WinData.SystemRegisteredCountry=Ireland) and (WinData.DefaultEmailClient <> cEmailClient_MS));
   SetSearchPanelVisible(not WinData.GlobalSettings.AnimalGridHideSearchBar); // <<< SetNatIDSearchText; called in this proc
   UpdateBarcodeScannerControls;

   //   25/10/11 [V5.0 R1.6] /MK Additional Feature - Added Show Either IAD Crush Or AnimalBrowser.
   if ( WinData.GlobalSettings.DisplayCrushScreen ) then
      begin
         if ( not( Def.Definition.dUseManCal ) ) and ( FSelectedHerdType = htBeef ) and ( Def.Definition.dUseCrush ) then
            TfmCrushBarCode.Show(True)
         else if ( FSelectedHerdType = htDairy ) then
            begin
               TfmAnimalBrowser.ShowTheForm;
               pParlourEventsLink.Visible := True;
            end
      end
   else
      pParlourEventsLink.Visible := False;

   SetUpForm;
end;

procedure TMenuForm.ApplySortToAnimalFileByIdAndOpenQuery();
begin
   if CurrIndex = '' then
      CurrIndex := 'SortAnimalNo';

   with WinData.AnimalFileByID do
      try
         SQL.Add('ORDER BY '+CurrIndex+'');
         if SortAsc then
            SQL.Add('Asc')
         else
            SQL.Add('Desc');
         Prepare;
         Open;
      except
         on e : exception do
            ShowMessage(e.Message);
      end;

end;

procedure TMenuForm.SiemensGSMModule1Click(Sender: TObject);
begin
   WinData.PhoneLinkType := plSIEMENS;
   SiemensGSMModule1.Checked := True;
   NokiaLink1.Checked := False;
end;

procedure TMenuForm.Download;

   procedure CloseAndOpenDownloader;
   begin
      WinData.KingData.CloseDataSets;
      WinData.KingData.Close;
      WinExec(PChar(ApplicationPath + 'Kdownload.exe'), SW_SHOWNORMAL);
      Application.Terminate;
      Application.ProcessMessages;
   end;

   procedure CloseAndOpenKInstaller;
   begin
      //   14/09/18 [V5.8 R2.8] /MK Change - If user is downloading a new version then don't allow autoreindex.
      WinData.CancelAutoReIndex := True;
      WinData.KingData.CloseDataSets;
      WinData.KingData.Close;
      WinExec(PChar(ApplicationPath + cKInstallerProgram), SW_SHOWNORMAL);
      Application.Terminate;
      Application.ProcessMessages;
   end;

var
   KInstallerNewVerPath : string;
begin
   if not FileExists( ApplicationPath + cKInstallerProgram ) then
      begin
         DownloadInstallerIfMissing();
         if not FileExists( ApplicationPath + cKInstallerProgram ) then
            begin
               MessageDLG('Error downloading the Kingswood Installer - contact Kingswood.',mtWarning,[mbOK],0);
               Exit;
            end;
      end;

   if MessageDlg('It is strongly recommended to take a backup before proceeding. '+#13+
                       'Take backup now?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      sbBackupClick(sbBackup);

    KInstallerNewVerPath := ApplicationPath + 'KInstaller\'+cKInstallerProgram;
    if FileExists(KInstallerNewVerPath) then
       begin
          if CopyFile(PChar(KInstallerNewVerPath), PChar(ApplicationPath + cKInstallerProgram), False) then
             begin
                DeleteDirectory(ApplicationPath + 'KInstaller');
                CloseAndOpenKInstaller;
             end
          else
             MessageDLG('Error installing the Kingswood iInstaller program - contact Kingswood.',mtWarning,[mbOK],0);
       end
    else
       CloseAndOpenKInstaller;
end;

procedure TMenuForm.PLActivate(var msg: TMessage);
begin
   if msg.Msg = WM_PLActivate then
      if not CheckPhoneLinkOnStartup.Checked then
         CheckPhoneLinkOnStartup.Checked := True;
end;

procedure TMenuForm.PLDeActivate(var msg: TMessage);
begin
   if msg.Msg = WM_PLDeActivate then
      if CheckPhoneLinkOnStartup.Checked then
         CheckPhoneLinkOnStartup.Checked := False;
end;

procedure TMenuForm.ShowCrushFile(Sender : TObject);
begin
   uCrushDiskWeigh.ShowTheForm;
end;

procedure TMenuForm.RxSpeedButton2Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfmMilkTankRead);
end;

procedure TMenuForm.picPreSaleClick(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfmMilkTankRead);
end;

procedure TMenuForm.Blade1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   WinData.CreateAndShowForm(TfmBlade);
end;

procedure TMenuForm.BladeNotRegistered(var msg: TMessage);
begin
   if Msg.Msg = WM_BladeNotRegistered then
      begin
         Blade1.Visible := False;
      end;
end;

procedure TMenuForm.BladeRegistered(var msg: TMessage);
begin
   if Msg.Msg = WM_BladeRegistered then
      begin
         Blade1.Visible := True;
      end;
end;

procedure TMenuForm.TermsofUse1Click(Sender: TObject);
begin
   uSystem.ShowForm(TOU);
end;

procedure TMenuForm.sbHerdReconciliationClick(Sender: TObject);
begin
   CheckSelectedHerd;
   //   21/03/12 [V5.0 R4.5] /MK Change - New Boolean Check For Reconcile By Cards Checked Here.
   //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
   uHerdRec.CreateAndShow(cbDefaultHerd.KeyValue, False, True);
end;


procedure TMenuForm.AddSearchNatIDData;
{ Populate SearchNatID Field, strip NatID string of all None Alpha/Num Chars,
  allows user to search on natid without spaces/hyphens etc. }
var
   TempAnimals : TTable;
begin
   TempAnimals := TTable.Create(nil);
   with TempAnimals do
     try
        DatabaseName := AliasName;
        TableName := 'animals';
        Open;
        while not eof do
           begin
              if Length(FieldByName('NatIDNum').AsString) > 0 then
                 begin
                    Edit;
                    try
                       FieldByName('SearchNatID').AsString := WinData.StripAllNomNumAlpha(UPPERCASE(FieldByName('NatIDNum').AsString));

                       if NatIDKind(FieldByName('NatIDNum').AsString) = nkUK9 then
                          begin
                             FieldByName('LocateNatID').AsString := UK9NatIDNumber.CreateLocateNatID(UPPERCASE(FieldByName('NatIDNum').AsString));
                          end
                       else
                          begin
                             FieldByName('LocateNatID').AsString := WinData.StripAllNomNumAlpha(UPPERCASE(FieldByName('NatIDNum').AsString));
                             if WinData.UseScanner then
                                begin
                                   if ( Copy(FieldByName('LocateNatID').AsString,1,2) = cTagPrefix_IE ) then
                                      FieldByName('LocateNatID').AsString := Copy(FieldByName('LocateNatID').AsString, 3, MaxInt)
                                   else if ( Copy(FieldByName('LocateNatID').AsString,1,3) = cTagPrefix_372 ) then
                                      FieldByName('LocateNatID').AsString := Copy(FieldByName('LocateNatID').AsString, 4, MaxInt)
                                end;
                          end;
                       Post;
                    except
                       Cancel;
                    end;
                 end;
              Next;
           end;
     finally
        Close;
        Free;
     end;
end;

procedure TMenuForm.WMQueryEndSession(var Message: TWMQueryEndSession);
begin
   Message.Result := 0;
   MessageDlg('Windows shutdown disabled! '+ #13#10 +
              'Please exit from Kingswood Herd before shutting windows down.',mtWarning,[mbOK],0);
end;

procedure TMenuForm.sbHideEventsClick(Sender: TObject);
begin
   sbHideEvents.Down := not sbHideEvents.Down;
   if AnimalsEventsSplitter.State = ssClosed then
      begin
         AnimalsEventsSplitter.State := ssOpened;
         sbHideEvents.Caption := '&Hide Events';
         cbAllEvents.Visible := True;
         cbFeedEvents.Visible := True;
         Update;
      end
   else
      begin
         AnimalsEventsSplitter.State := ssClosed;
         sbHideEvents.Caption := '&Show Events';
         cbAllEvents.Visible := False;
         cbFeedEvents.Visible := False;
         Update;
      end;
end;

procedure TMenuForm.sbDairyBMClick(Sender: TObject);
begin
   with TRationPerformMonitor.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TMenuForm.UpdateAnimalNumberField1Click(Sender: TObject);
begin
   if TUpdateAnimalNo.DoAnimalNoUpdate(WinData.SystemRegisteredCountry) then
      SetupQuery;
end;

procedure TMenuForm.AppMinimize(Sender: TObject);
begin
   ShowWindow(Application.Handle, SW_MINIMIZE);
end;

procedure TMenuForm.AppRestore(Sender: TObject);
begin
   ShowWindow(Application.Handle, SW_SHOWNORMAL);
end;

procedure TMenuForm.RunProActiveActionLists;
begin
   ActionReminderList := TKActionList.Create;
   try
      if ActionReminderList.Enabled then
        if MessageDlg('Would you like to view Pro-Active Action Reminder Reports now?',mtConfirmation,[mbYes,mbNo],0) = idYes then
           begin
              Update;
              ActionReminderFilt.RunReport(rmProAction, ActionReminderList.ReportsToRun);
           end;
   finally
      FreeAndNil(ActionReminderList);
   end;
end;

procedure TMenuForm.DueService2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueForDryingOff.Hide;
      ActionReminderFilter.pDueToCalve.Hide;
      ActionReminderFilter.pDueToPD.Hide;
      ActionReminderFilter.pDueFirstService.Show;
      ActionReminderFilter.Caption := 'Due Service';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.DuePregnancyDiagnosis2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueForDryingOff.Hide;
      ActionReminderFilter.pDueToCalve.Hide;
      ActionReminderFilter.pDueFirstService.Hide;
      ActionReminderFilter.pDueToPD.Show;
      ActionReminderFilter.Caption := 'Due Pregnancy Diagnosis';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
      EnableBtn(Sender);
   end;

end;

procedure TMenuForm.DueForDryingOff2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueFirstService.Hide;
      ActionReminderFilter.pDueToCalve.Hide;
      ActionReminderFilter.pDueToPD.Hide;
      ActionReminderFilter.pDueForDryingOff.Show;
      ActionReminderFilter.Caption := 'Due For Drying Off';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.DueToCalve2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueForDryingOff.Hide;
      ActionReminderFilter.pDueFirstService.Hide;
      ActionReminderFilter.pDueToPD.Hide;
      ActionReminderFilter.pDueToCalve.Show;
      ActionReminderFilter.Caption := 'Due To Calve';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbMilkReportGeneratorRGClick(Sender: TObject);
begin
   MessageDlg('The new Milk Analysis Report Generator will be available soon',mtInformation,[mbOK],0)
end;

procedure TMenuForm.sbDairyHealthCertClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      WinData.CreateAndShowForm(TDairyHerdHealthCert);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbBackupClick(Sender: TObject);
begin
   sbExit.Enabled := False;
   try
      //   07/09/17 [V5.7 R2.3] /MK Bug Fix - Remove filter from main grid before backup to stop errors after backup.
      if WinData.ActiveFilter then
         ClearAnimalSelection();
      TfmDataBackup.execute;
   finally
      sbExit.Enabled := True;
   end;
end;

procedure TMenuForm.sbSCCAnalysisRptClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SCCAnalysis.ShowForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.Settings2Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TPDAReportDefaults);
   if not ExportToPDA.Enabled then // will be disabled before user chooses settings for the first time.
      ExportToPDA.Enabled := True; // only download, reg entries are setup from PDAReportDefaults scr.
end;

procedure TMenuForm.ExportToPDAClick(Sender: TObject);
begin
   CheckSelectedHerd;
   WinData.CreateAndShowForm(TPDAExportSynch);
end;

procedure TMenuForm.CheckSelectedHerd;
begin
   if cbDefaultHerd.Text = 'All Herds' then
      begin
         MessageDlg(cAllHerdsSelected, mtInformation,[mbok],0);
         cbDefaultHerd.DropDown;
         Abort;
      end
end;

procedure TMenuForm.sbCMMSReconClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if FCountry = NIreland then
      WinData.CallProg.HerdReconciliation
   else if FCountry = England then
      TfmCTSCattleOnHolding.Execute
   else
      //   21/03/12 [V5.0 R4.5] /MK Change - New Boolean Check For Reconcile By Cards Checked Here.
      //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
      uHerdRec.CreateAndShow(cbDefaultHerd.KeyValue, False, True);
end;

procedure TMenuForm.DownloadEvents1Click(Sender: TObject);
begin
   WinData.CreatePDAEvents(True);
end;

procedure TMenuForm.EventGridAnimalEventsViewDblClick(Sender: TObject);
var
  P: TPoint;
  AHitTest: TcxCustomGridHitTest;
  EventBookMark : TBookMark;
  iShowCalfID,
  iCountOfAnimals : Integer;
  bChangedCalving : Boolean;

  function GetCountOfAnimals : Integer;
  begin
     with TQuery.Create(nil) do
        try
           DatabaseName := AliasName;
           SQL.Clear;
           SQL.Add('SELECT Count(ID)');
           SQL.Add('FROM Animals');
           try
              Open;
              Result := Fields[0].AsInteger;
           except
              on e : Exception do
                 ShowMessage(e.Message);
           end;
        finally
           Free;
        end;
  end;

begin
   GetCursorPos(P);
   P := TcxGridSite(Sender).ScreenToClient(P);
   AHitTest := TcxGridSite(Sender).GridView.ViewInfo.GetHitTest(P);

   EventBookMark := EventGridAnimalEventsView.DataController.DataSource.DataSet.GetBookmark;

   if AHitTest.HitTestCode = htNavigator then Exit; //check if a navigator button has been clicked

   //your code
   case WinData.EventsEventType.AsInteger of
      CWeightEvent      : Weighing.ShowWeight(AmendWeight);
      CPlannedBull      : Bullings.ShowBulling(AmendPlannedBull);
      CBullingEvent     : Bullings.ShowBulling(AmendBulling);
      CServiceEvent     : Services.ShowService(AmendService);
      CPregDiagEvent    : begin
                             WinData.FPregStatusChanged := False;
                             WinData.EventType := TPregDiag;
                             PregDiag.ShowPD(AmendPD);
                             //   04/12/14 [V5.4 R0.3] /MK Additional Feature - Run SetupQuery if PregStatus has changed or the PD Event was deleted.
                             if ( WinData.FPregStatusChanged ) then
                                SetupQuery(True);
                          end;
      CCalvingEvent     : begin
                             WinData.FCalvingDOBChanged := False;
                             WinData.EventType := TCalving;
                             TfmCalvingEvent.ShowForm(bChangedCalving, iShowCalfID, ctAmendCalving, WinData.AnimalFileByIDID.AsInteger, WinData.Events.FieldByName('ID').AsInteger);
                             //   11/06/19 [V5.8 R9.4] /MK Bug Fix - Check for WinData.CalvingSaved not required here as customer could be going into calving to find calf
                             //                                      without having made changes to the calf i.e. dam, sire, date of birth.
                             if ( iShowCalfID > 0 ) then
                                begin
                                   if ( WinData.AnimalFileByID.Locate('ID',iShowCalfID,[]) ) then
                                      fSetUpAnimals.ShowForm(True);
                                end;
                             //   17/05/17 [V5.6 R8.1] /MK Change - Check to see if the Calving was deleted and refresh the main grid if it was.
                             if ( WinData.CalvingSaved ) or ( WinData.FCalvingDOBChanged ) or ( WinData.CalvingDeleted ) then
                                SetupQuery(True);
                          end;
      CDryOffEvent      : uHealth.ShowHealth(AmendDryingOff);
      CHealthEvent      : uHealth.ShowHealth(AmendHealth);
      //    17/09/12 [V5.0 R9.9] /MK Change - New TAddorAmendHealth type for AmendVaccination.
      CHerdVaccination  : uHealth.ShowHealth(AmendVaccination);
      //   24/01/19 [V5.8 R6.3] /MK Change - Allow edit/view of new Mastitis event.
      CNewMastitisEvent : uHealth.ShowHealth(AmendMastitis);
      //   31/01/19 [V5.8 R6.5] /MK Change - Allow edit/view of new Lameness event.
      CLamenessEvent    : uHealth.ShowHealth(AmendLameness);
      CSaleDeathEvent   : begin
                             if WinData.AnimalFileByIDInHerd.AsBoolean = True then //Check that InHerd = True for PreSale
                                uPreSale.ShowPreSale(AmendPreSale)
                             else
                                uSalesDeaths.ShowSalesDeaths(AmendSaleDeath, False); //Changed procedure call to include PreSales Boolean.
                          end;
      CPurchaseEvent    : begin
                             WinData.EventType := TPurchase;
                             uPurchases.ShowForm;
                             cxAnimalGridView.DataController.BeginFullUpdate;
                             try
                               //   13/06/14 [V5.3 R1.8] /MK Change - If NIreland herd and main grid is showing DaysToFQAS then Close and Open WinData.AnimalFileByID 
                               //                                     as RefreshExternalData does not pick up new change to QADate in Animals table.
                               if ( (FCountry = NIreland) and (not(cxAnimalGridViewDaysToFQAS.Hidden)) ) then
                                  begin
                                     cxAnimalGridView.DataController.DataSource.DataSet.Close;
                                     cxAnimalGridView.DataController.DataSource.DataSet.Open;
                                  end
                               else
                                  cxAnimalGridView.DataController.RefreshExternalData;
                             finally
                               cxAnimalGridView.DataController.EndFullUpdate;
                             end;
                          end;
      CMovementEvent    : uTempMovements.ShowMovement(AmendMovement);
      // Moore Park Start,
      CAbortionEvent    : uMPEvents.ShowTheForm(EABR, AmendAWE, Abortion1.Caption);
      CCastrateEvent    : uMPEvents.ShowTheForm(ECST, AmendAWE, Castrate1.Caption);
      CCondScoreEvent   : begin
                            uMPEvents.ShowTheForm(ECON, AmendAWE, ConditionScore1.Caption);
                            SendMessage(MenuForm.Handle, WM_RefreshGridViewExternalData, 0, 0);
                         end;
      CDiagProblemEvent : uMPEvents.ShowTheForm(EDNP, AmendAWE, DiagnoseProblem1.Caption);
      CEmbryoTransEvent : uMPEvents.ShowTheForm(EIMP, AmendAWE, EmbryoImplantTransfer1.Caption);
      CMastitisEvent    : uMPEvents.ShowTheForm(EMST, AmendAWE, Mastitis1.Caption);
      CToBeCulledEvent  : uMPEvents.ShowTheForm(ETBC, AmendAWE, TobeCulled1.Caption);
      CWeaningEvent     : uMPEvents.ShowTheForm(EWNC, AmendAWE, Wean1.Caption);
      CIntExamEvent     : uMPEvents.ShowTheForm(EINT, AmendAWE, InternalExam1.Caption);
      CStockBullIn      : uMPEvents.ShowTheForm(ERBI, AmendAWE, BullIn1.Caption);
      CStockBullOut     : uMPEvents.ShowTheForm(ERBO, AmendAWE, BullOut1.Caption);
      CMealFeedingEvent : uMPEvents.ShowTheForm(EMLF, AmendAWE, MealFeeding1.Caption);
      CDisbuddingEvent  : uMPEvents.ShowTheForm(EDBU, AmendAWE, Disbudding1.Caption);
      CMilkTemperament  : uMPEvents.ShowTheForm(EMTS, AmendAWE, MilkTemperament1.Caption);
      CJohnesResult     : begin
                             uMPEvents.ShowTheForm(EJOH, AmendAWE, 'Johnes Result');
                             SetUpQuery(True);
                          end;
      CFertilityCheck   : TfmEventForm.LoadEvent(WinData.AnimalFileByIDID.AsInteger,
                                                 WinData.EventID.AsInteger,
                                                 WinData.AnimalFileByIDLactNo.AsInteger, 0, false, TfmFertilityCheckEdit);
      CStockBullEvent   : begin
                             if ( UpperCase(WinData.EventsEventDesc.AsString) = 'STOCK BULL IN' ) then
                                TfmStockBullEvent.ShowTheForm(sbIn, EditEvent)
                             else
                                TfmStockBullEvent.ShowTheForm(sbOut, EditEvent);
                          end
      { Moore Park End. }
   end;

   EventGridAnimalEventsView.DataController.RefreshExternalData;

   //   15/05/13 [V5.1 R7.1] /MK Bug Fix - On delete of events error "Event deleted" appears because bookmark does not exist after delete.
   //                                      Check if BookmarkIsValid before GoTo.
   if ( EventGridAnimalEventsView.DataController.DataSource.DataSet.BookmarkValid(EventBookMark) ) then
      begin
         EventGridAnimalEventsView.DataController.DataSource.DataSet.GotoBookmark(EventBookMark);
         EventGridAnimalEventsView.DataController.DataSource.DataSet.FreeBookmark(EventBookMark);
      end;
end;

procedure TMenuForm.cxAnimalGridViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
   CalcMonth : TDateTime;
   AnimalSex : String;
   UsedForBreeding : Boolean;
   NoMonths : Integer;
   HighlightColour : TColor;
   HighlightBold : Boolean;
   DateOfBirth, AFromDate, AToDate, ADateOver : TDateTime;
   ID : Integer;
   JohnesResult : String;
begin
   if ARecord <> nil then
      begin
         if ARecord.Values[cxAnimalGridViewHerdID.Index] = WinData.NONEHerdID then
            begin
               if ARecord.Values[cxAnimalGridViewAncestor.Index] = False then
                  AStyle := cxStyleNoneHerd
               else
                  AStyle := cxStyleNoneHerdAncestor;
            end
         else
            begin
               AStyle := cxStyleAnimalNormal;

               if ARecord.Values[cxAnimalGridViewID.Index] <> Null then
                  ID := ARecord.Values[cxAnimalGridViewID.Index];

               if ( not VarIsNull(ARecord.Values[cxAnimalGridViewDateOfBirth.Index]) ) and ( not VarIsNull(ARecord.Values[cxAnimalGridViewBreeding.Index]) )
                   and ( not VarIsNull(ARecord.Values[cxAnimalGridViewSex.Index]) ) and ( not VarIsNull(ARecord.Values[cxAnimalGridViewSex.Index]) ) then
                  begin
                     AnimalSex := ARecord.Values[cxAnimalGridViewSex.Index];
                     UsedForBreeding := ARecord.Values[cxAnimalGridViewBreeding.Index];
                     DateOfBirth := ARecord.Values[cxAnimalGridViewDateOfBirth.Index];
                     if ( not VarIsNull(AnimalSex)) and ( not VarIsNull(UsedForBreeding)) then
                        begin
                           if (not UsedForBreeding) then
                              begin
                                 //   04/05/11 [V4.0 R9.9] /MK Bug Fix - Set Style To Normal Animal If Reg DefaultGridDisplay Values Are All Zero.
                                 if ( AnimalSex = cSex_Steer ) then
                                    begin
                                       NoMonths := WinData.GlobalSettings.SteerAttrNoMonthsFrom;
                                       AFromDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.SteerAttrNoMonthsTo;
                                       AToDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.SteerAttrNoMonthsOver;
                                       ADateOver := IncMonth(Date, -NoMonths);

                                       if ( ( WinData.GlobalSettings.SteerAttrNoMonthsFrom = 0)
                                          and ( WinData.GlobalSettings.SteerAttrNoMonthsTo = 0)
                                          and ( WinData.GlobalSettings.SteerAttrNoMonthsOver = 0 ) ) then
                                             AStyle := cxStyleAnimalNormal
                                       else if DateInRange(DateOfBirth, AFromDate, AToDate) then
                                          AStyle := SteersBetween
                                       else if (DateOfBirth<ADateOver) then
                                          AStyle := SteersOver;
                                    end
                                 else if ( AnimalSex = cSex_Female ) and (not UsedForBreeding) then
                                    begin
                                       NoMonths := WinData.GlobalSettings.BeefFemaleAttrNoMonthsFrom;
                                       AFromDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.BeefFemaleAttrNoMonthsTo;
                                       AToDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.BeefFemaleAttrNoMonthsOver;
                                       ADateOver := IncMonth(Date, -NoMonths);

                                       if ( ( WinData.GlobalSettings.BeefFemaleAttrNoMonthsFrom = 0)
                                          and ( WinData.GlobalSettings.BeefFemaleAttrNoMonthsTo = 0)
                                          and ( WinData.GlobalSettings.BeefFemaleAttrNoMonthsOver = 0 ) ) then
                                             AStyle := cxStyleAnimalNormal
                                       else if DateInRange(DateOfBirth, AFromDate, AToDate) then
                                          AStyle := BeefHeifersBetween
                                       else if (DateOfBirth<ADateOver) then
                                          AStyle := BeefHeifersOver;
                                    end
                                 else if ( AnimalSex = cSex_Bull ) and (not UsedForBreeding) then
                                    begin
                                       NoMonths := WinData.GlobalSettings.BeefBullAttrNoMonthsFrom;
                                       AFromDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.BeefBullAttrNoMonthsTo;
                                       AToDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.BeefBullAttrNoMonthsOver;
                                       ADateOver := IncMonth(Date, -NoMonths);

                                       if ( ( WinData.GlobalSettings.BeefBullAttrNoMonthsFrom = 0)
                                          and ( WinData.GlobalSettings.BeefBullAttrNoMonthsTo = 0)
                                          and ( WinData.GlobalSettings.BeefBullAttrNoMonthsOver = 0 ) ) then
                                             AStyle := cxStyleAnimalNormal
                                       else if DateInRange(DateOfBirth, AFromDate, AToDate) then
                                          AStyle := BeefBullsBetween
                                       else if (DateOfBirth<ADateOver) then
                                          AStyle := BeefBullsOver;
                                    end;
                              end
                        end;
                     if (ID>0) then
                        begin
                           if AnimalCart.InCart(ID) then
                              AStyle.Color := clSilver
                           else
                              AStyle.Color := $20000000;
                        end;
                  end;

               if ( cxAnimalGridViewJohnesResult.Visible ) then
                  if ( not(VarIsNull(ARecord.Values[cxAnimalGridViewJohnesResult.Index])) ) then
                     begin
                        JohnesResult := ARecord.Values[cxAnimalGridViewJohnesResult.Index];
                        if ( JohnesResult = '1' ) then
                            AStyle := JohnesLow
                        else if ( JohnesResult = '2' ) then
                            AStyle := JohnesMedium
                        else if ( JohnesResult = '3' ) then
                            AStyle := JohnesHigh;
                     end;
            end;

         if ( FQuickFilter = qfBullsInUse ) then
            try
               if ( VarIsNull(ARecord.Values[cxAnimalGridViewBreedCode.Index]) ) then
                  AStyle := cxStyleBullNoBreed;
            except
               on e : Exception do
                  ShowDebugMessage(e.Message);
            end;
      end;
end;

procedure TMenuForm.cxAnimalGridViewSortNatIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[cxAnimalGridViewNatIDNum.Index]
   else
      AText := '';
   WinData.FMainGridSortBy := mgsbNatIDNum;
end;

procedure TMenuForm.cxAnimalGridViewSortAnimalNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[cxAnimalGridViewAnimalNo.Index]
   else
      AText := '';
   WinData.FMainGridSortBy := mgsbAnimalNo;
end;

procedure TMenuForm.cxAnimalGridViewRTGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   AText := '';
   if ARecord <> nil then
      begin
         if ARecord.Values[cxAnimalGridViewRT.Index] = True then
            AText := 'RT';
      end;
end;

procedure TMenuForm.cxAnimalGridViewTTGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   AText := '';
   if ARecord <> nil then
      begin
         if ARecord.Values[cxAnimalGridViewTT.Index] = True then
            AText := 'TT';
      end;
end;

procedure TMenuForm.AnimalsEventsSplitterAfterClose(Sender: TObject);
begin
   sbHideEvents.Caption := '&Show Events';
   cbAllEvents.Visible := False;
   cbFeedEvents.Visible := False;
end;

procedure TMenuForm.AnimalsEventsSplitterBeforeOpen(Sender: TObject;
  var NewSize: Integer; var AllowOpen: Boolean);
begin
   sbHideEvents.Caption := '&Hide Events';
   cbAllEvents.Visible := True;
   cbFeedEvents.Visible := True;
end;

procedure TMenuForm.sbGroupUpdateClick(Sender: TObject);
begin
   Update;
   TfmGroupUpdate.ShowForm(WinData.AnimalFileByIDID.AsInteger);
end;

procedure TMenuForm.EventGridFeedEventsViewDblClick(Sender: TObject);
begin
   if ( WinData.FeedEvents.RecordCount > 0 ) then
      TfmFeedAllocEdit.ShowTheForm;
end;

procedure TMenuForm.cxAnimalGridViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
   if cxAnimalGridView.DataController.DataSet.State = dsBrowse then
      //   23/07/18 [V5.8 R1.3] /MK Change - Changed lRecNo from "'RecNo' of 'RecordCount'" to "'RecordCount' animals ('RecNo')" - GL.
      if cxAnimalGridView.DataController.Filter.FilterText = '' then
         lRecNo.Caption := IntToStr(cxAnimalGridView.DataController.DataSet.RecordCount) + ' animals ('+IntToStr(cxAnimalGridView.DataController.GetFocusedRowIndex + 1)+')'
      else
         lRecNo.Caption := IntToStr(cxAnimalGridView.DataController.RecordCount) + ' animals ('+IntToStr(cxAnimalGridView.DataController.GetFocusedRowIndex + 1)+')';

   if AFocusedRecord <> nil then
      begin
         if EventGridAnimalEventsView.DataController.RecNo > 0 then
            begin
               EventGridAnimalEventsView.DataController.FocusedRowIndex := 0;
            end;
         if ( FQuickFilter = qfDeletedAnimals ) then
            cxAnimalGrid.PopupMenu := pmUndeleteAnimal
         else
            cxAnimalGrid.PopupMenu := pmAnimalGridPopup;
      end;
end;

procedure TMenuForm.cxAnimalGridViewDataControllerFilterBeforeChange(
  Sender: TcxDBDataFilterCriteria; ADataSet: TDataSet;
  const AFilterText: String);
begin
   if AFilterText <> '' then
      begin
         if not WinData.ActiveFilter then
            begin
               WinData.ActiveFilter := True;
               //   13/07/12 [V5.0 R7.8] /MK Change - Also Enabled The Clear Select Button.
               btnClearSelect.Visible := True;
            end;

         LastHerdID := WinData.UserDefaultHerdID;

         btnTopFilter.Caption := 'Fi&lter On ';
         btnTopFilter.Font.Size := 10;
         btnTopFilter.Font.Style := [fsBold,fsItalic];
         btnTopFilter.Font.Color := clBlue;
      end
   //   else if not WinData.ActiveFilter then
   //   12/10/11 [V5.0 R1.4] /MK Bug Fix - ActiveFilter Is On Not Off.
   else if ( AFilterText = '' ) and ( not(IsFilterFormActive) ) and ( FQuickFilter = qfNone ) then
      begin
         WinData.ActiveFilter := False;
         btnTopFilter.Caption := 'Fi&lter';
         btnTopFilter.Font.Size := 8;
         btnTopFilter.Font.Style := [];
         btnTopFilter.Font.Color := clBlack;

         btnClearSelect.Visible := False;
      end;

   pmiReverseFilter.Visible := WinData.ActiveFilter;
   N50.Visible := pmiReverseFilter.Visible;

   pmiCreateFromFilter.Visible := ( WinData.ActiveFilter ) and ( WinData.FilteredAnimals.RecordCount > 0 );
   N54.Visible := pmiCreateFromFilter.Visible;

   Update;
end;

procedure TMenuForm.CreateEBIValuesYoungstockonly1Click(Sender: TObject);
var
   iAnimalUpdateCount : Integer;
begin
   try
      Screen.Cursor := crHourGlass;
      iAnimalUpdateCount := 0;
      if ( MessageDlg('The new EBI value will be derived from the Dam and Sire of the animal.' + cCRLF + cCRLF +
                      'Update all young stock with derived EBI values?',mtConfirmation,[mbYes,mbNo],0) = idYes ) then
         begin
            iAnimalUpdateCount := WinData.CreateYoungStockEBIValues(WinData.UserDefaultHerdID);
            MessageDlg(IntToStr(iAnimalUpdateCount)+' young stock updated',mtInformation,[mbOK],0);
            //   10/03/16 [V5.5 R5.4] /MK Change - Run SetupQuery if animals were updated by WinData.CreateYoungStockEBIValues.
            if ( iAnimalUpdateCount > 0 ) then
               SetUpQuery;
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.cxAnimalGridViewNatIDNumHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewNatIDNum.Index );
end;

procedure TMenuForm.cxAnimalGridViewAnimalNoHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewAnimalNo.Index );
end;

procedure TMenuForm.cxAnimalGridViewSexHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewSex.Index );
   WinData.FMainGridSortBy := mgsbSex;
end;

procedure TMenuForm.cxAnimalGridViewDateOfBirthHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewDateOfBirth.Index );
   WinData.FMainGridSortBy := mgsbDateofBirth;
end;

procedure TMenuForm.cxAnimalGridViewLactNoHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewLactNo.Index );
end;

procedure TMenuForm.cxAnimalGridViewNameHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewName.Index );
   WinData.FMainGridSortBy := mgsbName;
end;

procedure TMenuForm.cxAnimalGridViewHerdBookNoHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewHerdBookNo.Index );
end;

procedure TMenuForm.cxAnimalGridViewBirthWeightHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewBirthWeight.Index );
end;

procedure TMenuForm.cxAnimalGridViewBrucellosisHeaderClick(
  Sender: TObject);
begin
  ResetColumnHeader( cxAnimalGridViewBrucellosis.Index );
end;

procedure TMenuForm.cxAnimalGridViewTBTestDateHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewTBTestDate.Index );
end;

procedure TMenuForm.ResetColumnHeader(const ASelectedColumnIndex : Integer);
var
   ColIndex : Integer;
begin
   for ColIndex := 0 to cxAnimalGridView.ColumnCount-1 do
      begin
         if ColIndex = ASelectedColumnIndex then
            begin
               if cxAnimalGridView.Columns[ColIndex] <> nil then
                  cxAnimalGridView.Columns[ColIndex].Styles.Header := SelectedColumnHeader;
            end
         else
            begin
               if cxAnimalGridView.Columns[ColIndex] <> nil then
                  cxAnimalGridView.Columns[ColIndex].Styles.Header := DefaultColumnHeader;
            end;
      end;
end;

procedure TMenuForm.UpdateAnimalLactations1Click(Sender: TObject);
begin
   if ( WinData.AnimalFileByIDSex.AsString = cSex_Female ) then
      begin
         if UpdateLactNo(WinData.AnimalFileByIDID.AsInteger) then
            begin
               SetupQuery;
            end;
      end
   else
      MessageDlg('The animal selected is not a female animal.',mtInformation,[mbOK],0)
end;

procedure TMenuForm.tbDownloadClick(Sender: TObject);
begin
   Download;
end;

procedure TMenuForm.sbProfitMonitorSummaryClick(Sender: TObject);
begin
   CheckSelectedHerd;
   HerdLookup.HerdOwnerData.HerdID := WinData.UserDefaultHerdID;
   if HerdLookup.HerdOwnerData.HerdType = cDairyHerd then
      LiveStkClass.RunReport(WinData.UserDefaultHerdID)
   else
      TfmBeefProfitMonitor.Execute(WinData.UserDefaultHerdID)
end;

procedure TMenuForm.UpdateStatusBar;
begin
   StatusBar.Panels.Items[1].Text := HerdVerNo; // Set the Version Number into the Panel.
   if WinData.UseScanner then
      StatusBar.Panels.Items[2].Text := cBarCodeScannerOnCaption
   else
      StatusBar.Panels.Items[2].Text := cBarCodeScannerOffCaption;
   if WinData.SearchField = 'AnimalNo' then
      StatusBar.Panels.Items[3].Text := 'Search By: '+cxAnimalGridViewAnimalNo.Caption
   else
      StatusBar.Panels.Items[3].Text := 'Search By: '+cxAnimalGridViewNatIDNum.Caption;
   try
      StatusBar.Panels.Items[4].Text := 'Herd Type: '+ HerdLookup.GetHerdTypeAsString(StrToInt(cbDefaultHerd.Value));
   except
      StatusBar.Panels.Items[4].Text := '';
   end;
   StatusBar.Panels.Items[5].Text := 'Database: '+ExtractDirFromPath(ExcludeTrailingBackslash(WinData.KingData.Directory));
end;

procedure TMenuForm.eNatIDNumEnter(Sender: TObject);
begin
   //if eNatIDNum.Text = 'IE' then
     // eNatIDNum.SelStart := 3;
end;

procedure TMenuForm.RxSpeedButton4Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfmAccsReps)
end;

procedure TMenuForm.ViewAnimal;

   procedure ViewSetUpScr;
   var
      MyBookMark : TBookMark;
      OldRecNo : Integer;
      CallSetupQuery : Boolean;
   begin
      // open form for viewing (add = false, view = true)
      Update;

      try
         cxAnimalGridView.DataController.BeginFullUpdate;
         cxAnimalGridView.DataController.LockDataChangedNotify;
         CallSetupQuery := fSetUpAnimals.ShowForm(True);
      finally
         cxAnimalGridView.DataController.EndFullUpdate;
         SetupServicesBtn;
      end;
   end;

var
   AValue : Variant;
   ViewAnimalScr : Boolean;
begin
    ViewAnimalScr := True;
    with cxAnimalGridView.DataController do
       begin
          AValue := Values[FocusedRecordIndex, GetItemByFieldName('RT').Index];
          if not VarIsNull(AValue) then
             begin
                if AValue = True then
                   begin
                      if MessageDlg('Do you wish to view the Retag Screen?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                         uReTagScr.ShowTheForm(Retag)
                   end
             end;

          AValue := Values[FocusedRecordIndex, GetItemByFieldName('TT').Index];
          if not VarIsNull(AValue) then
             begin
                if AValue = True then
                   begin
                      if MessageDlg('Do you wish to view the Temporary Tag Screen?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                         uReTagScr.ShowTheForm(Temptag)
                   end
             end;
          ViewSetUpScr;
       end;
end;

procedure TMenuForm.DoLocate(var Message: TMessage);
var
  AView: TcxGridDBTableView;
  ARecordIndex: integer;
begin
  AView := TcxGridDBTableView(TObject(Message.lParam));
  ARecordIndex := Integer(Message.wParam);
  with AView.DataController do
    LocateByKey(WinData.AnimalFileByIDID.AsInteger);
end;

procedure TMenuForm.cxAnimalGridViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
   ViewAnimal;
   //if RecordIndex <> -1 then
   //  PostMessage(Handle, WM_Locate, Integer(RecordIndex),Integer(TcxGridDBTableView(TcxGridSite(Sender).GridView)));
   AHandled := True;
end;

procedure TMenuForm.actPrintGridExecute(Sender: TObject);
begin
   if Length(ComponentPrinter.PrintTitle) = 0 then
      ComponentPrinter.PrintTitle := 'Kingswood Grid Print';
   if not AnimalGridPrinterLink.PreviewExists then
      AnimalGridPrinterLink.Preview;
end;

procedure TMenuForm.actEventHistoryExecute(Sender: TObject);
var
   AllAnimalsShown : Boolean;
begin
   Application.ProcessMessages;
   Update;

   {
   if ( not(WinData.ActiveFilter) ) then
      if ( not(WinData.ShowAllAnimals) ) then
         begin
            Application.ProcessMessages;
            Update;
            AllAnimalsShown := False;
            cbAllAnimals.Checked := True;
            cbAllAnimalsClick(cbAllAnimals);
            Application.ProcessMessages;
            Update;
         end
      else
         AllAnimalsShown := True;
   }

   cbAllEvents.Checked := True;
   cbAllEventsClick(cbAllEvents);

   Screen.Cursor := crHourGlass;
   try
      cxAnimalGridView.DataController.BeginFullUpdate;
   finally
      Screen.Cursor := crDefault;
   end;

   try
      //   17/01/12 [V5.0 R3.5] /MK Change - New Procedure To Allow ForceBlockDelete From Another Form.
      uEventFilter.ShowTheForm(False);
   finally
      screen.Cursor := crHourGlass;
      try
         cxAnimalGridView.DataController.EndFullUpdate;
      finally
         Screen.Cursor := crDefault;
      end;
   end;

   {
   if ( not(WinData.ActiveFilter) ) then
      if ( not(AllAnimalsShown) ) then
         begin
            cbAllAnimals.Checked := False;
            cbAllAnimalsClick(cbAllAnimals);
         end;
   }

   cbAllEvents.Checked := False;
   cbAllEventsClick(cbAllEvents);

   Update;
   Application.ProcessMessages;
end;

procedure TMenuForm.actClearFilterExecute(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   Enabled := False;
   try
      if ( WinData.ActiveFilter ) or ( AllAnimalsShowing ) or
         ( cxAnimalGridView.DataController.Filter.Active ) or ( AnimalCartFiltered ) then
         begin
            //   07/06/12 [V5.0 R7.0] /MK Additional Feature - Set QuickFilter Back To None.
            FQuickFilter := qfNone;
            SetLength(FAnimalFilterArray, 0);
            FreeAndNil(FAnimalFilterArray);
            FAnimalFilterArray := nil;

            WinData.FFilterByNotInGroup := False;
            btnClearSelect.Visible := False;
            btnShowAnimalsOptions.Caption := 'Select Category';
            btnShowAnimalsOptions.Enabled := True;
            pmiCurrentHerd.Visible := False;
            ClearFilter1.Visible := False;

            cbAllAnimals.Checked := False;
            WinData.ShowAllAnimals := cbAllAnimals.Checked;
            cbAllAnimals.Font.Color := clBlack;
            WinData.ActiveFilter := False;
            fFilters.ResetFilters;
            AllAnimalsShowing := False;

            fFilters.AIBullSQL := '';
            fFilters.LeftHerdSQL := '';

            if cxAnimalGridView.DataController.Filter.Active then
               begin
                  cxAnimalGridView.DataController.Filter.beginUpdate;
                  cxAnimalGridView.DataController.Filter.Clear;
                  cxAnimalGridView.DataController.Filter.EndUpdate;
                  cxAnimalGridView.DataController.Filter.Active := False;
               end;

            if AnimalCartFiltered then
               AnimalCartFiltered := False;

            Menuform.SetUpQuery(True);
            cbDefaultHerd.KeyValue := LastHerdID;
            cbDefaultHerd.Enabled := WinData.MultiHerd;

            pmiReverseFilter.Visible := WinData.ActiveFilter;
            N50.Visible := pmiReverseFilter.Visible;

            pmiCreateFromFilter.Visible := ( WinData.ActiveFilter ) and ( WinData.FilteredAnimals.RecordCount > 0 );
            N54.Visible := pmiCreateFromFilter.Visible;

            DeleteSelectedAnimal1.Visible := ( FQuickFilter <> qfDeletedAnimals ) and ( WinData.AnimalFileByID.RecordCount > 0 );
         end;
   finally
      Enabled := True;
      Screen.Cursor := crDefault;
      SetupQuery(True);
   end;
end;

procedure TMenuForm.cxAnimalGridViewSortAnimalNoHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewSortAnimalNo.Index );
   WinData.FMainGridSortBy := mgsbAnimalNo;
end;

procedure TMenuForm.cxAnimalGridViewSortNatIDHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewSortNatID.Index );
   WinData.FMainGridSortBy := mgsbNatIDNum;
end;

procedure TMenuForm.cxAnimalGridViewEBIHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewEBI.Index );
end;

procedure TMenuForm.cxAnimalGridViewBreedCodeHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewBreedCode.Index );
end;

procedure TMenuForm.cxAnimalGridViewColourCodeHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewColourCode.Index );
end;

procedure TMenuForm.cxAnimalGridViewRTHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewRT.Index );
end;

procedure TMenuForm.cxAnimalGridViewTTHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewTT.Index );
end;

procedure TMenuForm.cxAnimalGridViewDamAnimalNoHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewDamAnimalNo.Index );
end;

procedure TMenuForm.cxAnimalGridViewDamNoHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewDamNo.Index );
end;

procedure TMenuForm.cxAnimalGridViewSireNoHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewSireNo.Index );
end;

procedure TMenuForm.cxAnimalGridViewDamAnimalNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
begin
   AText := WinData.SortAnimalNoString(AText);
end;

procedure TMenuForm.cxAnimalGridViewSireNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
begin
   AText := WinData.SortAnimalNoString(AText);
end;

procedure TMenuForm.cxAnimalGridViewDamAnimalNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      if ARecord.Values[cxAnimalGridViewDamAnimalNoHidden.Index] <> Null then
         AText := ARecord.Values[cxAnimalGridViewDamAnimalNoHidden.Index]
      else
         AText := '';
end;

procedure TMenuForm.cxAnimalGridViewDamNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      if ARecord.Values[cxAnimalGridViewDamNoHidden.Index] <> Null then
         AText := ARecord.Values[cxAnimalGridViewDamNoHidden.Index]
      else
         AText := '';
end;

procedure TMenuForm.cxAnimalGridViewSireNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      if ARecord.Values[cxAnimalGridViewSireNoHidden.Index] <> Null then
         AText := ARecord.Values[cxAnimalGridViewSireNoHidden.Index]
      else
         AText := '';
end;

procedure TMenuForm.cxAnimalGridViewDamAnimalNoGetFilterValues(
  Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
begin
   cxUtils.GetFilterValueList(cxAnimalGridViewDamIDHidden,AValueList,False);
end;

procedure TMenuForm.cxAnimalGridViewDamNoGetFilterValues(
  Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
begin
   cxUtils.GetFilterValueList(cxAnimalGridViewDamIDHidden,AValueList,False);
end;

procedure TMenuForm.cxAnimalGridViewSireNoGetFilterValues(
  Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
var
  ValueList: TcxDataFilterValueList;
begin
   cxUtils.GetFilterValueList(cxAnimalGridViewSireIDHidden, AValueList, False);
end;

procedure TMenuForm.cxAnimalGridViewDamNoGetFilterDisplayText(
  Sender: TcxCustomGridTableItem; const AValue: Variant;
  var ADisplayText: String);
var
   DisplayValue : Variant;
begin
   try
   if ( AValue <> Null ) then
      begin
         DisplayValue := WinData.DamQuery.Lookup('ID', AValue, 'NatIDNum');
         if ( DisplayValue <> Null ) then
            ADisplayText := DisplayValue
         else if AValue >= 0 then
            ADisplayText := '';
      end;
   finally
   end;
end;

procedure TMenuForm.cxAnimalGridViewSireNoGetFilterDisplayText(
  Sender: TcxCustomGridTableItem; const AValue: Variant;
  var ADisplayText: String);
var
   DisplayValue : Variant;
begin
   try
    if ( AValue <> Null ) then
      begin
         DisplayValue := WinData.SireQuery.Lookup('ID', AValue, 'AnimalNo');
         if ( DisplayValue <> Null ) then
            ADisplayText := DisplayValue
         else if AValue >= 0 then
            ADisplayText := '';
      end;
   finally
   end;
end;

procedure TMenuForm.cxAnimalGridViewDamAnimalNoGetFilterDisplayText(
  Sender: TcxCustomGridTableItem; const AValue: Variant;
  var ADisplayText: String);
var
   DisplayValue : Variant;
begin
   try
   if ( AValue <> Null ) then
      begin
         DisplayValue := WinData.DamQuery.Lookup('ID', AValue, 'AnimalNo');
         if ( DisplayValue <> Null ) then
            ADisplayText := DisplayValue
         else if AValue >= 0 then
            ADisplayText := '';
      end;
   finally
   end;
end;

procedure TMenuForm.BreedingPageControlDrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
   if TcxPageControl(AControl).ActivePageIndex = ATab.Index then
      begin
         Font.Color := clBlue;
      end;
end;

procedure TMenuForm.SeasonalCalvingHerds1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      TfFertIndicesRpt.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.SpreadCalvingHerds1Click(Sender: TObject);
begin
   PreviewReproductiveSummary;
end;

procedure TMenuForm.PremiumHistoryReport1Click(Sender: TObject);
begin
   StockInHerdFilt.ShowForm(Premiums);
end;

procedure TMenuForm.miDARDDairyFertilityBenchmarksClick(Sender: TObject);
begin
   CheckSelectedHerd;
   TfmFertilityBenchmarking.Show;
end;

procedure TMenuForm.AnimalGridNavBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
   case Button of
      nbFirst : begin
                   if cxAnimalGridView.DataController.FocusedRowIndex <> 0 then
                      cxAnimalGridView.DataController.FocusedRowIndex := 0;
                end;
      nbPrior : begin
                   if cxAnimalGridView.DataController.FocusedRowIndex > 0 then
                      cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.FocusedRowIndex-1;
                end;
      nbNext  : begin
                   if cxAnimalGridView.DataController.FocusedRowIndex < cxAnimalGridView.DataController.DataSet.RecordCount then
                      cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.FocusedRowIndex+1;
                end;
      nbLast  : begin
                   if cxAnimalGridView.DataController.FocusedRowIndex < cxAnimalGridView.DataController.DataSet.RecordCount then
                      cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.DataSet.RecordCount;
                end;
   end;
   Abort;
end;

procedure TMenuForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
   DoAutoBackup,
   FarmSyncConfigured : Boolean;
begin
   HideHintStyleController;
   FShutdownInProgress := True;
   DoAutoBackup := False;

   if ( WinData.ActiveFilter ) then
      WinData.ActiveFilter := False;

   FarmSyncConfigured := ( TfmFarmSyncSettings.SyncConfigured(DataDir, WinData.GetSyncingHerd(), stHerd) );
   if ( FarmSyncConfigured ) then
      begin
         // 14/10/14 [V5.3 R7.5] /MK Additional Feature - Only allow auto backup if FarmSync events on exit of herd is greater than
         // FarmSync events calculated on entry to program and the FarmSync update is not required.
         //   16/09/15 [V5.4 R8.5] /MK Additional Feature - Store the amount of sync data (animals, events, medicines, etc) when the program closes.
         WinData.SetSessionStateCount(False);
         //   15/09/15 [V5.4 R8.5] /MK Additional Feature - Store the amount of sync data (animals, events, medicines, etc) when the program closes.
         //   23/08/17 [V5.7 R2.1] /MK Change - Only do auto backup if sync on startup.
         DoAutoBackup := ( (TfmFarmSyncSettings.SyncOnProgramStartup(DataDir, stHerd, WinData.UserDefaultHerdId)) and
                           (WinData.SessionState.DbChanged) and (not(WinData.SessionState.FarmSyncUpdateRequired)) );
      end;

   if ( DoAutoBackup ) then
      try
         Screen.Cursor := crHourGlass;
         sbExit.Enabled := False;
         cxAnimalGrid.Enabled := False;
         cxAnimalGridView.BeginUpdate;
         EventGridAnimalEventsView.BeginUpdate;
         TfmDataBackup.BackupData();
      except
      end
   else
      begin
         //   25/08/11 [V5.0 R0.3] /MK Additional Feature - Show Backup Warning On FormClose.
         if ( WinData.GlobalSettings.BackupReminder ) and
            ( WinData.LastBackUpDate > 0 ) and ( (WinData.LastBackUpDate + 30) < Date ) and
            //   27/08/18 [V5.8 R2.5] /MK Change - Don't give reminder to backup if IP is blacklisted - SP.
            ( not(WinData.IsBlacklistedIP) ) then
            begin
               if MessageDLG('It is ' + FloatToStrF(Date() - WinData.LastBackUpDate, ffFixed, 4 , 0 ) + ' Days since you took a Backup' + #13#10 +
                             'Do you want to take one now',mtWarning,[mbYes,mbNo],0) = mrYes then
                  bBackUpClick(Sender);
                  Update;
            end
      end;

   Application.Terminate;
   Application.ProcessMessages;
end;

procedure TMenuForm.MachineryLinkClick(Sender: TObject);
begin
   WinData.CallProg.Machinery;
end;

procedure TMenuForm.sbCAFREFertListClick(Sender: TObject);
begin
   WinData.CreateAndShowForm( TfmCAFREFertListData );
end;

procedure TMenuForm.HintStyleControllerShowHint(Sender: TObject;
  var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo);
begin
   HintInfo.HideTimeout := 50;
end;

procedure TMenuForm.SetNatIDSearchText;
begin
   if ( cmboSearchColumns.ItemIndex = 1 ) and ( WinData.GlobalSettings.UseIEPrefixForNatIDSearch ) then
      begin
         teSearchText.Properties.OnChange := nil;
         teSearchText.Text := 'IE';
         teSearchText.Properties.OnChange := teSearchTextPropertiesChange;
      end;
end;

procedure TMenuForm.FormShow(Sender: TObject);
begin
   Invalidate();
   Update;

   cxAnimalGridView.DataController.FocusedRowIndex := 0;
   FFilterWarning := True;
   AnimalCommentDBNavigator.ShowHint := ( WinData.GlobalSettings.DisplayAnimalComments );

   {$IFDEF DEBUG}
   ShowMessage('This is a debug version');
   {$ENDIF}
end;

procedure TMenuForm.AddAnimal;
var
  id : Integer;
begin
   try
      cxAnimalGridView.DataController.BeginFullUpdate;
      cxAnimalGridView.DataController.LockDataChangedNotify;
      WinData.AnimalFileByID.Append;
      try
         // open form for adding (add = false, view = true)
         fSetUpAnimals.ShowForm(False);

         id := WinData.AnimalFileByIDID.AsInteger;
         WinData.AnimalFileByID.DisableControls;
         Screen.Cursor := crHourGlass;
         try
            WinData.AnimalFileByID.Close;
            WinData.AnimalFileByID.Open;
            cxAnimalGridView.Datacontroller.BeginLocate;
            try
               WinData.AnimalFileByID.Locate('ID', id, []);
               Update;
            finally
               cxAnimalGridView.Datacontroller.EndLocate;
            end;

         finally
            Screen.Cursor := crDefault;
            WinData.AnimalFileByID.EnableControls;
            SetupServicesBtn;
         end;
      except
         WinData.AnimalFileByID.Cancel;
      end;
   finally
      cxAnimalGridView.DataController.UnLockDataChangedNotify;
      cxAnimalGridView.DataController.EndFullUpdate;
   end;
   Update;
end;

procedure TMenuForm.sbAddAnimalTypeClick(Sender: TObject);
begin
   AddAnimal;
end;

procedure TMenuForm.cxAnimalGridViewEBIGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if AText <> '' then
      AText := AText + '   '; // pad out ebi value as so the value is not abscured by the proceeding column grid value
end;

procedure TMenuForm.DueToBeCulled1Click(Sender: TObject);
begin
   uDueToBeCulled.ShowForm;
end;

procedure TMenuForm.InherdAnimalClick(Sender: TObject);
begin
   CheckSelectedHerd;
   AddAnimal;
end;

procedure TMenuForm.AISireProvenDairyClick(Sender: TObject);
begin
   BrowseSireRegister1Click(BrowseSireRegister);
end;

procedure TMenuForm.AISireTestBeefClick(Sender: TObject);
begin
   fSetUpAnimals.DefaultAnimalType := atAIBullTestBeef;
   AddAnimal;
end;

procedure TMenuForm.NonHerdAncestor1Click(Sender: TObject);
begin
   fSetUpAnimals.DefaultAnimalType := atNonHerdAncestor;
   AddAnimal;
end;

procedure TMenuForm.sbGroupSalesClick(Sender: TObject);
begin
   uGroupSetUp.ShowTheForm(0, True);
end;

procedure TMenuForm.CMMSPermitsClick(Sender: TObject);
begin
   Update;
   uCMMSPermits.ShowForm(WinData.UserDefaultHerdID,0,NBAS31A);
   Update;
end;

procedure TMenuForm.MovementsInClick(Sender: TObject);
begin
   Update;
   CheckSelectedHerd;
   TfmMartImport.open(mftAHPIS,WinData.userDefaultHerdID);
   SetUpQuery;
   Update;
end;

procedure TMenuForm.sbPurchaseClick(Sender: TObject);
begin
   fSetUpAnimals.DefaultAnimalType := atPurchasing;
   AddAnimal;
end;

procedure TMenuForm.SwitchTo1Click(Sender: TObject);
begin
   TfmHUKIFarmEvents.InitializeExport(WinData.UserDefaultHerdID);
end;

procedure TMenuForm.ViewAnimalEvent1Click(Sender: TObject);
begin
   EventGridAnimalEventsViewDblClick(EventGridAnimalEventsView);
end;

procedure TMenuForm.actNavFirstExecute(Sender: TObject);
begin
// V3.8 R0.5
   cxAnimalGridView.DataController.FocusedRowIndex := 0;
end;

procedure TMenuForm.actNavFirstUpdate(Sender: TObject);
begin
// V3.8 R0.5
   actNavFirst.Enabled := cxAnimalGridView.DataController.FocusedRowIndex > 0;
end;

procedure TMenuForm.actNavPreviousUpdate(Sender: TObject);
begin
// V3.8 R0.5
   actNavPrevious.Enabled := cxAnimalGridView.DataController.FocusedRowIndex > 0;
end;

procedure TMenuForm.actNavNextUpdate(Sender: TObject);
begin
// V3.8 R0.5
   actNavNext.Enabled := not ( cxAnimalGridView.DataController.FocusedRowIndex + 1 =
                               cxAnimalGridView.DataController.RecordCount )
end;

procedure TMenuForm.actNavLastExecute(Sender: TObject);
begin
// V3.8 R0.5
   if cxAnimalGridView.DataController.FocusedRowIndex < cxAnimalGridView.DataController.DataSet.RecordCount then
      cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.DataSet.RecordCount;
end;

procedure TMenuForm.actNavLastUpdate(Sender: TObject);
begin
// V3.8 R0.5
   actNavLast.Enabled := not ( cxAnimalGridView.DataController.FocusedRowIndex + 1 =
                               cxAnimalGridView.DataController.RecordCount )

end;

procedure TMenuForm.actNavPreviousExecute(Sender: TObject);
begin
// V3.8 R0.5
   cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.FocusedRowIndex-1;
end;

procedure TMenuForm.actNavNextExecute(Sender: TObject);
begin
// V3.8 R0.5
   if cxAnimalGridView.DataController.FocusedRowIndex < cxAnimalGridView.DataController.DataSet.RecordCount then
      cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.FocusedRowIndex+1;
end;

procedure TMenuForm.ICBFEventRegistration1Click(Sender: TObject);
begin
   uICBFEventExport.ShowTheForm;
end;

//   17/02/11 [V4.0 R8.2] /MK Change - Changed CIS Export To Kay Carson Weekly Export.
procedure TMenuForm.CreateWeeklyDiaryEvents1Click(Sender: TObject);
begin
   TfmFertilityAnalysis.ShowForm;
end;

procedure TMenuForm.DiseaseTestStatus2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      // KB's TB test Date Report
      uTBTestDtRep.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;

end;

procedure TMenuForm.Historical1Click(Sender: TObject);
begin
   Update;
   AnimalWaste.CreateAndShow;
   Update;
end;

procedure TMenuForm.AddNewBreed1Click(Sender: TObject);
begin
   SetUpBreeds.ShowTheForm(TRUE);
end;

procedure TMenuForm.sbMachineryClick(Sender: TObject);
begin
   WinData.CallProg.Machinery;
end;

procedure TMenuForm.sbMartMovementsClick(Sender: TObject);
begin
   ShowMartImport;
end;

procedure TMenuForm.TemporaryMovement2Click(Sender: TObject);
begin
   // Create and Show the Temporary Movements Form
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      uTempMovements.ShowMovement(AddMovement);
end;

procedure TMenuForm.GettingStarted1Click(Sender: TObject);
begin
   ShowGettingStarted(True);
end;

procedure TMenuForm.ShowGettingStarted(AUserView : Boolean);
begin
   Screen.Cursor := crHourGlass;
   try
      cxAnimalGridView.DataController.BeginFullUpdate;
      EventGridAnimalEventsView.DataController.BeginFullUpdate;
   finally
      Screen.Cursor := crDefault;
   end;

   try
      if AUserView then
         TfmGettingStarted.Run(False, WinData.SystemRegisteredCountry)
      else
         begin
            WinData.GlobalSettings.DisplayGettingStarted := ( not TfmGettingStarted.Run(True,WinData.SystemRegisteredCountry) );
            WinData.SavePreferences;
         end;

      SetupQuery;
   finally
      Screen.Cursor := crHourGlass;
      try
         cxAnimalGridView.DataController.EndFullUpdate;
         EventGridAnimalEventsView.DataController.EndFullUpdate;
      finally
         Screen.Cursor := crDefault;
      end;
      Email1.Visible := ((WinData.SystemRegisteredCountry=Ireland) and (WinData.DefaultEmailClient <> cEmailClient_MS));
   end;
end;

procedure TMenuForm.ShowReportsScreen(var msg: TMessage);
var
   pt : TPoint;
begin
   if msg.Msg = WM_ShowReportsScreen then
      begin

         if msg.WParam = Integer(fmGettingStarted) then
            begin
               GettingStartedScrActive := True;
               fmGettingStarted.Close;
               sbReports.Down := True;
               sbReports.Click;
            end;
      end;
end;

procedure TMenuForm.sbGettingStarte2dClick(Sender: TObject);
begin
   ShowGettingStarted(True);
end;

procedure TMenuForm.sbRegisterRemarkClick(Sender: TObject);
begin
   // Open the General Remarks
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      uGeneralRemark.ShowGeneralRemark;

end;

procedure TMenuForm.sbGettingStartedClick(Sender: TObject);
begin
   ShowGettingStarted;
end;

procedure TMenuForm.CMMSFileImport1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   TfmCMMSFileImport.ShowForm;
end;

procedure TMenuForm.RunPDAHerdInstallerClick(Sender: TObject);
begin
   if MessageDlg(cInstallConfirmMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
         SetCurrentDir(cPDAHerdInstallDir);
         ShellExecute( 0, 'open', pChar(PDAHerdInstallerPath), nil, nil, SW_SHOWNORMAL );
         SetCurrentDir(ApplicationPath);
      end;
end;


procedure TMenuForm.RunPDAFieldsInstallerClick(Sender: TObject);
begin
   if MessageDlg(cInstallConfirmMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
         SetCurrentDir(cPDAFieldsInstallDir);
         ShellExecute( 0, 'open', pChar(PDAFieldsInstallerPath), nil, nil, SW_SHOWNORMAL );
         SetCurrentDir(ApplicationPath);
      end;
end;

procedure TMenuForm.HistoricalCalving1Click(Sender: TObject);
begin
   TfmLactationConsistencyChecker.ShowForm(WinData.UserDefaultHerdID, 99);
end;

procedure TMenuForm.HerdUtils1Click(Sender: TObject);
begin
   WinData.KingData.CloseDataSets; // Close the Dataset
   WinData.KingData.Close;         // Close the Database
   update;
   try
      Windata.CallProg.HerdUtils;
   finally
      Update;
      WinData.OpenAndCheckTables;
   end;
end;

procedure TMenuForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if (FShutdownInProgress) then
      Exit;

   if (WinData.ActiveFilter or not(AnimalCart.IsEmpty) )then
      begin
         ClearAnimalSelection();
      end;

   WinData.QueryICBFRegistrations;
   WinData.QueryBandonRegistrations(CanClose);

   if not ( ( WinData.CTSBirthRegCount = 0 ) and ( WinData.CTSMovementRegCount = 0 ) ) then
      if ( WinData.SystemRegisteredCountry = England ) then
         begin
            Application.CreateForm(TfmCTSRegInfo, fmCTSRegInfo);
            fmCTSRegInfo.ShowModal;
         end;
end;

procedure TMenuForm.LivestockProductionRate1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   TfmSetupWasteProdRates.ShowForm( WinData.GetHerdCountry(WinData.OwnerFile, cbDefaultHerd.Value));
end;

procedure TMenuForm.ResetAnimalGridColumns1Click(Sender: TObject);
begin
   ResetAnimalGridColumns;
end;

procedure TMenuForm.ResetAnimalGridColumns;
var
   i : Integer;
begin
   for i := 0 to cxAnimalGridView.ColumnCount-1 do
      begin
         cxAnimalGridView.Columns[i].Visible := not cxAnimalGridView.Columns[i].Hidden;
      end;
   // Ensure these columns always remain visible.
   try
      cxAnimalGridViewSortAnimalNo.Visible := True;
   except
      on e : exception do showmessage(e.message);
   end;
   cxAnimalGridViewSortNatID.Visible := True;
   StoreAnimalGridView;
end;

procedure TMenuForm.RestoreAnimalGridView;
begin
   GridSettingsIniPath := IncludeTrailingBackslash( WinData.KingData.Directory ) + cGridColLayoutFile;
   try
      if FileExists( GridSettingsIniPath ) then
         cxAnimalGridView.RestoreFromIniFile(GridSettingsIniPath, True,False)
      else
         begin
            cxAnimalGridView.StoreToIniFile(GridSettingsIniPath, True);//Save default view
         end;
      // Show the EBI column on the main grid, if the milk recording module is present and the
      // version number is less than 3780
   except
   end;
end;

procedure TMenuForm.StoreAnimalGridView;
begin
   if FileExists(GridSettingsIniPath) then DeleteFile(GridSettingsIniPath);

   if GridSettingsIniPath <> '' then
      try
         cxAnimalGridView.StoreToIniFile( GridSettingsIniPath, True);
      except
      end;
end;

procedure TMenuForm.cxAnimalGridViewDataControllerFilterChanged(
  Sender: TObject);

   procedure RemoveIDS;
   begin
      with WinData.GenQuery do
         try
            SQL.Clear;
            SQL.Add('DELETE FROM ' + WinData.FilteredAnimals.TableName);
            ExecSQL;
         except
            MessageDlg('Cannot delete IDs, program will rebuild indexes'+#13#10+cErrorContact,mtError,[mbOK],0);
         end;
   end;

var
   i : Integer;
   vID : Variant;
begin
   with cxAnimalGridView.DataController do
      begin
         if Filter.Active then
            begin
              if FilteredRecordCount > 0 then
                 begin
                    RemoveIDS;
                    for i := 0 to FilteredRecordCount - 1 do
                        begin
                           vID := GetRecordId(FilteredRecordIndex[I]);
                           with WinData.GenQuery do
                              try
                                 SQL.Clear;
                                 SQL.Add('INSERT INTO ' + WinData.FilteredAnimals.TableName+' (AID)');
                                 SQL.Add('VALUES ('+IntToStr(vID)+')');
                                 ExecSQL;
                              except
                                 MessageDlg('Cannot delete IDs, program will rebuild indexes'+#13#10+cErrorContact,mtError,[mbOK],0);
                                 Abort;
                              end;
                        end;
                 end;
            end;
      end;end;

procedure TMenuForm.SpeedButton3Click(Sender: TObject);
begin
   TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TDisbudding);
   SetUpQuery;
end;

procedure TMenuForm.ShowSucklerCowEvents(var msg: TMessage);
begin
   if msg.Msg = WM_ShowSucklerCowEvents then
      begin
         fmGettingStarted.Close;
         //bBreeding.Click;
         //BreedingPageControl.ActivePage := tsOtherBreeding;
      end;
end;

procedure TMenuForm.AccsDatabasesClick(Sender: TObject);
begin
   if (Sender is TMenuItem) then
      begin
         if Definition.dUseKingsAccs then
            begin
               WinData.CallProg.Accounts((Sender as TMenuItem).Hint, RegistrySerialNum);
               //   22/02/12 [V5.0 R4.0] /MK Change - Always Load Companies List In Case Of Year End.
               LoadAccountsCompanies;
            end
         else
            begin
               WinData.CallProg.Accounts((Sender as TMenuItem).Hint);
               //   22/02/12 [V5.0 R4.0] /MK Change - Always Load Companies List In Case Of Year End.
               LoadAccountsCompanies;
            end;
      end;
end;

procedure TMenuForm.LoadAccountsCompanies;
var
   AccsComps : TStringList;
   i : Integer;
   mi : TMenuItem;
begin
   AccsComps := TStringList.Create;
   try
      RetrieveAvailableWinAccsDatabases(AccsComps);
      AccsComps.Sort;
      pmAccsDatabases.Items.Clear;
      for i := 0 to AccsComps.Count-1 do
         begin
            mi := TMenuItem.Create(nil);
            if AccsComps.Strings[i] = WinData.GetAccsCompany(WinData.UserDefaultHerdID) then
               mi.Caption := AccsComps.Strings[i] + ' (Default)'
            else
               mi.Caption := AccsComps.Strings[i];
            mi.OnClick := AccsDatabasesClick;
            mi.Hint := AccsComps.Strings[i];
            pmAccsDatabases.Items.Add(mi);
         end;
   finally
      FreeAndNil(AccsComps);
   end;
end;

procedure TMenuForm.FertilityTreatmentsReport1Click(Sender: TObject);
begin
   TfmFertilityTreatmentsReport.ShowReportScreen(retHealth);
end;

procedure TMenuForm.pmFertilityTreatmentsReportPopup(Sender: TObject);
begin
   FertilityTreatmentsReport1.Visible := Def.Definition.dUseQuotaMan;
end;

procedure TMenuForm.MedicineStock1Click(Sender: TObject);
begin
   uMedicineSetUp.ShowTheForm(0, True);
end;

procedure TMenuForm.FertilityPrograms1Click(Sender: TObject);
begin
   TfmSetupFertPrograms.Execute;
end;

procedure TMenuForm.ReplacementTagForm1Click(Sender: TObject);
begin
   //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
   TfmTagReplacementForm.Execute(True);
end;

procedure TMenuForm.MenuItem3Click(Sender: TObject);
begin
   //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
   TfmTagReplacementForm.Execute(True);
end;

procedure TMenuForm.NameSearch(const AStartIndex: Integer);
begin
end;

procedure TMenuForm.eNameSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
end;

procedure TMenuForm.FertilityTreatmentChart1Click(Sender: TObject);
begin
   uQuotaMan.ShowForm;
end;

procedure TMenuForm.KingswoodHerdDevelopments1Click(Sender: TObject);
var
   OffLineHelpFile : String;
begin
  if ( not IsNetConnected ) then
     begin
        // view offline edition
        ForceApplicationDirectories('Help\History');
        OffLineHelpFile := ApplicationPath + 'Help\History\Winherd.html';
        if FileExists(OffLineHelpFile) then
           begin
              ShellExecute(Self.Handle,'open',PChar(OffLineHelpFile),nil,nil,SW_SHOWNORMAL);
           end
        else
           MessageDlg('File cannot be found. '+cErrorContact,mtInformation,[mbok],0);
     end;
end;

procedure TMenuForm.AddToQueue1Click(Sender: TObject);
begin
   FAddToCartType := atcAfterRightClick;
   if ( AnimalCart.InCart(WinData.AnimalFileByIDID.AsInteger) ) then
      AnimalCart.RemoveFromCart(WinData.AnimalFileByIDID.AsInteger)
   else
      sbAddAnimalToCartClick(Sender);
end;

procedure TMenuForm.ClearCart1Click(Sender: TObject);
begin
   if not AnimalCart.IsEmpty then
      begin
         if MessageDlg(Format('Clear all animals (%d) from the Cart, are you sure?',[AnimalCart.Count]),mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               AnimalCart.ClearCart;
               cxAnimalGrid.LayoutChanged; // force update of styles
               SetCartButtonStyle(AnimalCart.IsEmpty);
            end;
         if AnimalCartFiltered then
            begin
               FilterCart1.Default := False;
               AnimalCartFiltered := False;
               FilterCart1.Caption := 'Filter Cart';
               actClearFilter.Execute;
            end;
      end
   else
      MessageDlg('There are currently no animals in the Cart to clear.',mtInformation,[mbOK],0);

   SetupQuery(True);
end;

procedure TMenuForm.sbAddAnimalToCartClick(Sender: TObject);
var
   pt : TPoint;
   Hint : string;
begin
   if ( not AnimalCart.InCart(WinData.AnimalFileByIDID.AsInteger)) then
      begin
         AnimalCart.AddToCart(WinData.AnimalFileByIDID.AsInteger);
         pt.x := 0;
         pt.y := 0;
         pt := cxAnimalGrid.ClientToScreen(pt);
         HideHintStyleController();
         CreateAnimalCartHintStyleController();
         Hint := Format('Animal "%s" has been added to the Cart',[WinData.AnimalFileByIDNatIDNum.AsString]);
         HintTimer.Enabled := True;
         try
            HintStyleController.ShowHint(pt.x, pt.y, 'Animal Cart', Hint);
         finally
         end;
      end
   else
      begin
         if MessageDlg('This animal is already in the Cart.'+cCRLFx2 +
                       'Do you want to remove it from the Cart?',mtConfirmation,[mbYes, mbNo],0) = idYes then
            AnimalCart.RemoveFromCart(WinData.AnimalFileByIDID.AsInteger);
      end;

   cxAnimalGrid.LayoutChanged; // force update of styles

   //   12/06/12 [V5.0 R7.1] /MK Additional Feature - Set Focus To SearchText After Animal Is Added To The Cart.
   if ( FAddToCartType = atcAfterSearchClick ) then
      teSearchText.SetFocus
   else
      cxAnimalGrid.SetFocus;

   SetCartButtonStyle(AnimalCart.IsEmpty);
end;

procedure TMenuForm.CTSLogin1Click(Sender: TObject);
begin
   TfmCTSLoginInfo.Execute;
end;

procedure TMenuForm.CTSMovementsClick(Sender: TObject);
begin
   Update;
   TfmCTSWSMovementReg.Execute;
   Update;
end;

procedure TMenuForm.RefreshGridViewExternalData(var msg: TMessage);
begin
   if msg.Msg = WM_RefreshGridViewExternalData then
      begin
         RefreshAllExternalData();
      end;
end;

procedure TMenuForm.DefaultHealthEventsAPHISMovementsIn1Click(Sender: TObject);
begin
  TfmMovementsInHealthDefaultsGrid.ShowMovementsInHealthDefaultGrid;
end;

procedure TMenuForm.APHISMovementsIn1Click(Sender: TObject);
begin
   MovementsInClick(Sender);
end;

procedure TMenuForm.DefaultEmailClient1Click(Sender: TObject);
begin
   TfmEmailClient.Execute;
   Email1.Visible := ( WinData.DefaultEmailClient <> cEmailClient_MS );
   ShowLinksMenu;
end;

procedure TMenuForm.sbLivestockNutrientProjectionClick(Sender: TObject);
begin
   Update;                      //
   if FCountry = Ireland then
      TfmNutrientProductionProjectionRptScr.ShowForm
   else
      TfmNINutrientProductionProjectionRptScr.ShowForm;
   Update;
end;

procedure TMenuForm.HintTimerTimer(Sender: TObject);
begin
   HintTimer.Enabled := False;
   HideHintStyleController;
end;

procedure TMenuForm.Help2Click(Sender: TObject);
begin
   WinData.HTMLHelp('CartAnimals.htm');
end;

procedure TMenuForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
      begin
         if ActiveControl = teSearchText then
            begin
               if Trim(teSearchText.Text) <> '' then
                  btnSearch.Click;
            end
      end;
end;

procedure TMenuForm.EventGridAnimalEventsViewCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
   pt : tPoint;
begin
   if (EventGridAnimalEventsView.DataController.FocusedRecordIndex > -1) then
      begin
         if (WinData.EventsEventType.AsInteger in [CDisbuddingNAEvent,CCastrationNAEvent]) then
            begin
               GetCursorPos(pt);
               pmdeleteevent.Popup(pt.x,pt.y);
            end;
      end;
end;

procedure TMenuForm.DeleteEvent1Click(Sender: TObject);
begin
   if (WinData.EventsEventType.AsInteger in [CDisbuddingNAEvent,CCastrationNAEvent]) then
      begin
         if MessageDlg('Delete event, are you sure?',mtConfirmation,[mbYes,mbNo],0) = idYes then
            WinData.Events.Delete;
      end;
end;

procedure TMenuForm.SetGridStyles;
begin
   //Beef Heifers
   BeefHeifersBetween.TextColor := TColor(WinData.GlobalSettings.BeefFemaleAttrColourBetween);
   if ( WinData.GlobalSettings.BeefFemaleAttrBoldBetween ) then
      BeefHeifersBetween.Font.Style := [fsBold]
   else
      BeefHeifersBetween.Font.Style := [];
   BeefHeifersOver.TextColor := TColor(WinData.GlobalSettings.BeefFemaleAttrColourOver);
   if ( WinData.GlobalSettings.BeefFemaleAttrBoldOver ) then
      BeefHeifersOver.Font.Style := [fsBold]
   else
      BeefHeifersOver.Font.Style := [];

   //Beef Bulls
   BeefBullsBetween.TextColor := TColor(WinData.GlobalSettings.BeefBullAttrColourBetween);
   if ( WinData.GlobalSettings.BeefBullAttrBoldBetween ) then
      BeefBullsBetween.Font.Style := [fsBold]
   else
      BeefBullsBetween.Font.Style := [];
   BeefBullsOver.TextColor := TColor(WinData.GlobalSettings.BeefBullAttrColourOver);
   //   16/04/15 [V5.4 R4.8] /MK Bug Fix - Was using bold boolean of Beef Bull Between.
   if ( WinData.GlobalSettings.BeefBullAttrBoldOver ) then
      BeefBullsOver.Font.Style := [fsBold]
   else
      BeefBullsOver.Font.Style := [];

   //Steers
   SteersBetween.TextColor := TColor(WinData.GlobalSettings.SteerAttrColourBetween);
   //   16/04/15 [V5.4 R4.8] /MK Bug Fix - Was using bold boolean of Beef Bull instead of Steer.
   if ( WinData.GlobalSettings.SteerAttrBoldBetween ) then
      SteersBetween.Font.Style := [fsBold]
   else
      SteersBetween.Font.Style := [];
   SteersOver.TextColor := TColor(WinData.GlobalSettings.SteerAttrColourOver);
   if ( WinData.GlobalSettings.SteerAttrBoldOver ) then
      SteersOver.Font.Style := [fsBold]
   else
      SteersOver.Font.Style := [];

   cxAnimalGrid.LayoutChanged; // force update of styles
end;

procedure TMenuForm.FileExport1Click(Sender: TObject);
var
   dbUpdated : Boolean;
begin
   if ( not(AnimalCart.IsEmpty) ) then
      begin
         UKImport.CreateShowForm(TSaleDeath, dbUpdated, True);
         Application.ProcessMessages;
         if dbUpdated then
            begin
               Menuform.Enabled := False; // prevent any clicking during database operations
               try
                  SetupQuery;
               finally
                  Menuform.Enabled := True; // Release
               end;
            end;
      end
   else
      MessageDlg(cMsg_NoAnimalsInCart,mtInformation,[mbOK],0);
end;

procedure TMenuForm.TagReplacementForm1Click(Sender: TObject);
begin
   if not (AnimalCart.IsEmpty) then
      //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
      TfmTagReplacementForm.Execute(True)
   else
      MessageDlg(cMsg_NoAnimalsInCart,mtInformation,[mbOK],0);
end;

procedure TMenuForm.ViewCart1Click(Sender: TObject);
begin
   TfmAnimalCartView.ViewAnimalCart;
   cxAnimalGrid.LayoutChanged; // force update of styles
end;

procedure TMenuForm.Help3Click(Sender: TObject);
begin
   WinData.HTMLHelp('Filter.htm');
end;

procedure TMenuForm.BuildOnFarmEventsMenu(AOwner: TMenu;
  AOwnerItem: TMenuItem);
var
   subitem : TMenuItem;
begin
   AOwnerItem.Clear;

   subitem := TMenuItem.Create(AOwner);
   subitem.Caption := 'Vet/Dosing';
   subitem.OnClick := GroupHealthClick;
   AOwnerItem.Add(subitem);

   subitem := TMenuItem.Create(AOwner);
   subitem.Caption := 'Vaccination';
   subitem.OnClick := GroupVaccinationClick;
   AOwnerItem.Add(subitem);

   subitem  := TMenuItem.Create(AOwner);
   subitem.Caption := 'Herd Test';
   subitem.OnClick := GroupBruceTestClick;
   AOwnerItem.Add(subitem);

   if ( Def.Definition.dUseManCal ) then
      begin
         subitem  := TMenuItem.Create(AOwner);
         subitem.Caption := 'Fertility Check';
         subitem.OnClick := GroupFertilityCheckClick;
         AOwnerItem.Add(subitem);
      end;
      
   if ( Def.Definition.dUseManCal ) and ( FSelectedHerdType <> htBeef ) then
      begin
         subitem  := TMenuItem.Create(AOwner);
         subitem.Caption := 'Planned Bull';
         subitem.OnClick := GroupPlannedBullClick;
         AOwnerItem.Add(subitem);

         subitem  := TMenuItem.Create(AOwner);
         subitem.Caption := 'Heat';
         subitem.OnClick := GroupBullingClick;
         AOwnerItem.Add(subitem);

         subitem  := TMenuItem.Create(AOwner);
         subitem.Caption := 'Service';
         subitem.OnClick := GroupServiceClick;
         AOwnerItem.Add(subitem);

         subitem  := TMenuItem.Create(AOwner);
         subitem.Caption := 'Preg. Diag.';
         subitem.OnClick := GroupPregDiagClick;
         AOwnerItem.Add(subitem);
      end;

   if ( FSelectedHerdType <> htBeef ) then
      begin
         subitem  := TMenuItem.Create(AOwner);
         if ( FSelectedHerdType = htDairy ) then
            subitem.Caption := 'Dry Off Event'
         else
            subitem.Caption := 'Weaning Event';
         subitem.OnClick := GroupDryOffClick;
         AOwnerItem.Add(subitem);
      end;

   if ( Def.Definition.dUseQuotaMan ) or
      ( Def.Definition.dUseManCal ) or
      ( Def.Definition.dUseBeefMan ) then
      begin
         subitem  := TMenuItem.Create(AOwner);
         subitem.Caption := 'Weighing Event';
         subitem.OnClick := GroupWeighingClick;
         AOwnerItem.Add(subitem);
      end;

   if ( Def.Definition.dUseManCal ) then
      begin
         subitem  := TMenuItem.Create(AOwner);
         subitem.Caption := 'Condition Score';
         subitem.OnClick := GroupConditionScoreClick;
         AOwnerItem.Add(subitem);
      end;

   if ( Def.Definition.dUseManCal ) and ( FSelectedHerdType = htDairy ) then
      begin
         subitem  := TMenuItem.Create(AOwner);
         subitem.Caption := 'Milk Temperament';
         subitem.OnClick := GroupMilkTempermentClick;
         AOwnerItem.Add(subitem);
      end;
end;

procedure TMenuForm.GroupBruceTestClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(THerdTest,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(THerdTest,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupBullingClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(TBulling,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(TBulling,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupPlannedBullClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(TPlannedBull,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(TPlannedBull,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupDryOffClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(TDryOff,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(TDryOff,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupHealthClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(THealth,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(THealth,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupVaccinationClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(THerdVaccination,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(THerdVaccination,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupPregDiagClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(TPregDiag,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(TPregDiag,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupServiceClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(TService,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(TService,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupTBTestClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(TTBTestDate,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(TTBTestDate,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupTempMoveClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(TMovement,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(TMovement,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupWeighingClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(TWeight,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(TWeight,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupConditionScoreClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(TConditionScore,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(TConditionScore,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupMilkTempermentClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( Sender is TMenuItem ) then
      begin
         if ( (Sender as TMenuItem).Parent = OnFarmEvents1 ) then
            uEventsByGroup.ShowTheForm(TMilkTemperament,True,True,stCart)
         else if ( (Sender as TMenuItem).Parent = OnFarmEvents2 ) then
            uEventsByGroup.ShowTheForm(TMilkTemperament,True,True,stFilter);
      end;
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.AddAllAnimalsToCart;
var
   pt : TPoint;
   Hint : string;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select Distinct(AID) From AFilters');
         Open;
         try
            First;
            while not eof do
               begin
                  if ( not AnimalCart.InCart(Fields[0].AsInteger)) then
                     AnimalCart.AddToCart(Fields[0].AsInteger);
                  Next;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
   cxAnimalGrid.LayoutChanged; // force update of styles
   try
      pt.x := 0;
      pt.y := 0;
      pt := cxAnimalGrid.ClientToScreen(pt);
      HideHintStyleController();
      CreateAnimalCartHintStyleController();
      HintTimer.Enabled := True;
      HintStyleController.ShowHint(pt.x, pt.y, 'Animal Cart', 'All animals have been added to the Cart.');
   finally
   end;
   SetCartButtonStyle(AnimalCart.IsEmpty);
end;

procedure TMenuForm.AddAlltoCart1Click(Sender: TObject);
begin
   AddAllAnimalsToCart;
end;

procedure TMenuForm.SetCartButtonStyle(const AStyleNormal: Boolean);
begin
   if AStyleNormal then
      begin
         btnTopCart.Font.Size := 8;
         btnTopCart.Font.Style := [];
         btnTopCart.Font.Color := clBlack;
      end
   else
      begin
         btnTopCart.Font.Size := 8;
         btnTopCart.Font.Style := [fsBold,fsItalic];
         btnTopCart.Font.Color := clBlue;
      end;
end;

procedure TMenuForm.SalesPlanner2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rtSalesPlanner);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.FQASReport1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rtFQAS);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.NonFQASReport1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rtNonFQAS);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.N30Month30Day1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rt30mth30Day);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.N30Month10Day1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rt30mth10Day);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.SetUpCartQuery;
var
   wsCart : WideString;
begin
   if AnimalCart.IsEmpty then
      MessageDlg('There are currently no animals in the Cart.',mtInformation,[mbOK],0)
   else
      begin
         //   11/07/18 [V5.8 R0.9] /MK Bug Fix - If AnimalCartDataAsWideString is empty then show error of no animals in the cart.
         wsCart := AnimalCart.AnimalCartDataAsWideString;
         if ( wsCart = '()' ) then
            begin
               MessageDlg('There are currently no animals in the Cart.',mtInformation,[mbOK],0);
               Exit;
            end;
         with WinData.AnimalFileByID.SQL do
            begin
               Clear;
               Add('SELECT DISTINCT (A.ID), A.*');
               Add('FROM Animals A');
               Add('WHERE (AnimalDeleted=FALSE)');
               Add('AND   A.ID IN '+wsCart );
               ApplySortToAnimalFileByIdAndOpenQuery();
               AnimalCartFiltered := True;
               WinData.ActiveFilter := True;
            end;
      end;
end;

procedure TMenuForm.pmAnimalGridPopupPopup(Sender: TObject);
var
   IsInUse : Boolean;
begin
   //   28/03/14 [V5.2 R9.3] /MK Bug Fix - Only show extra item in the drop-down-menu if animal is not in the None Herd.
   AddToQueue1.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) );
   if ( AnimalCart.InCart(WinData.AnimalFileByIDID.AsInteger) ) then
      AddToQueue1.Caption := 'Remove From Cart'
   else
      AddToQueue1.Caption := 'Add To Cart';

   //   07/12/17 [V5.7 R6.1] /MK Bug Fix - Query AIM was showing only if AIMClient exists but should also check for Country.
   //   27/03/19 [V5.8 R8.3] /MK Change - Query AIM should only exist if AIMClient exists and the animal is not in the NoneHerd.
   AIMQueryAnimalHistory1.Visible := ( FCountry = Ireland ) and ( AIMClient.ClientExists ) and ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) );
   AIMQueryAnimalHistory1.Action := actQueryAimAnimalDetails;
   //   27/03/19 [V5.8 R8.3] /MK Change - actQueryAimAnimalDetails should be visible if AIMQueryAnimalHistory1.Visible.
   actQueryAimAnimalDetails.Visible := AIMQueryAnimalHistory1.Visible;

   ResyncAnimalwhenprogramsynchronzies1.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) ) and ( WinData.SyncServiceIsAvailable );

   if ( WinData.AnimalFileByIDSex.AsString = cSex_Bull ) then
      begin
         IsInUse := WinData.GetBullInUse(WinData.AnimalFileByIDId.AsInteger);
         miStartusingbullforbreeding.Visible := not IsInUse;
         miStopusingbullforbreeding.Visible := IsInUse;
      end
   else
      begin
         miStartusingbullforbreeding.Visible := False;
         miStopusingbullforbreeding.Visible := False;
      end;

   pmiA1A2Result.Visible := ( (WinData.AnimalFileByIDSex.AsString = cSex_Female) and (FSelectedHerdType = htDairy) );

   actSyncAnimal.Visible := TfmFarmSyncSettings.CanSync;

   Application.ProcessMessages;
   Update;
end;

procedure TMenuForm.DownloadEmailAttachments1Click(Sender: TObject);
begin
   CheckAttachments;
end;

procedure TMenuForm.ViewMailBox2Click(Sender: TObject);
begin
   CheckSelectedHerd;
   WinData.ViewMailBox(cbDefaultHerd.Text);
end;

procedure TMenuForm.ShowFactorySales;
var
   FileName : string;
   FileCount : Integer;
begin
   CheckSelectedHerd;
   if ( WinData.GlobalSettings.DownloadMailAttachments ) then
      begin
         FileCount := 0;
         if ( not(WinData.FAttachmentsDownloaded) ) then
            CheckAttachments;

         Update;
         FileName := TfmFileAttachmentImport.execute(itFactorySales, cbDefaultHerd.Text, FileCount);
         if (FileName <> '') then
            begin
               TfRemittance.Create(Self).ExecuteFile(FileName);
               SetUpQuery;
            end;
      end
   else
      begin
         TfRemittance.Create(Self).Execute;
         SetUpQuery;
      end;
end;

procedure TMenuForm.ShowMartImport;
var
   FileName : string;
   FileCount : Integer;
begin
   CheckSelectedHerd;
   if WinData.GlobalSettings.DownloadMailAttachments then
      begin
         FileCount := 0;

         if ( not(WinData.FAttachmentsDownloaded) ) then
            CheckAttachments;

         FileName := TfmFileAttachmentImport.execute(itMart, cbDefaultHerd.Text, FileCount);
         if (FileExists(FileName)) then
            begin
               TfmMartImport.open(mftMART,WinData.userDefaultHerdID,FileName);
               SetUpQuery;
            end;
      end
   else
      begin
         TfmMartImport.open(mftMART,WinData.userDefaultHerdID);
         SetUpQuery;
      end;
end;

procedure TMenuForm.sbGroupSetupClick(Sender: TObject);
begin
   uGroupSetUp.ShowTheForm(0);  //Ind = 0 shows standard form
   SetUpQuery;
end;

procedure TMenuForm.pcMultipleAnimalsDrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
   if TcxPageControl(AControl).ActivePageIndex = ATab.Index then
      begin
         Font.Color := clBlue;
      end;
end;

procedure TMenuForm.RecentChanges1Click(Sender: TObject);
begin
   ShowVersionHistory([WinData.DefCountry( WinData.UserDefaultHerdID)]);
end;

procedure TMenuForm.SearchForAnimal;
var
  SearchText, SearchField : string;
  StartIndex : Integer;
  ModifiedSearchText : string;
  SearchColIndex : Integer;
  SearchOnSearchField : Boolean;
  FieldValue : Variant;
  MessageSubText : String;
  i : Integer;
  Success : Boolean;
  nRowCount : Integer;
begin
  inherited;

  FSearchColumn := TcxGridDBColumn(cmboSearchColumns.ItemObject);

  if FSearchColumn = nil then Exit;

  with cxAnimalGridView do
     begin
        Screen.Cursor := crHourGlass;
        DataController.BeginLocate;
        Success := False;
        try
           SearchText := Trim(teSearchText.Text);

           if SearchText <> '' then
              begin
                 SearchText := UPPERCASE(teSearchText.Text);
                 SearchColIndex := FSearchColumn.Index;
                 SearchOnSearchField := False;
                 StartIndex := 0;
                 if (cmboSearchColumns.ItemIndex in [0,1]) then
                    begin
                       SearchText := WinData.StripAllNomNumAlpha(UPPERCASE(teSearchText.Text));
                       SearchOnSearchField := not(Pos(' ', SearchText) > 0);
                       if SearchOnSearchField then
                          SearchColIndex := cxAnimalGridViewSearchNatID.Index;
                    end;

                 //   16/10/14 [V5.3 R8.6] /MK Bug Fix - 3 excluded from array. Was 0 & 4. Bug added when Transponder No search added.
                 if (cmboSearchColumns.ItemIndex in [0,3,4]) then
                    begin
                       if btnSearch.Caption = 'Start' then
                          btnSearch.Caption := 'Continue'
                       else
                          StartIndex := cxAnimalGridView.Controller.FocusedRowIndex+1;
                       if StartIndex < 0 then StartIndex := 0;
                    end;

                 with cxAnimalGridView.ViewData do
                    begin
                       Success := False;
                       nRowCount := RowCount;
                       for i := StartIndex to nRowCount - 1 do
                          begin
                             FieldValue := VarToStr(Rows[i].Values[SearchColIndex]);
                             if ( not(VarIsNull(FieldValue)) ) then
                                begin
                                   FieldValue := UPPERCASE(FieldValue);
                                   if ( cmboSearchColumns.ItemIndex = 2 ) then
                                      begin
                                         if ( SearchText = Copy(FieldValue, 1, Length(SearchText)) ) then
                                            begin
                                               cxAnimalGridView.DataController.FocusedRecordIndex := Rows[i].RecordIndex;
                                               Success := True;
                                               Break;
                                            end;
                                      end
                                   else
                                      begin
                                         if ( Pos(SearchText, FieldValue) > 0 ) then
                                            begin
                                               cxAnimalGridView.DataController.FocusedRecordIndex := Rows[i].RecordIndex;;
                                               Success := True;
                                               Break;
                                            end;
                                      end;
                                end;
                          end;
                    end;

                 if not Success then
                    begin
                       if StartIndex > 0 then
                          MessageSubText := 'further '
                       else
                          MessageSubText := '';
                       cxAnimalGridView.DataController.FocusedRowIndex := 0;
                       MessageDlg(Format('The search for "%s" did not return any %sresults.',[teSearchText.Text,MessageSubText]),mtInformation,[mbOK],0);

                       if (cmboSearchColumns.ItemIndex in [0,3]) then
                          begin
                             btnSearch.Caption := 'Start';
                             teSearchText.SetFocus;
                          end;
                    end;
              end
           else
              DataController.DataSet.First;
        finally
           DataController.EndLocate;
           Screen.Cursor := crDefault;
        end;
     end;
end;

procedure TMenuForm.BuildSearchColumnList;
var
   i : Integer;
begin
   cmboSearchColumns.Properties.Items.Clear;
   cmboSearchColumns.Properties.Items.AddObject('Nat. Id. No. (Part)', cxAnimalGridViewNatIDNum);
   cmboSearchColumns.Properties.Items.AddObject('Nat. Id. No. (Full)', cxAnimalGridViewNatIDNum);
   cmboSearchColumns.Properties.Items.AddObject(cxAnimalGridViewAnimalNo.Caption, cxAnimalGridViewAnimalNo);
   if not(cxAnimalGridViewName.Hidden) and (cxAnimalGridViewName.Visible) then
      cmboSearchColumns.Properties.Items.AddObject(cxAnimalGridViewName.Caption, cxAnimalGridViewName);
   if ( Def.Definition.dUseParlour ) then
      cmboSearchColumns.Properties.Items.AddObject(cxAnimalGridViewTransponderNo.Caption, cxAnimalGridViewTransponderNo);
   //   17/05/13 [V5.1 R7.1] /MK Additional Feature - Added Q.A field to main grid for IAD to print/filter.
   if ( Def.Definition.dUseCrush ) then
      cmboSearchColumns.Properties.Items.AddObject(cxAnimalGridViewQualityAssured.Caption, cxAnimalGridViewQualityAssured);

   if WinData.SearchField = cxAnimalGridViewAnimalNo.DataBinding.FieldName then // Animal No.
      cmboSearchColumns.ItemIndex := cmboSearchColumns.Properties.Items.IndexOf(cxAnimalGridViewAnimalNo.Caption) // Default to animal no
   else
      cmboSearchColumns.ItemIndex := 0;
end;

procedure TMenuForm.cmboSearchColumnsPropertiesChange(Sender: TObject);
begin
   teSearchText.Text := '';
   if (cmboSearchColumns.ItemIndex in [0,4]) then
      btnSearch.Caption := 'Start'
   else
      btnSearch.Caption := 'Reset';

   //   02/07/12 [V5.0 R7.4] /MK Change - Set WinData.SearchNatID To FieldName Of cmboSearchColumnItemIndex.
   if ( cmboSearchColumns.ItemIndex in [0,1] ) then
      WinData.SearchField := 'NatIDNum'
   else if ( cmboSearchColumns.ItemIndex = 2 ) then
      WinData.SearchField := 'AnimalNo';

   SetNatIDSearchText;
   cxAnimalGridView.Controller.FocusedRowIndex := 0;
   teSearchText.SetFocus;
end;

procedure TMenuForm.cmboSearchColumnsPropertiesEditValueChanged(
  Sender: TObject);
begin
  FSearchColumn := nil;
  if ( cmboSearchColumns.ItemIndex > -1 ) then
     FSearchColumn := TcxGridDBColumn(cmboSearchColumns.ItemObject);
end;

procedure TMenuForm.btnSearchClick(Sender: TObject);
begin
   if (cmboSearchColumns.ItemIndex in [1,2]) then
      begin
         teSearchText.Text := ''; // Reset the search text.
         cxAnimalGridView.Controller.FocusedRowIndex := 0;
         SetNatIDSearchText;
      end
   else
      begin
         if (cmboSearchColumns.ItemIndex = 0) then
         // only select all for part. nat. id. - this allows
         // the user to efficently search for a number of animals
            teSearchText.SelectAll;
         SearchForAnimal;
      end;
end;

procedure TMenuForm.teSearchTextEnter(Sender: TObject);
begin
   // 29/01/09 [V3.9 R5.8] /SP Bug Fix - Sort grid by Animal No., before animal no search is allowed. This is to facilitate an orderly search
   if cmboSearchColumns.Text = 'Animal No.' then
      begin
         cxAnimalGridView.DataController.ClearSorting(False);
         cxAnimalGridViewSortAnimalNo.SortOrder := soAscending;
         FSortedColumn := cxAnimalGridViewSortAnimalNo;
      end;

   if ( teSearchText.Text = cTagPreFix_IE ) then
      teSearchText.SelStart := 3
   else if ( teSearchText.Text = cTagPreFix_372 ) then
      teSearchText.SelStart := 4
   else
      teSearchText.SelectAll;
end;

procedure TMenuForm.teSearchTextPropertiesChange(Sender: TObject);
begin
   if ( WinData.UseScanner ) and ( cmboSearchColumns.ItemIndex = 1 ) then Exit;

   FAnimalSearching := ( Trim(teSearchText.Text) <> '' );

   if (cmboSearchColumns.ItemIndex in [1,2]) then
      begin
         btnSearch.Caption := 'Reset';

         if Trim(teSearchText.Text) <> '' then
            begin
               SearchForAnimal;
            end
         else
            cxAnimalGridView.Controller.FocusedRowIndex := 0;
      end
   else
      begin
         btnSearch.Caption := 'Start';
         cxAnimalGridView.Controller.FocusedRowIndex := 0;
      end;
end;

procedure TMenuForm.teSearchTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if ( WinData.UseScanner ) and ( cmboSearchColumns.ItemIndex = 1 ) then Exit;

   if ( Key = VK_RETURN ) then
      begin
         //   27/10/17 [V5.7 R4.1] /MK Additional Feature - If user presses enter key in search other than Animal No then just search.
         //                                                 But if search is on animal no then add the animal to the cart - Shane Maxwell.
         if ( cmboSearchColumns.ItemIndex <> 2 ) then
            SearchForAnimal
         else if ( cmboSearchColumns.ItemIndex = 2 ) then
            begin
               sbAddAnimalToCartClick(Sender);
               FAddToCartType := actAfterAnimalNoEnterKeyPress;
               teSearchText.SetFocus;
            end;
         teSearchText.SelectAll;
      end;
end;

procedure TMenuForm.SetSearchPanelVisible(const AVisible: Boolean);
begin
   if AVisible then
      PSearch.Height := 89
   else
      PSearch.Height := 23;

   Bevel1.Width := PSearch.Width-1;
   SetNatIDSearchText;
end;

procedure TMenuForm.sbAPHISEPermitClick(Sender: TObject);
begin
   OpenUrl('https://www2.dardni.gov.uk/gatewayweb/internet/');
end;

procedure TMenuForm.NotifyHUK1Click(Sender: TObject);
begin
   WinData.NotifiyMovementsToHUK(AnimalCart.AnimalCartData);
end;

procedure TMenuForm.teSearchTextExit(Sender: TObject);
var
   NewNatID : String;
begin
    if ( cmboSearchColumns.ItemIndex = 1 ) and ( WinData.UseScanner ) and ( Length ( teSearchText.Text ) > 0 ) then
      begin
         Screen.Cursor := crHourGlass;
         cxAnimalGridView.DataController.BeginLocate;
         NewNatID := teSearchText.Text;
         try
            cxAnimalGridView.DataController.Dataset.First;
            if not cxAnimalGridView.DataController.Dataset.Locate('LocateNatID',NewNatID,[]) then
               begin
                  cxAnimalGridView.DataController.FocusedRowIndex := 0;
                  Update;
                  Windows.Beep(1000,750);
               end;
            teSearchText.Text := '';
            PostMessage(teSearchText.Handle, WM_SETFOCUS,0,0);
         finally
            cxAnimalGridView.DataController.EndLocate;
            Screen.Cursor := crDefault;
         end;
      end;
    FAddToCartType := atcAfterSearchClick;
end;

procedure TMenuForm.FormResize(Sender: TObject);
begin
   Invalidate();
   Update;
end;

procedure TMenuForm.ShowGroupEvent(AEventType: Integer);
begin
   CheckSelectedHerd;
   case AEventType of
      CBullingEvent : uEventsByGroup.ShowTheForm(TBulling,False,False);
      CServiceEvent : uEventsByGroup.ShowTheForm(TService,False,False);
      CPregDiagEvent : uEventsByGroup.ShowTheForm(TPregDiag,False,False);
      CDryOffEvent : uEventsByGroup.ShowTheForm(TDryOff,False,False);
      CWeightEvent : uEventsByGroup.ShowTheForm(TWeight,False,False);
      CHealthEvent : uEventsByGroup.ShowTheForm(THealth,False,False);
      CHerdVaccination : uEventsByGroup.ShowTheForm(THerdVaccination,False,False);
   else
      uEventsByGroup.ShowTheForm(TNoEvent,True,False)
   end;
end;

procedure TMenuForm.ShowGroupEventClick(Sender: TObject);
begin
   if ( Sender is TMenuItem ) then
      ShowGroupEvent( (Sender as TMenuItem ).Tag);
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.pmWeighingEventOnPopup(Sender: TObject);
begin
   miWeighingIHM.Visible := (WinData.SystemRegisteredCountry=NIreland);
end;

procedure TMenuForm.ShowAWGroupEventClick(Sender: TObject);
begin
   if ( Sender is TMenuItem ) then
      ShowAWGroupEvent( (Sender as TMenuItem ).Tag);
end;

procedure TMenuForm.ShowAWGroupEvent(AEventType: Integer);
begin
   CheckSelectedHerd;
   case AEventType of
      CDisbuddingEvent : TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TDisbudding);
      CCastrateEvent : TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TCastrate );
      CMealFeedingEvent : TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TMealFeeding);
      CWeaningEvent : TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TWean);
   end;
end;

procedure TMenuForm.UpdateBarcodeScannerControls;
var
   bUsingScanner : Boolean;
begin
   bUsingScanner := WinData.GlobalSettings.UseBarcodeScanner;
   imgBarcode.Visible := bUsingScanner;
   if bUsingScanner then
      StatusBar.Panels.Items[2].Text := cBarCodeScannerOnCaption
   else
      StatusBar.Panels.Items[2].Text := cBarCodeScannerOffCaption;
end;

procedure TMenuForm.AnimalsEventsSplitterCanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  { if cxAnimalGrid.Width > 520 then
      Bevel2.Width := cxAnimalGrid.Width
   else
      Bevel2.Width := 520; }
end;

procedure TMenuForm.Retagging2Click(Sender: TObject);
begin
   // Show the ReTag Form
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      begin
         uReTag.ShowReTag(WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger));
         SetUpQuery;
      end;
end;

procedure TMenuForm.sbTagReplacementClick(Sender: TObject);
begin
   //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
   TfmTagReplacementForm.Execute(True);
end;

procedure TMenuForm.ShowAWEventReview(Sender: TObject);
begin
   TfmAWReviewEvents.Show(FHerdID);
end;

procedure TMenuForm.EmailSettings1Click(Sender: TObject);
begin
   WinData.EditMailboxSettings;
end;

procedure TMenuForm.miDownloadClientDataClick(Sender: TObject);
begin
   TfmDataDownload.DownloadClientData;
end;

procedure TMenuForm.GroupFertilityCheckClick(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TFertilityCheck,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.actStopusingbullforbreedingExecute(Sender: TObject);
var
   RowIndex : Integer;
begin
   //   26/05/11 [V4.1 R1.7] /MK Additional Feature - Run SetupQuery To Reload Main Grid With Bull Out Of Use Not Showing.
   WinData.SetBullInUse(WinData.AnimalFileByIDId.AsInteger, False);

   RowIndex := cxAnimalGridView.Controller.FocusedRowIndex;

   SetUpQuery(False);

   if (RowIndex > -1) then
      begin
         if (cxAnimalGridView.DataController.DataSetRecordCount > RowIndex ) then
            cxAnimalGridView.Controller.FocusedRowIndex := RowIndex
         else
            cxAnimalGridView.Controller.FocusedRowIndex := 0;
      end;
end;

procedure TMenuForm.actStartusingbullforbreedingExecute(Sender: TObject);
begin
   //   04/10/11 [V5.0 R1.0] /MK Change - Call SetupQuery To Sort New Breeding Boolean Change.
   WinData.SetBullInUse(WinData.AnimalFileByIDId.AsInteger, True);
   SetupQuery(False);
end;

procedure TMenuForm.cxAnimalGridViewConditionScoreHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewConditionScore.Index );
end;

procedure TMenuForm.CreateUKMilkRecorderOptionClick(Sender: TObject);
var
   FileSaved : Boolean;
begin
   uMilkRec.CreateAndShow(0,FileSaved);
end;

//  04/03/11 [V4.0 R8.7] /MK Bug - If English And Milk Recording And UKMilkRecorder Is Blank Then Show Message
//
procedure TMenuForm.CreateMilkRecorderCaption;
begin
   CreateUKMilkRecorderOption.Caption := 'Create '+WinData.OwnerFileUKMilkRecorder.AsString+' Export File';
   if ( WinData.OwnerFileUKMilkRecorder.AsString = cUKMilkRecorder_CIS ) then
      pmiCreatetMilkRecEvents.Caption := CreateUKMilkRecorderOption.Caption
   else if ( WinData.OwnerFileUKMilkRecorder.AsString = cUKMilkRecorder_NMR ) then
      pmiCreatetMilkRecEvents.Caption := CreateUKMilkRecorderOption.Caption
   else if ( WinData.OwnerFileUKMilkRecorder.AsString = cUKMilkRecorder_QMMS ) then
      pmiCreatetMilkRecEvents.Caption := CreateUKMilkRecorderOption.Caption;
end;

procedure TMenuForm.cxAnimalGridViewCalvingDateHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewCalvingDate.Index );
end;

procedure TMenuForm.cxAnimalGridViewServiceDateHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewServiceDate.Index );
end;

procedure TMenuForm.DoFilter(const AFilter : TQuickFilter; const ACaption : string);

   procedure DoAnimalTypeFilter ( AFilterType : TQuickFilter );
   begin
      Update;

      if ( AFilterType = qfMilkingCows ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cInMilk)
      else if ( AFilterType = qfDryCows ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cDry)
      else if ( AFilterType = qfCows ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cAllCows)
      else if ( AFilterType = qfReplacementCows ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cReplacements)
      else if ( AFilterType = qfDairyHeifersThisYear ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cDairyHeifersThisYear)
      else if ( AFilterType = qfDairyHeifersLastYear ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cDairyHeifersLastYear)
      else if ( AFilterType = qfAllHeifersThisYear ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cAllHeifersThisYear)
      else if ( AFilterType = qfAllHeifersLastYear ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cAllHeifersLastYear)
      else if ( AFilterType = qfCowPDdPregnant ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cCowPDdPregnant)
      else if ( AFilterType = qfCowPDdNotPregnant ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cCowPDdNotPregnant)
      else if ( AFilterType = qfRepPDdPregnant ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cRepPDdPregnant)
      else if ( AFilterType = qfRepPDdNotPregnant ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cRepPDdNotPregnant)
      else if ( AFilterType = qfCowNotServed ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cCowNotServed)
      else if ( AFilterType = qfCowServedNotPDd ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cCowServedNotPDd)
      else if ( AFilterType = qfRepNotServed ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cRepNotServed)
      else if ( AFilterType = qfRepServedNotPDd ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cRepServedNotPDd)
      else if ( AFilterType = qfCowNotPregnant ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cCowNotPregnant)
      else if ( AFilterType = qfRepNotPregnant ) then
         FAnimalFilterArray := GetAnimalIdsBySqlFilter(cRepNotPregnant);

      cxAnimalGridView.DataController.BeginFullUpdate;

      with WinData.AnimalFileByID do
      try
          DisableControls;
          try
             Active := False;
             SQL.Clear;
             SQL.Add('SELECT DISTINCT (A.ID), A.*');
             SQL.Add('FROM Animals A');
             SQL.Add('WHERE (A.InHerd = True)');
             SQL.Add('AND   (A.AnimalDeleted = False)');

             if (Length(FAnimalFilterArray) = 0) then
                begin
                   SetLength(FAnimalFilterArray,1);
                   FAnimalFilterArray[0] := -1;
                end;

             SQL.Add('AND   (A.ID IN '+ IntArrayToSQLInString(FAnimalFilterArray)+')');
             ApplySortToAnimalFileByIdAndOpenQuery();
          except
             // Show message
          end;
      finally
         EnableControls;
         WinData.AnimalFileByID.EnableControls;
         cxAnimalGridView.DataController.EndFullUpdate;
         Screen.Cursor := crDefault;
      end;

   end;

begin
   Update;
   try
      LastHerdID := WinData.UserDefaultHerdID;
      cbDefaultHerd.OnChange := nil;
      btnShowAnimalsOptions.Caption := '';
      actClearFilter.Execute;

      FQuickFilter := AFilter;

      if (AFilter in [qfAllAnimal, qfBullsInUse, qfDeletedAnimals]) then
         begin
            AllAnimalsShowing := True;
            cbDefaultHerd.KeyValue := AllHerds;
         end
      else
         cbDefaultHerd.KeyValue := WinData.UserDefaultHerdID;

      cbDefaultHerd.Enabled := False;
      if AFilter = qfNone then
         begin
            pmiCurrentHerd.Visible := False;
            cbDefaultHerd.Enabled := True;
            FAnimalFilterArray := nil;
            Exit;
         end;

      Screen.Cursor := crHourglass;
      pmiCurrentHerd.Visible := True;

      // Clear fFilter strings to start with.
      fFilters.AIBullSQL := '';
      fFilters.LeftHerdSQL := '';

      if AFilter = qfAllAnimal then
         begin
            LoadAllAnimals(True);
            WinData.ShowAllAnimals := True;
            cbAllAnimals.Checked := True;
            btnShowAnimalsOptions.Caption := ACaption;
         end
      else if AFilter = qfLeftHerd then
         begin
            LeftHerdFilter;
            btnShowAnimalsOptions.Caption := ACaption;
         end
      else if AFilter = qfBullsInUse then
         begin
            BullsInUseFilter;
            btnShowAnimalsOptions.Caption := ACaption;
         end
      else if AFilter = qfStockBullInUse then
         begin
            StockBullsInUseFilter;
         end
      else if AFilter = qfDeletedAnimals then
         begin
            DeletedAnimalsFilter;
            btnShowAnimalsOptions.Caption := ACaption;
         end
      //   13/03/12 [V5.0 R4.3] /MK Additional Feature - Renamed This From MilkingCowsFilter To Just CowsFilter.
      else if AFilter = qfCows then
         begin
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := ACaption;
         end
      //   13/03/12 [V5.0 R4.3] /MK Additional Feature - New OnClick For Just Milking Cows.
      else if AFilter = qfMilkingCows then
         begin
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Cows ' + ACaption;
         end
      //   13/03/12 [V5.0 R4.3] /MK Additional Feature - New OnClick For Just Dry Cows.
      else if AFilter = qfDryCows then
         begin
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Cows ' + ACaption;
         end
      else if AFilter = qfReplacementCows then
         begin
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := ACaption;
         end
      else if AFilter = qfBeefCattleFilter then
         begin
            BeefCattleFilter;
            btnShowAnimalsOptions.Caption := ACaption;
         end
      else if AFilter = qfDairyHeifersThisYear then
         begin
            FQuickFilter := qfDairyHeifersThisYear;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Dairy Heifers Calves ' + ACaption;
         end
      else if AFilter = qfDairyHeifersLastYear then
         begin
            FQuickFilter := qfDairyHeifersLastYear;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Dairy Heifers Calves ' + ACaption;
         end
      else if AFilter = qfBeefHeifersThisYear then
         begin
            FQuickFilter := qfBeefHeifersThisYear;
            GetHeifers( ExtractYear(Date), [htBeefHeifer] );
            btnShowAnimalsOptions.Caption := 'Beef Heifers Calves ' + ACaption;
         end
      else if AFilter = qfBeefHeifersLastYear then
         begin
            FQuickFilter := qfBeefHeifersLastYear;
            GetHeifers( ExtractYear(Date)-1, [htBeefHeifer] );
            btnShowAnimalsOptions.Caption := 'Beef Heifers Calves ' + ACaption;
         end
      else if AFilter = qfAllHeifersThisYear then
         begin
            FQuickFilter := qfAllHeifersThisYear;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Heifers Calves ' + ACaption;
         end
      else if AFilter = qfAllHeifersLastYear then
         begin
            FQuickFilter := qfAllHeifersLastYear;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Heifers Calves ' + ACaption;
         end
      else if AFilter = qfMaleCalvesThisYear then
         begin
            FQuickFilter := qfMaleCalvesThisYear;
            MaleCalveFilter( ExtractYear(Date));
            btnShowAnimalsOptions.Caption := 'Male Calves ' + ACaption;
         end
      else if AFilter = qfMaleCalvesLastYear then
         begin
            FQuickFilter := qfMaleCalvesLastYear;
            MaleCalveFilter( ExtractYear(Date)-1);
            btnShowAnimalsOptions.Caption := 'Male Calves ' + ACaption;
         end
      else if AFilter = qfAllCalvesThisYear then
         begin
            FQuickFilter := qfAllCalvesThisYear;
            AllCalvesFilter( ExtractYear(Date) );
            btnShowAnimalsOptions.Caption := 'All Calves ' + ACaption;
         end
      else if AFilter = qfAllCalvesLastYear then
         begin
            FQuickFilter := qfAllCalvesLastYear;
            AllCalvesFilter( ExtractYear(Date)-1 );
            btnShowAnimalsOptions.Caption := 'All Calves ' + ACaption;
         end
      else if AFilter = qfCowPDdPregnant then
         begin
            FQuickFilter := qfCowPDdPregnant;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Cows ' + ACaption;
         end
      else if AFilter = qfCowPDdNotPregnant then
         begin
            FQuickFilter := qfCowPDdNotPregnant;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Cows ' + ACaption;
         end
      else if AFilter = qfRepPDdPregnant then
         begin
            FQuickFilter := qfRepPDdPregnant;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Replacements ' + ACaption;
         end
      else if AFilter = qfRepPDdNotPregnant then
         begin
            FQuickFilter := qfRepPDdNotPregnant;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Replacements ' + ACaption;
         end
      else if AFilter = qfLeftHerdSold then
         begin
            SoldAnimalFilter;
            btnShowAnimalsOptions.Caption := ACaption;
         end
      else if AFilter = qfLeftHerdDied then
         begin
            DeadAnimalFilter;
            btnShowAnimalsOptions.Caption := ACaption;
         end
      else if AFilter = qfLeftHerdCulled then
         begin
            SoldAnimalFilter(True);
            btnShowAnimalsOptions.Caption := ACaption;
         end
      else if AFilter = qfCowPDdPregnant then
         begin
            FQuickFilter := qfCowPDdPregnant;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Cows ' + ACaption;
         end
      else if AFilter = qfCowNotServed then
         begin
            FQuickFilter := qfCowNotServed;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Cows ' + ACaption;
         end
      else if AFilter = qfCowServedNotPDd then
         begin
            FQuickFilter := qfCowServedNotPDd;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Cows ' + ACaption;
         end
      else if AFilter = qfRepNotServed then
         begin
            FQuickFilter := qfRepNotServed;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Replacements ' + ACaption;
         end
      else if AFilter = qfRepServedNotPDd then
         begin
            FQuickFilter := qfRepServedNotPDd;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Replacements ' + ACaption;
         end
      else if AFilter = qfCowNotPregnant then
         begin
            FQuickFilter := qfCowNotPregnant;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Cows ' + ACaption;
         end
      else if AFilter = qfRepNotPregnant then
         begin
            FQuickFilter := qfRepNotPregnant;
            DoAnimalTypeFilter( AFilter );
            btnShowAnimalsOptions.Caption := 'Replacements ' + ACaption;
         end;

      WinData.ActiveFilter := True;
      ClearFilter1.Visible := True;
      btnClearSelect.Visible := True;

      btnTopFilter.Caption := 'Fi&lter On ';
      btnTopFilter.Font.Size := 8;
      btnTopFilter.Font.Style := [fsBold,fsItalic];
      btnTopFilter.Font.Color := clBlue;

      pmiReverseFilter.Visible := WinData.ActiveFilter;
      N50.Visible := pmiReverseFilter.Visible;

      DeleteSelectedAnimal1.Visible := ( FQuickFilter <> qfDeletedAnimals ) and ( WinData.AnimalFileByID.RecordCount > 0 );

      pmiCreateFromFilter.Visible := ( WinData.ActiveFilter ) and ( WinData.FilteredAnimals.RecordCount > 0 ) and
                                     ( not(AFilter in [qfAllAnimal, qfLeftHerd, qfBullsInUse, qfDeletedAnimals]) );
      N54.Visible := pmiCreateFromFilter.Visible;
   finally
      cbDefaultHerd.OnChange := cbDefaultHerd1Change;
      Screen.Cursor := crDefault;
      Update;

      //   21/12/20 [V5.9 R7.9] /MK Change - If the filter is Bulls In Use and some bulls don't have breeds, show information message and sort by breed code.
      if ( AFilter = qfBullsInUse ) then
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT (A.ID)');
               SQL.Add('FROM Animals A');
               SQL.Add('INNER JOIN BullSemenStk B ON (B.AnimalID=A.ID)');
               SQL.Add('WHERE (A.AnimalDeleted=FALSE)');
               SQL.Add('AND   (A.Sex="Bull")');
               SQL.Add('AND   (A.AnimalNo <> "")');
               SQL.Add('AND   (B.InUse = True)');
               SQL.Add('AND   (A.Breeding = True)');
               SQL.Add('AND   ((A.PrimaryBreed IS NULL) OR (A.PrimaryBreed = 0))');
               try
                  Open;
                  if ( RecordCount > 0 ) then
                     begin
                        cxAnimalGridView.DataController.ClearSorting(False);
                        cxAnimalGridViewBreedCode.SortOrder := soAscending;
                        cxAnimalGridViewBreedCode.SortIndex := 0;
                        MessageDlg('There are bulls that do not have a breed selected (highlighted in red).'+cCRLF+
                                   'These bulls WILL NOT appear on other bull lists including the Kingswood App.'+cCRLF+
                                   'To add a breed double-click the bull, select the breed and click Save',mtInformation,[mbOK],0);
                     end;
               except
                  on e : Exception do
                     ShowDebugMessage(e.Message);
               end;
            finally
               Free;
            end;
   end;
end;

procedure TMenuForm.AllAnimalFilter;
begin
   try
      Update;
      LoadAllAnimals(True);
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.LeftHerdFilter;
begin
  try
      Update;
      begin
         cxAnimalGridView.DataController.BeginFullUpdate;
         WinData.AnimalFileByID.DisableControls;
         try
            WinData.AnimalFileByID.Active := False;
            WinData.AnimalFileByID.SQL.Clear;
            WinData.AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
            WinData.AnimalFileByID.SQL.Add('WHERE A.ID IN (SELECT E.AnimalID FROM Events E WHERE E.EventType = '+IntToStr(CSaleDeathEvent)+ ')');
            WinData.AnimalFileByID.SQL.Add('AND (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
            WinData.AnimalFileByID.SQL.Add('AND (A.AnimalDeleted=FALSE)');
            ApplySortToAnimalFileByIdAndOpenQuery();
            // Add query to fFilters.LeftHerdSQL so Filter can be applied on top of Animal Select filter.
            fFilters.LeftHerdSQL := WinData.AnimalFileByID.SQL.Text;
         finally
            WinData.AnimalFileByID.EnableControls;
            cxAnimalGridView.DataController.EndFullUpdate;
         end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.SoldAnimalFilter(const AShowCulled : Boolean = False);
begin
  try
      Update;
      begin
       cxAnimalGridView.DataController.BeginFullUpdate;
       WinData.AnimalFileByID.DisableControls;
          try
             WinData.AnimalFileByID.Active := False;
             WinData.AnimalFileByID.SQL.Clear;
             WinData.AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.*');
             WinData.AnimalFileByID.SQL.Add('FROM Animals A');
             WinData.AnimalFileByID.SQL.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)');
             WinData.AnimalFileByID.SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
             WinData.AnimalFileByID.SQL.Add('WHERE (E.EventType = '+IntToStr(CSaleDeathEvent)+')');
             WinData.AnimalFileByID.SQL.Add('AND   (S.Sold = True)');
             if ( AShowCulled ) then
                WinData.AnimalFileByID.SQL.Add('AND   (S.Culled IN (SELECT ID FROM GenLook WHERE ListType = '+IntToStr(LCulledCode)+'))')
             else
                WinData.AnimalFileByID.SQL.Add('AND   ((S.Culled IS NULL) OR (S.Culled = 0))');
             WinData.AnimalFileByID.SQL.Add('AND   (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
             WinData.AnimalFileByID.SQL.Add('AND   (A.InHerd = False)');
             WinData.AnimalFileByID.SQL.Add('AND   (A.AnimalDeleted = False)');
             ApplySortToAnimalFileByIdAndOpenQuery();
             // Add query to fFilters.LeftHerdSQL so Filter can be applied on top of Animal Select filter.
             fFilters.LeftHerdSQL := WinData.AnimalFileByID.SQL.Text;
          finally
             WinData.AnimalFileByID.EnableControls;
             cxAnimalGridView.DataController.EndFullUpdate;
          end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.DeadAnimalFilter;
begin
  try
      Update;
      begin
       cxAnimalGridView.DataController.BeginFullUpdate;
       WinData.AnimalFileByID.DisableControls;
          try
             WinData.AnimalFileByID.Active := False;
             WinData.AnimalFileByID.SQL.Clear;
             WinData.AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.*');
             WinData.AnimalFileByID.SQL.Add('FROM Animals A');
             WinData.AnimalFileByID.SQL.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)');
             WinData.AnimalFileByID.SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
             WinData.AnimalFileByID.SQL.Add('WHERE (E.EventType = '+IntToStr(CSaleDeathEvent)+')');
             WinData.AnimalFileByID.SQL.Add('AND   (S.Sold = False)');
             WinData.AnimalFileByID.SQL.Add('AND   (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
             WinData.AnimalFileByID.SQL.Add('AND   (A.InHerd = False)');
             WinData.AnimalFileByID.SQL.Add('AND   (A.AnimalDeleted = False)');
             ApplySortToAnimalFileByIdAndOpenQuery();
             // Add query to fFilters.LeftHerdSQL so Filter can be applied on top of Animal Select filter.
             fFilters.LeftHerdSQL := WinData.AnimalFileByID.SQL.Text;
          finally
             WinData.AnimalFileByID.EnableControls;
             cxAnimalGridView.DataController.EndFullUpdate;
          end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.BullsInUseFilter;
begin
   try
      Update;
      cxAnimalGridView.DataController.BeginFullUpdate;
      WinData.AnimalFileByID.DisableControls;
      WinData.AnimalFileByID.Active := False;
      with WinData.AnimalFileByID.SQL do
         try
            Clear;
            Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
            Add('INNER JOIN BullSemenStk B ON (B.AnimalID=A.ID)');
            Add('WHERE (A.AnimalDeleted=FALSE)');
            Add('AND   (A.Sex="'+cSex_Bull+'")');
            //   04/07/18 [V5.8 R0.6] /MK Change - Only show bulls that have an Animal Number.
            Add('AND   (A.AnimalNo <> "")');
            Add('AND   (B.InUse = True)');
            Add('AND   (A.Breeding = True)');
            {
            //   28/09/18 [V5.8 R3.0] /MK Change - Bulls In Use filter changed to be like the Service, Planned Bull and Stock Bull queries in HerdLookup i.e. check for null breed.
            Add('AND   ((A.PrimaryBreed IS NOT NULL) OR (A.PrimaryBreed > 0))');
            }
            ApplySortToAnimalFileByIdAndOpenQuery();
            // Set fFilters.AIBullSQL to WinData.AnimalFileByID.SQL so fFilters.ApplyFilter
            // can look at this SQL if other filter applied on top of AIBullSQL.
            fFilters.AIBullSQL := '';
            fFilters.AIBullSQL := WinData.AnimalFileByID.SQL.Text;
         finally
            WinData.AnimalFileByID.EnableControls;
            cxAnimalGridView.DataController.EndFullUpdate;
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

// Beef Cattle Includes
procedure TMenuForm.BeefCattleFilter;
begin
   try
      Update;
      cxAnimalGridView.DataController.BeginFullUpdate;
      WinData.AnimalFileByID.DisableControls;
      WinData.AnimalFileByID.Active := False;
      with WinData.AnimalFileByID.SQL do
         try
            Clear;
            Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
            Add('INNER JOIN Breeds B ON (B.ID=A.PrimaryBreed)');
            Add('WHERE (A.InHerd = True)');
            Add('AND   (A.AnimalDeleted = False)');
            Add('AND   (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
            Add('AND   (((B.EligibleforPremium = True) AND (A.Sex = "'+cSex_Female+'") AND (A.LactNo = 0))');
            Add('OR     ((B.EligibleforPremium = False) AND (A.Sex = "'+cSex_Female+'") AND (A.LactNo = 0) AND (A.Breeding=False))');
            Add('OR     ((A.Sex = "'+cSex_Bull+'") AND (A.Breeding=False))');
            Add('OR     (A.Sex = "'+cSex_Steer+'"))                        ');
            ApplySortToAnimalFileByIdAndOpenQuery();
         finally
            WinData.AnimalFileByID.EnableControls;
            cxAnimalGridView.DataController.EndFullUpdate;
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.AnimalSelectClick(Sender: TObject);
begin
   if ( Sender is TMenuItem) then
      DoFilter( TQuickFilter((Sender as TMenuItem).Tag),( Sender as TMenuItem).Caption );
end;

procedure TMenuForm.GetHeifers( const AYear : Word; AHeiferTypes : THeiferTypes );
begin
   try
      Update;
      begin
       cxAnimalGridView.DataController.BeginFullUpdate;
       WinData.AnimalFileByID.DisableControls;
          try
             WinData.AnimalFileByID.Active := False;
             WinData.AnimalFileByID.SQL.Clear;
             WinData.AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');

             if not (htAllHeifers in AHeiferTypes) then
                WinData.AnimalFileByID.SQL.Add('INNER JOIN Breeds B ON (B.ID=A.PrimaryBreed)');
             WinData.AnimalFileByID.SQL.Add('WHERE   (A.Sex="'+cSex_Female+'")');
             if (htDairyHeifer in AHeiferTypes) then
                 WinData.AnimalFileByID.SQL.Add('AND (B.EligibleforPremium = False)')
             else if (htBeefHeifer in AHeiferTypes) then
                 WinData.AnimalFileByID.SQL.Add('AND (B.EligibleforPremium = True)');

             WinData.AnimalFileByID.SQL.Add('AND   (A.LactNo = 0)');
             WinData.AnimalFileByID.SQL.Add('AND   (A.InHerd = True)');
             WinData.AnimalFileByID.SQL.Add('AND   (A.AnimalDeleted = False)');
             WinData.AnimalFileByID.SQL.Add('AND   (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
             WinData.AnimalFileByID.SQL.Add('AND   (EXTRACT(YEAR FROM A.DateOfBirth) = :AYear)');
             WinData.AnimalFileByID.Params[0].AsSmallInt := AYear;
             ApplySortToAnimalFileByIdAndOpenQuery();
          finally
             WinData.AnimalFileByID.EnableControls;
             cxAnimalGridView.DataController.EndFullUpdate;
          end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.MaleCalveFilter (const AYear : Word);
begin
   try
      Update;
      begin
       cxAnimalGridView.DataController.BeginFullUpdate;
       WinData.AnimalFileByID.DisableControls;
          try
             WinData.AnimalFileByID.Active := False;
             WinData.AnimalFileByID.SQL.Clear;
             WinData.AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
             WinData.AnimalFileByID.SQL.Add('WHERE (A.Sex IN ("'+cSex_Bull+'", "'+cSex_Steer+'"))');
             WinData.AnimalFileByID.SQL.Add('AND   (A.InHerd = True)');
             WinData.AnimalFileByID.SQL.Add('AND   (A.AnimalDeleted = False)');
             WinData.AnimalFileByID.SQL.Add('AND   (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
             WinData.AnimalFileByID.SQL.Add('AND   (EXTRACT(YEAR FROM A.DateOfBirth) = :AYear)');
             WinData.AnimalFileByID.Params[0].AsInteger := AYear;
             ApplySortToAnimalFileByIdAndOpenQuery();
          finally
             WinData.AnimalFileByID.EnableControls;
             cxAnimalGridView.DataController.EndFullUpdate;
          end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.AllCalvesFilter(const AYear: Word);
begin
   try
      Update;
      begin
       cxAnimalGridView.DataController.BeginFullUpdate;
       WinData.AnimalFileByID.DisableControls;
          try
             WinData.AnimalFileByID.Active := False;
             WinData.AnimalFileByID.SQL.Clear;
             WinData.AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
             WinData.AnimalFileByID.SQL.Add('WHERE (A.InHerd = True)');
             WinData.AnimalFileByID.SQL.Add('AND   (A.AnimalDeleted = False)');
             WinData.AnimalFileByID.SQL.Add('AND   (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
             WinData.AnimalFileByID.SQL.Add('AND   (EXTRACT(YEAR FROM A.DateOfBirth) = :AYear)');
             WinData.AnimalFileByID.Params[0].AsInteger := AYear;
             ApplySortToAnimalFileByIdAndOpenQuery();
          finally
             WinData.AnimalFileByID.EnableControls;
             cxAnimalGridView.DataController.EndFullUpdate;
          end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.pmShowAnimalOptionsPopup(Sender: TObject);
begin
   pmiCurrentHerd.Visible := WinData.ActiveFilter;
end;

procedure TMenuForm.pmFilterMenuPopup(Sender: TObject);
begin
   ClearFilter1.Visible := WinData.ActiveFilter;
   GoTo2.Visible := ( WinData.ActiveFilter) and ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) );
   BuildOnFarmEventsMenu(pmFilterMenu, OnFarmEvents2);

   Application.ProcessMessages;
   Update;
end;

procedure TMenuForm.RunActionWarningsReminders;
begin
   if Preferences.ValueAsBoolean[cGSShowActionWarningRemindersOnStartup] = True then
      if MessageDlg('Would you like to view Action/Warnings/Reminder Reports now?',mtConfirmation,[mbYes,mbNo],0) = idYes then
         begin
            Application.CreateForm(TfmCAFREFertListData, fmCAFREFertListData);
            fmCAFREFertListData.PreviewListData(True);
         end;
end;

procedure TMenuForm.HideAllNewEventPanelItems;
begin
   Update;
   lEventPanelDesc.Left := cContainerLeft;
   lEventPanelDesc.Caption := '';
   lEventPanelDesc.Width := 494;
   pBlockMovementsContainer.Visible := False;
   pBreedingContainter.Visible := False;
   pBreedingLink.BevelOuter := bvNone;
   lBreedingLink.Style.Font.Color := clWhite;
   lBreedingLink.Style.Font.Size := 8;
   pMovementsContainter.Visible := False;
   pMovementsLink.BevelOuter := bvNone;
   lMovementsLink.Style.Font.Color := clWhite;
   lMovementsLink.Style.Font.Size := 8;
   pRegCalfRegContainter.Visible := False;
   pRegisterCalfRegLink.BevelOuter := bvNone;
   lRegisterCalfRegLink.Style.Font.Color := clWhite;
   lRegisterCalfRegLink.Style.Font.Size := 8;
   pVetFeedsContainter.Visible := False;
   pVeterinaryFeedsLink.BevelOuter := bvNone;
   lVeterinaryFeedsLink.Style.Font.Color := clWhite;
   lVeterinaryFeedsLink.Style.Font.Size := 8;
   pManagementContainter.Visible := False;
   pManagementLink.BevelOuter := bvNone;
   lManagementLink.Style.Font.Color := clWhite;
   lManagementLink.Style.Font.Size := 8;
   pGroupsContainter.Visible := False;
   pGroupsLink.BevelOuter := bvNone;
   lGroupsLink.Style.Font.Color := clWhite;
   lBreedingLink.Style.Font.Size := 8;
   pKingswoodLink1.BevelOuter := bvNone;
   lKingswoodLinks.Style.Font.Color := clWhite;
   lKingswoodLinks.Style.Font.Size := 8;
   pKingswoodLinksContainer.Visible := False;
   pOnFarmEventsLink.BevelOuter := bvNone;
   lOnFarmEventsLink.Style.Font.Color := clWhite;
   lOnFarmEventsLink.Style.Font.Size := 9;
   pMovementsInOutLink.BevelOuter := bvNone;
   lMovementsInOutLink.Style.Font.Color := clWhite;
   lMovementsInOutLink.Style.Font.Size := 9;
   pGrpAnimalWelfareLink.BevelOuter := bvNone;
   lGrpAnimalWelfareLink.Style.Font.Color := clWhite;
   lGrpAnimalWelfareLink.Style.Font.Size := 8;
   pCrushContainer.Visible := False;
   pParlourEventsLink.BevelOuter := bvNone;
   lParlourEventsLink.Style.Font.Color := clWhite;
   lParlourEventsLink.Style.Font.Size := 8;
   pBordBiaLink.BevelOuter := bvNone;
   lBordBiaLink.Style.Font.Color := clWhite;
   lBordBiaLink.Style.Font.Size := 8;
   Update;
end;

procedure TMenuForm.lBreedingLinkClick(Sender: TObject);
begin
   if ( lBreedingLink.Caption = 'Crush' ) then
      ShowSingleAnimalEventMenu(mtCrush)
   else
      ShowSingleAnimalEventMenu(mtBreeding);
end;

procedure TMenuForm.pbBreedingLinkPaint(Sender: TObject);
begin
   GradVertical(pbBreedingLink.Canvas, pbBreedingLink.ClientRect, $007BF4A4, $000B862C);
end;

procedure TMenuForm.pbBreedingContainterPaint(Sender: TObject);
begin
   GradVertical(pbBreedingContainter.Canvas, pbBreedingContainter.ClientRect, $007BF4A4, $000B862C);
end;

procedure TMenuForm.lMovementsLinkClick(Sender: TObject);
begin
   ShowSingleAnimalEventMenu(mtMovements);
end;

procedure TMenuForm.pbMovementsContainterPaint(Sender: TObject);
begin
   GradVertical(pbMovementsContainter.Canvas, pbMovementsContainter.ClientRect, $00FDC19D, $00D19633);
end;

procedure TMenuForm.pbMovementsLinkPaint(Sender: TObject);
begin
   GradVertical(pbMovementsLink.Canvas, pbMovementsLink.ClientRect, $00FFDF9F, $00D19633);
end;

procedure TMenuForm.lVeterinaryFeedsLinkClick(Sender: TObject);
begin
   ShowSingleAnimalEventMenu(mtVeterinaryFeeds);
end;

procedure TMenuForm.pbVetFeedsContainterPaint(Sender: TObject);
begin
   GradVertical(pbVetFeedsContainter.Canvas, pbVetFeedsContainter.ClientRect, $0069CCFC, $00048ED0);
end;

procedure TMenuForm.pbVeterinaryFeedsLinkPaint(Sender: TObject);
begin
   GradVertical(pbVeterinaryFeedsLink.Canvas, pbVeterinaryFeedsLink.ClientRect, $0069CCFC, $00048ED0);
end;

procedure TMenuForm.lRegisterCalfRegLinkClick(Sender: TObject);
begin
   ShowSingleAnimalEventMenu(mtRegCalfReg);
end;

procedure TMenuForm.pbRegisterCalfRegContainterPaint(Sender: TObject);
begin
   GradVertical(pbRegisterCalfRegContainter.Canvas, pbRegisterCalfRegContainter.ClientRect, $00A5DFFE, $0001A6FE);
end;

procedure TMenuForm.pbRegisterCalfRegLinkPaint(Sender: TObject);
begin
   GradVertical(pbRegisterCalfRegLink.Canvas, pbRegisterCalfRegLink.ClientRect, $00A5DFFE, $0001A6FE);
end;

procedure TMenuForm.lGroupsLinkClick(Sender: TObject);
begin
   ShowSingleAnimalEventMenu(mtAnimalGroups);
end;

procedure TMenuForm.pbGroupsLinkPaint(Sender: TObject);
begin
   GradVertical(pbGroupsLink.Canvas, pbGroupsLink.ClientRect, $0078AAFC, $001369F9);
end;

procedure TMenuForm.pbGroupsContainterPaint(Sender: TObject);
begin
   GradVertical(pbGroupsContainter.Canvas, pbGroupsContainter.ClientRect, $0078AAFC, $001369F9);
end;

procedure TMenuForm.lManagementLinkClick(Sender: TObject);
begin
   ShowSingleAnimalEventMenu(mtManagement);
end;

procedure TMenuForm.pbManagementLinkPaint(Sender: TObject);
begin
   GradVertical(pbManagementLink.Canvas, pbManagementLink.ClientRect, $00B1B2EC, $00504C9E);
end;

procedure TMenuForm.pbManagementContainterPaint(Sender: TObject);
begin
   GradVertical(pbManagementContainter.Canvas, pbManagementContainter.ClientRect, $00B1B2EC, $00504C9E);
end;

procedure TMenuForm.lKingswoodLinksClick(Sender: TObject);
begin
   ShowSingleAnimalEventMenu(mtKingswoodLinks);
end;

procedure TMenuForm.pbAnimalWelfareLinkPaint(Sender: TObject);
begin
   GradVertical(pbAnimalWelfareLink.Canvas, pbAnimalWelfareLink.ClientRect, $00ACE25A, $0089CE22);
end;

procedure TMenuForm.pbKingswoodLinksContainerPaint(Sender: TObject);
begin
   GradVertical(pbKingswoodLinksContainer.Canvas, pbKingswoodLinksContainer.ClientRect, $00ACE25A, $0089CE22);
end;

procedure TMenuForm.lOnFarmEventsLinkClick(Sender: TObject);
begin
   HideHintStyleController;
   ShowOnFarmEvents;
end;

procedure TMenuForm.lMovementsInOutLinkClick(Sender: TObject);
begin
   ShowSingleAnimalEventMenu(mtBlockMovements);
end;

procedure TMenuForm.lGrpAnimalWelfareLinkClick(Sender: TObject);
begin
   ShowBlockAnimalWelfare;
end;

procedure TMenuForm.pbGrpAnimalWelfareLinkPaint(Sender: TObject);
begin
   GradVertical(pbGrpAnimalWelfareLink.Canvas, pbGrpAnimalWelfareLink.ClientRect, $00ACE25A, $0089CE22);
end;

procedure TMenuForm.lParlourEventsLinkClick(Sender: TObject);
begin
   TfmAnimalBrowser.ShowTheForm;
   SetupQuery;
end;

procedure TMenuForm.pbParlourEventsLinkPaint(Sender: TObject);
begin
   GradVertical(pbParlourEventsLink.Canvas, pbParlourEventsLink.ClientRect, $007BF4A4, $000B862C);
end;

procedure TMenuForm.ShowCalvingEvent;
var
   bChangedCalving : Boolean;
   iHerdID,
   iShowCalfID,
   iNoCalvesSaved : Integer;
   sNextNatID,
   sMessageTxt : String;

   procedure ShowCalvingScr;
   begin
      if ( FCountry = Ireland ) then
         WinData.HerdIdentifierByHerdID(WinData.AnimalFileByIDHerdID.AsInteger)
      else if ( WinData.GlobalSettings.NatIDToAnimalNo ) and ( FCountry = NIreland ) then
         // if NI herd, check for existance of Herd Identifier. If found
         // we can use this number to determine what value (from the natidnum)
         // should be inserted into the animalno field.
         if ( WinData.OwnerFile.Locate('ID', WinData.AnimalFileByIDHerdID.AsInteger,[ ]) ) then
            if ( WinData.OwnerFileHerdIdentifier.AsString = '' ) then
               if ( MessageDlg('Your Herd Designator number cannot be found.'+#13#10+
                               'This number is used to create the calf number.'+#13#10+#13#10+
                               'Do you want to enter your Herd Designator number now?',mtConfirmation,[mbYes,mbNo],0) = idYes ) then
                  uHerdSetup.ShowTheForm(False, 'HerdIdentifier');

      CheckCalfReg := False;

      //   31/01/17 [V5.6 R4.2] /MK Additional Feature - If Herd country is Ireland then show TagIdentifierSelection screen before Calving screen opens if preference is on.
      //   21/04/17 [V5.6 R8.0] /MK Change - If Herd Country is Ireland or NIreland and Auto-Gen of Tag is on then check if auto-generated tag exists already.
      //                                     If the auto-generated tag exists already then show message that it exists and bring up the Preferences screen.
      //   26/07/17 [V5.7 R1.1] /MK Change - Check to see if for whatever reason was there a tag added to the TagStore that is already in use and allow the user
      //                                     to change the Next NatID in the preferences screen - Philip (TGM) reported case of this happening and calving screen
      //                                     (both the old version and new version of the calving) crashed at saving the calving trying to remove the tag from the tag store.
      //   22/08/17 [V5.7 R2.0] /MK Bug Fix - While check should be checking for InputNatIDStyle also so if user changes InputNatIDStyle to <> ListInput MessageDlg won't appear.
      if ( FCountry in [Ireland, NIreland] ) then
         begin
            while ( HerdLookup.HerdOwnerData.InputNatIDStyle = cInputNatIDStyle_ListInput ) and ( HerdLookup.ErrorInTagStore ) do
               begin
                  MessageDlg('There is an error in the list of available tags.'+cCRLF+
                             'Click OK below to correct the next available tag..',mtInformation,[mbOK],0);
                  TfmGlobalSettings.ShowPreferences(ListEntryED, 'Calving');
               end;
         end;

      //   13/09/18 [V5.8 R2.8] /MK Change - Added try, except around opening/closing uCalvingEvent to trap Access Violation errors.
      try
         if ( FCountry = Ireland ) then
             begin
                if ( WinData.GlobalSettings.DisplayTagIdentifierSelector ) then
                   begin
                      if TfmTagIdentifierSelection.ShowTheForm = mrOK then
                         begin
                            ShowUpdateHerdDesignatorUtility;
                            TfmCalvingEvent.ShowForm(bChangedCalving, iShowCalfID, ctAddCalving, WinData.AnimalFileByIDID.AsInteger)
                         end
                      else
                         Abort;
                   end
                else
                   TfmCalvingEvent.ShowForm(bChangedCalving, iShowCalfID, ctAddCalving, WinData.AnimalFileByIDID.AsInteger)
             end
         else
            TfmCalvingEvent.ShowForm(bChangedCalving, iShowCalfID, ctAddCalving, WinData.AnimalFileByIDID.AsInteger);
      except
          on e : exception do

         ApplicationLog.LogError('Error created in the calving screen.'+' - '+e.Message);
      end;

      if ( WinData.CalvingSaved ) then
         begin
            if ( WinData.CalvingSurvey <> nil ) and (WinData.CalvingSurvey.RegisterCalves) then
               begin
                  //   02/04/15 [V5.4 R2.4] /MK Bug Fix - Only check for SireBreedDifferToCalfBreed for Irish herds as APHIS/CTS send calf breed.
                  if ( FCountry = Ireland ) then
                    begin
                       if ( TfmCalvesNoSires.GetCalvesWithNoSires = 0 ) then
                          if ( TfmSireBreedDifferToCalfBreed.GetCalves = 0 ) then
                              ShowCalfReg;
                    end
                  else if ( FCountry <> Ireland ) then
                     ShowCalfReg;
               end
            else if WinData.ShowCalfRegReminder then
               begin
                  WinData.ShowCalfRegReminder := False;
                  sMessageTxt := 'Do you want to complete Calf Registration for this calf?';
                  if ( Length(sMessageTxt) > 0 ) then
                     if ( MessageDlg(sMessageTxt, mtConfirmation, [mbYes,mbNo],0) = idYes ) then
                        begin
                           //   02/04/15 [V5.4 R2.4] /MK Bug Fix - Only check for SireBreedDifferToCalfBreed for Irish herds as APHIS/CTS send calf breed.
                           if ( FCountry = Ireland ) then
                             begin
                                if ( TfmCalvesNoSires.GetCalvesWithNoSires = 0 ) then
                                   if ( TfmSireBreedDifferToCalfBreed.GetCalves = 0 ) then
                                       ShowCalfReg;
                             end
                           else if ( FCountry <> Ireland ) then
                              ShowCalfReg;
                        end;
               end;
         end;
   end;

begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
         begin
            // Check the Animal Sex
            if CheckAnimalOKforBreeding then
               begin
                  // check old enough to breed

                  if WinData.HerdSpecies = cSpecies_Goats then
                     begin
                        { Check GOAT under 9 months }
                        { V3.8 R0.5}
                        if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -9)) then
                            raise errormsg.CreateFmt(cCalvingAnimalUnder9Mths,[WinData.AnimalFileByIDNatIDNum.AsString, 9, FormatDate(Date,dsIrish)])
                        else if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -18)) then
                           begin
                              if MessageDlg(Format(cCalvingAnimalUnder18Mths,[WinData.AnimalFileByIDNatIDNum.AsString,18,FormatDate(Date,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
                                 Abort;
                           end;
                     end
                  else
                     begin
                        if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -12)) then
                           raise errormsg.CreateFmt(cCalvingAnimalUnder12Mths,[WinData.AnimalFileByIDNatIDNum.AsString, 12, FormatDate(Date,dsIrish)])
                        else
                          { Check if animal is under 18 months old, if so warn user }
                          { V3.8 R0.5}

                          if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -18)) then
                             if MessageDlg(Format(cCalvingAnimalUnder18Mths,[WinData.AnimalFileByIDNatIDNum.AsString,18,FormatDate(Date,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
                                Abort;
                          { # V3.8 R0.5}
                     end;

                   if ( WinData.EventDataHelper.GetLastEventDate(WinData.AnimalFileByIDID.Value, CCalvingEvent ) ) > ( IncMonth(Date, -3) ) then
                      if ( ( MessageDlg('It is less than 3 months since the last calving!', mtError, [mbOK], 0) ) = mrOK ) then
                         Abort;

                   //   13/03/20 [V5.9 R2.9] /MK Change - Reformatted the code so it was easier to understand, reported issue with it for Gordon McConkey.
                   if ( FSelectedHerdType = htDairy ) then { A check if Dry Off required for dairy herds }
                      begin
                         if ( ((WinData.GlobalSettings.MandatoryBreedingEvents) or (WinData.GlobalSettings.MandatoryDryOffEvent)) and
                              (WinData.AnimalFileByIDLactNo.Value > 0) and
                              not((WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CDryOffEvent))) ) then
                            begin
                               if ( Messagedlg('This Cow has no Drying Off record. '+
                                               'Do you want to continue with this Calving?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
                                  ShowCalvingScr
                            end
                         else
                            ShowCalvingScr;
                      end
                   else { A check for Dry Off is not required for non dairy herds. }
                      ShowCalvingScr
               end;
         end;

   //   19/02/19 [V5.8 R6.9] /MK Change - If WinData.CalvingSaved don't run SetupQuery, just close and open WinData.AnimalFileByID and locate calved animal.
   if ( WinData.CalvingSaved ) then
      RefreshAnimalGrid;
end;

procedure TMenuForm.ShowHeatBullingEvent;
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      if CheckAnimalOKforBreeding then
         Bullings.ShowBulling(AddBulling); // Display the Bulling  Form
end;

procedure TMenuForm.ShowServiceEvent;
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      // Check the Animal Sex
      if CheckAnimalOKforBreeding then
         // Display the Services Form
         Services.ShowService(AddService);
end;

procedure TMenuForm.ShowPDEvent;
begin
   if ( WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                WinData.AnimalFileByIDHerdID.AsInteger,
                                WinData.AnimalFileByIDAnimalNo.AsString,
                                WinData.AnimalFileByIDNatIDNum.AsString,FALSE) ) then Exit;

   // Check the Animal Sex
   if ( not(CheckAnimalOKforBreeding) ) then Exit;

   if ( WinData.GlobalSettings.MandatoryBreedingEvents ) then
      begin
         if ( not(WinData.Events.Locate('AnimalID;AnimalLactNo;EventType',
                                        VarArrayOf([WinData.AnimalFileByIDID.Value,
                                        WinData.AnimalFileByIDLactNo.Value,
                                        CServiceEvent]),[])) ) then
            begin
               MessageDlg('This Cow has no Service Record',mtError,[mbok],0);
               Abort;
            end;
      end;
   // Test the Animal hasn't already got a PD Record for this Lactation
   if ( WinData.Events.Locate('AnimalID;AnimalLactNo;EventType',
                              VarArrayOf([WinData.AnimalFileByIDID.Value,
                                          WinData.AnimalFileByIDLactNo.Value,
                                          CPregDiagEvent]),[]) ) then
      begin
         //   30/10/15 [V5.4 R9.8] /MK Modification - Give user warning that a PD record already exists and do they want to enter
         //                                           a new PD record for this cow. If the user answers Yes then the old PD record is
         //                                           updated with an EventType that allows the new PD event to go in on the current lactation.
         if ( MessageDlg('This Cow already has a PD record.'+cCRLF+
                         'Do you want to enter a new PD record for this cow?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
            Exit
         else
            WinData.UpdatePregDiagEvent(WinData.AnimalFileByIDID.AsInteger,WinData.AnimalFileByIDLactNo.AsInteger);
      end;

   WinData.FPregStatusChanged := False;
   PregDiag.ShowPD(AddPD);

   if ( WinData.FPregStatusChanged ) then
      SetUpQuery(True);
end;

procedure TMenuForm.ShowDryOffEvent;
var
   OKcontinue : Boolean;
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      // Check the Animal Sex
      if CheckAnimalOKforBreeding then
         begin
            OKContinue := TRUE;
            // 0 Lactation animals should have a Calving date to be dried Off
            if ( WinData.AnimalFileByIDLactNo.AsInteger = 0 ) then
               OkContinue := ( MessageDLG('Animal has no Calving Date (Lactation 0)' + #13 +
                                          'Do you want to continue',mtWarning,[mbYes,mbNo],0) = mrYes );
            if OKContinue then
               begin
                  if WinData.GlobalSettings.MandatoryBreedingEvents then
                     begin
                        if not ( WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CServiceEvent) ) then
                           begin
                              Messagedlg ('This Cow has no Service Record',mtinformation,[mbok],0);
                              Abort;
                           end;
                        if not ( WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CPregDiagEvent) ) then
                           begin
                              Messagedlg ('This Cow has no PD Record',mtinformation,[mbok],0);
                              Abort;
                           end;
                     end;

                   if FSelectedHerdType <> htBeef then
                      begin
                         if not ( WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CDryOffEvent) ) then
                            uHealth.ShowHealth(AddDryingOff)
                         else
                            begin
                               if ( FSelectedHerdType = htDairy ) then
                                  MessageDlg('This Cow has a Drying Off Record',mtInformation,[mbOK],0)
                               else if ( FSelectedHerdType = htSuckler ) then
                                  MessageDlg('This Cow has a Weaning Record',mtInformation,[mbOK],0);
                            end;
                     end;
               end;
         end;
end;

procedure TMenuForm.actCalvingExecute(Sender: TObject);
begin
   ShowCalvingEvent;
end;

procedure TMenuForm.pbOnFarmEventsLinkPaint(Sender: TObject);
begin
   GradVertical(pbOnFarmEventsLink.Canvas, pbOnFarmEventsLink.ClientRect, $007BF4A4, $000B862C);
end;

procedure TMenuForm.pbMovementsInOutLinkPaint(Sender: TObject);
begin
   GradVertical(pbMovementsInOutLink.Canvas, pbMovementsInOutLink.ClientRect, $00FDC19D, $00D19633);
end;

procedure TMenuForm.pbBlockMovementsContainerPaint(Sender: TObject);
begin
   GradVertical(pbBlockMovementsContainer.Canvas, pbBlockMovementsContainer.ClientRect, $00FDC19D, $00D19633);
end;

procedure TMenuForm.actHeatBullingExecute(Sender: TObject);
begin
   ShowHeatBullingEvent;
end;

procedure TMenuForm.actServiceExecute(Sender: TObject);
begin
   ShowServiceEvent
end;

procedure TMenuForm.actPDExecute(Sender: TObject);
begin
   ShowPDEvent;
end;

procedure TMenuForm.actDryOffExecute(Sender: TObject);
begin
   ShowDryOffEvent;
end;

procedure TMenuForm.ShowPurchaseEvent;
begin
   fSetUpAnimals.DefaultAnimalType := atPurchasing;
   AddAnimal;
end;

procedure TMenuForm.ShowSalesDeathEvent(const AIsSaleEvent : Boolean);
var
   CallSetupQuery : Boolean;
begin
   // ensure animal has breed assigned before allowing sale/death event.
   If WinData.AnimalFileByIDPrimaryBreed.AsInteger <= 0 then
      begin
         MessageDLG('Animal Breed must be entered before entering Sale/Death Event',mtWarning,[mbOK],0);
         Abort;
      end;

   if NOT WinData.HasSaleDeath(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger) then
      begin
         if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                        WinData.AnimalFileByIDHerdID.AsInteger,
                                        WinData.AnimalFileByIDAnimalNo.AsString,
                                        WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
         begin
            // Need to locate a Sales Record for an animal if it exists.
            // Changed ShowSalesDeaths Procedure call to include PreSale Boolean
            if WinData.Events.Locate('AnimalId;EventType',VarArrayOf([WinData.AnimalFileByIDID.AsVariant, cSaleDeathEvent]),[] ) then
               CallSetupQuery := uSalesDeaths.ShowSalesDeaths(AmendSaleDeath, False)
            else   // Create a new Sales record
               begin
                  if ( AIsSaleEvent ) then
                     CallSetupQuery := uSalesDeaths.ShowSalesDeaths(AddSale, False)
                  else
                     CallSetupQuery := uSalesDeaths.ShowSalesDeaths(AddDeath, False);
               end;
            if CallSetupQuery then
               SetUpQuery;
         end;
      end
   else
      MessageDlg('Sale/Death event already exists',mtInformation,[mbOK],0);
end;

procedure TMenuForm.ShowMovementPermits;
begin
   Update;
   uCMMSPermits.ShowForm(WinData.UserDefaultHerdID,0,NBAS31A);
   Update;
end;

procedure TMenuForm.actPurchaseExecute(Sender: TObject);
begin
   ShowPurchaseEvent;
end;

procedure TMenuForm.actSalesDeathsExecute(Sender: TObject);
begin
   ShowSalesDeathEvent(True)
end;

procedure TMenuForm.actMartFilesExecute(Sender: TObject);
begin
   ShowMartImport;
end;

procedure TMenuForm.actAPHISEPermitExecute(Sender: TObject);
begin
   OpenUrl('https://www2.dardni.gov.uk/gatewayweb/internet/');
end;

procedure TMenuForm.actFactorySalesExecute(Sender: TObject);
begin
   ShowFactorySales;
end;

procedure TMenuForm.miFactorySalesClick(Sender: TObject);
begin
   TfRemittance.Create(Self).Execute;
   SetUpQuery;
end;

procedure TMenuForm.miMartFilesClick(Sender: TObject);
begin
   TfmMartImport.open(mftMART,WinData.userDefaultHerdID);
   SetUpQuery;
end;

procedure TMenuForm.actMovementPermitsExecute(Sender: TObject);
var
   pt : tPoint;
begin
   CheckSelectedHerd;
   if ( FCountry = Ireland ) then
      begin
         if (AIMClient.ClientExists) then
            begin
               GetCursorPos(pt);
               pmAIMMovements.Popup(pt.x,pt.y);
            end
         else
            ShowMovementPermits
      end
   else if ( FCountry = NIreland ) then
      //   13/09/11 [V5.0 R0.7] /MK Bug Fix - Was Looking At Movements In And Not APHISMovements.
      MovementsInClick(Sender)
   else if ( FCountry = England ) then
      ShowCTSMovements;
end;

procedure TMenuForm.ShowVetPurchEvent;
begin
   TfMediPurch.Execute;
end;

procedure TMenuForm.ShowVetTreatEvent(ACrushTreat : Boolean);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      uHealth.ShowHealth(AddHealth,ACrushTreat)
end;

procedure TMenuForm.ShowFeedPurchEvent;
begin
   //   11/07/13 [V5.1 R8.3] /MK Bug Fix - Program not checking if mode of database is in Insert or Edit Mode after FdStkEvents was posted.
   if ( not(WinData.FdStkEvents.State in [dsInsert, dsEdit]) ) then
      WinData.FdStkEvents.Append
   else
      begin
         WinData.FdStkEvents.Cancel;
         WinData.FdStkEvents.Append;
      end;
   WinData.CreateAndShowForm(TfFeedPurch);
end;

procedure TMenuForm.ShowFeedAlloc;
begin
   WinData.FeedEvents.DisableControls;
   WinData.FeedEvents.MasterFields := '';
   WinData.FeedEvents.MasterSource := nil;

   uFeedAlloc.ShowTheForm(0);

   WinData.FeedEvents.MasterFields := 'ID';
   WinData.FeedEvents.MasterSource := Windata.AnimalSourceByID;
   WinData.FeedEvents.EnableControls;

   btnFeedDiary.Enabled := ( (Def.Definition.dUseManCal) or (Def.Definition.dUseBeefMan) ) and ( WinData.UsingFeedAllocation );
end;

procedure TMenuForm.actVetPurchExecute(Sender: TObject);
begin
   ShowVetPurchEvent;
end;

procedure TMenuForm.actVetTreatExecute(Sender: TObject);
begin
   ShowVetTreatEvent(False);
end;

procedure TMenuForm.actFeedPurchExecute(Sender: TObject);
begin
   ShowFeedPurchEvent;
end;

procedure TMenuForm.actFeedAllocExecute(Sender: TObject);
begin
   ShowFeedAlloc;
end;

procedure TMenuForm.ShowReconcileHerd;
begin
   CheckSelectedHerd;
   if FCountry = NIreland then
      begin
         WinData.CallProg.HerdReconciliation;
         //   26/06/14 [V5.3 R2.8] /MK Change - Show FQAS and DaysToFQAS after NIHerdReconcile and refresh grid with new QADate from HerdReconcile import.
         cxAnimalGridViewDaysToFQAS.Visible := ( FCountry = NIreland ) and ( FFQASDateCount > 0 );
         cxAnimalGridViewDaysToFQAS.Hidden := ( not(cxAnimalGridViewDaysToFQAS.Visible) );
         cxAnimalGridViewPurchFQAS.Visible := cxAnimalGridViewDaysToFQAS.Visible;
         cxAnimalGridViewPurchFQAS.Hidden := cxAnimalGridViewDaysToFQAS.Hidden;
         WinData.AnimalFileByID.Close;
         WinData.AnimalFileByID.Open;
      end
   else if FCountry = England then
      TfmCTSCattleOnHolding.Execute
   else
      //   21/03/12 [V5.0 R4.5] /MK Change - New Boolean Check For Reconcile By Cards Checked Here.
      //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
      uHerdRec.CreateAndShow(cbDefaultHerd.KeyValue, False, True);
end;

procedure TMenuForm.ShowOrderTags;
begin
   //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
   TfmTagReplacementForm.Execute(True);
end;

procedure TMenuForm.ShowRegisterRemarkEvent;
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      uGeneralRemark.ShowGeneralRemark;
end;

procedure TMenuForm.ShowCalfReg;
var
   AimAnimalRegistration : TAimAnimalRegistration;
begin
   CheckSelectedHerd;

   //   03/03/15 [V5.4 R2.8] /MK Additional Feature - Run fix for duplicate calvings.
   //   31/01/17 [V5.6 R4.2] /MK Additional Feature - Removed this fix to see if it stops the duplicate animal and calving records issues with calvings.
   {
   Screen.Cursor := crHourGlass;
   TCalvingsFix.RunCalvingsFix(WinData.KingData.Directory);
   Screen.Cursor := crDefault;
   }

   // 13/02/13 [V5.1 R4.1] /MK Additional Feature -
   // Check to make sure that calvings were created properly i.e no events are missing or
   // animals are missing from calvings entered in the last month.
   if ( WinData.MissingCalvingEventsFound ) or ( WinData.MissingCalvingAnimalsFound ) then
      begin
         MessageDlg('A discrepancy has been found in calving events entered in the last month.'+cCRLF+
                    'Please contact Kingswood Support - 00353-1-4599491.',mtError,[mbOK],0);
         Exit;
      end;

   if FCountry = NIreland then
      uAPHISRegistration.ShowForm(APHISBirths)
   else if FCountry = England then
      TfmCTSWSBirthReg.Execute
   else
      begin
         if not (AIMClient.ClientExists) then
            begin
               //   01/07/14 [V5.3 R3.0] /MK Change - Show DeptAdvert if AIM does not exist - GL Request.
               TfmDeptLinkAdvert.Show(True);
               //uCalfRegFlt.ShowForm
            end
         else if not(AIMClient.IsAnimalRegistrationCompatible) then
            begin
               MessageDlg('A new version of the Kingswood AIM Link is available to download.'+cCRLF+
                          'This new version allows you to register your calves with'+cCRLF+
                          'Animal Identification and Movement (AIM) in realtime.'+cCRLFx2+
                          'For more information please contact Kingswood on (01) 4599491 '+cCRLF+
                          'or alternatively email us on info@kingswood.ie.',mtInformation,[mbOK],0);
               uCalfRegFlt.ShowForm;
            end
         else
            begin
               AimAnimalRegistration := TAimAnimalRegistration.Create(Handle, WinData.UserDefaultHerdID);
               try
                  AimAnimalRegistration.GoToAimAnimalRegistration();
               finally
                  FreeAndNil(AimAnimalRegistration);
               end;
            end;
      end;

   if ( WinData.FCalfSiresUpdate ) then
      SetupQuery()
   else
      begin
         if not(ReloadSetupQuery) then
            ReloadSetupQuery := WinData.FRequiredCalvingFix;
         if ReloadSetupQuery then
            begin
               ReloadSetupQuery := False;
               WinData.FRequiredCalvingFix := ReloadSetupQuery;
               SetUpQuery();
            end;
      end;
end;

procedure TMenuForm.ShowICBFEventReg;
begin
   if FCountry = Ireland then
      uICBFEventExport.ShowTheForm
   else // for both NI and England
      begin
         cxAnimalGridView.DataController.BeginFullUpdate;
         try
            uHFSCalfReg.ShowForm;
         finally
            cxAnimalGridView.DataController.EndFullUpdate;
         end;
      end;
end;

procedure TMenuForm.actReconcileHerdExecute(Sender: TObject);
begin
   ShowReconcileHerd;
end;

procedure TMenuForm.actOrderTagsExecute(Sender: TObject);
var
   pt : TPoint;
begin
   CheckSelectedHerd;
   if ( FCountry = Ireland ) then
      ShowOrderTags
   else if ( FCountry = England ) then
      ShowOrderTags
   else if ( FCountry = NIreland ) then
      Retagging2.Click;
end;

procedure TMenuForm.actRegisterRemarksExecute(Sender: TObject);
begin
   ShowRegisterRemarkEvent;
end;

procedure TMenuForm.actCalfRegExecute(Sender: TObject);
begin
   //   02/04/15 [V5.4 R2.4] /MK Bug Fix - Only check for SireBreedDifferToCalfBreed for Irish herds as APHIS/CTS send calf breed.
   if ( FCountry = Ireland ) then
     begin
        if ( TfmCalvesNoSires.GetCalvesWithNoSires = 0 ) then
           if ( TfmSireBreedDifferToCalfBreed.GetCalves = 0 ) then
               ShowCalfReg;
     end
   else if ( FCountry <> Ireland ) then
      ShowCalfReg;
end;

procedure TMenuForm.actICBFEventRegExecute(Sender: TObject);
begin
   ShowICBFEventReg;
end;

procedure TMenuForm.actHUKIRegExecute(Sender: TObject);
begin
   cxAnimalGridView.DataController.BeginFullUpdate;
   try
      uHFSCalfReg.ShowForm;
   finally
      cxAnimalGridView.DataController.EndFullUpdate;
   end;
end;

procedure TMenuForm.ShowGroupSetup;
var
   i : Integer;
begin
   for i := 0 to cxAnimalGridView.ColumnCount-1 do
      begin
         if ( cxAnimalGridView.Columns[i].SortOrder <> soNone ) then
            begin
               if ( cxAnimalGridView.Columns[i].DataBinding.FieldName = 'SortAnimalNo' ) then
                  WinData.FMainGridSortBy := mgsbAnimalNo
               else if ( cxAnimalGridView.Columns[i].DataBinding.FieldName = 'SortNatID' ) then
                  WinData.FMainGridSortBy := mgsbNatIDNum
               else if ( cxAnimalGridView.Columns[i].DataBinding.FieldName = 'DateOfBirth' ) then
                  WinData.FMainGridSortBy := mgsbDateofBirth
               else if ( cxAnimalGridView.Columns[i].DataBinding.FieldName = 'Sex' ) then
                  WinData.FMainGridSortBy := mgsbSex
               else if ( cxAnimalGridView.Columns[i].DataBinding.FieldName = 'Name' ) then
                  WinData.FMainGridSortBy := mgsbName;
               FSortedColumn := cxAnimalGridView.Columns[i];
            end;
      end;

   uGroupSetUp.ShowTheForm(0);  //Ind = 0 shows standard form
   SetUpQuery;
end;

procedure TMenuForm.ShowGroupMovements;
begin
   Update;
   WinData.FeedEvents.DisableControls;
   WinData.FeedEvents.MasterFields := '';
   WinData.FeedEvents.MasterSource := nil;

   TfmGroupUpdate.ShowForm(WinData.AnimalFileByIDID.AsInteger);

   WinData.FeedEvents.MasterFields := 'ID';
   WinData.FeedEvents.MasterSource := Windata.AnimalSourceByID;
   WinData.FeedEvents.EnableControls;
end;

procedure TMenuForm.ShowPurchGroup;
begin
   uBBPPurchScr.CreateAndShow;
end;

procedure TMenuForm.ShowSalesGroup;
begin
   uGroupSetUp.ShowTheForm(0, True);
end;

procedure TMenuForm.actGroupSetupExecute(Sender: TObject);
begin
   ShowGroupSetup;
end;

procedure TMenuForm.actGroupMovementsExecute(Sender: TObject);
begin
   ShowGroupMovements;
end;

procedure TMenuForm.actPurchGroupExecute(Sender: TObject);
begin
   ShowPurchGroup;
end;

procedure TMenuForm.actSalesGroupExecute(Sender: TObject);
begin
   ShowSalesGroup;
end;

procedure TMenuForm.ShowWeighingEvent;
begin
   Weighing.ShowWeight(AddWeight);
end;

procedure TMenuForm.ShowMilkRecording;
var
   FileName : string;
   FileCount : Integer;
   FileSaved : Boolean;
begin
   FileSaved := False;

   CheckSelectedHerd;
   if ( (WinData.SystemRegisteredCountry =Ireland) AND (WinData.ICBFMMR) ) then
      begin
          if WinData.GlobalSettings.DownloadMailAttachments then
            begin
               FileCount := 0;
               if ( not(WinData.FAttachmentsDownloaded) ) then
                  CheckAttachments;

               FileName := TfmFileAttachmentImport.execute(itICBF, cbDefaultHerd.Text, FileCount);
               if (FileExists(FileName)) then
                  begin
                     TfMilkRec.ImportICBFFile(FileName,FileSaved);
                  end;
            end
         else
            begin
               uMilkRec.CreateAndShow(1,FileSaved);
            end;
      end
   else
      begin
         //   19/11/19 [V5.9 R1.3] /MK Change - If the Country is not Ireland then get user to specify milk recorder as all GB countries should be either NMR or CIS - GL request.
         if ( Length(WinData.OwnerFileUKMilkRecorder.AsString) = 0 ) then
            begin
               MessageDlg('Please select a Milk Recorder from the Herd Settings screen.',mtError,[mbOK],0);
               uHerdSetup.ShowTheForm(False, 'UKMilkRecorder');
               WinData.OwnerFile.Close;
               WinData.OwnerFile.Open;
            end;
         if ( Length(WinData.OwnerFileUKMilkRecorder.AsString) > 0 ) then
            uMilkRec.CreateAndShow(0,FileSaved);
      end;

   if ( FileSaved ) then
      begin
         WinData.AnimalFileByID.Close;
         WinData.AnimalFileByID.Open;
         RefreshAllExternalData();
      end;
end;

procedure TMenuForm.ShowParlourLinkScreen (const ADraftGroupName : String = '');
var
   sParlourDir,
   sParlourType : String;
   slWestfaliaFile : TStringList;
begin
   if ( not(Def.Definition.dUseParlour) ) then
      begin
         MessageDlg(cMissingModulePayMsg,mtInformation,[mbOK],0);
         Exit;
      end;

   sParlourType := UpperCase(FParlourInfo.ParlourType);
   if ADraftGroupName <> '' then
      WinData.CallProg.ParlourLink(Handle,ADraftGroupName)
   else
      begin
         //   07/05/19 [V5.8 R9.2] /MK Change - If MooMonitor then wait for ParlourLink to close and then call actImportParlourData.
         //   19/12/19 [V5.9 R1.5] /MK Change - Added Delpro to the automatic Import Data execute - Mark Young.
         if ( (sParlourType = 'DAIRYMASTER') and (FParlourInfo.MooMonitorLink) ) or ( (sParlourType =  'DELPRO') and (FParlourInfo.ImportFromParlour) ) then
            begin
               WinData.CallProg.ParlourLinkAndWait(Handle);
               actImportParlourData.Execute;
            end
         else
            WinData.CallProg.ParlourLink(Handle);

         //   07/05/19 [V5.8 R9.2] /MK Change - Set FParlourInfo after Parlour Link program is called - NOTE: Only MooMonitor link waits for ParlourLink to close.
         if ( FParlourInfo <> nil ) then
            FreeAndNil(FParlourInfo);
         FParlourInfo := TParlourDetails.Create;

         //   12/11/15 [V5.5 R0.5] /MK Change - If ParlourType is Westfalia then after ParLink closes and the WestfaliaExportFileName exists
         //                                     save the file as the usual ParlourFilePath file name.
         if ( sParlourType = 'WESTFALIA4.3') or ( sParlourType = 'WESTFALIA' ) then
            begin
               sParlourDir := FParlourInfo.ParlourDir;
               if ( DirectoryExists(sParlourDir) ) then
                  if ( FileExists(sParlourDir+'\'+WestfaliaExportFileName) ) then
                     begin
                        slWestfaliaFile := TStringList.Create();
                        slWestfaliaFile.LoadFromFile(sParlourDir+'\'+WestfaliaExportFileName);
                        slWestfaliaFile.SaveToFile(DefaultDirectory+'\'+ParlourFilePath);
                        FreeAndNil(slWestfaliafile);
                     end;
            end;
      end;
end;

procedure TMenuForm.ShowRationCalc;
begin
   if ( not(Def.Definition.dUseRationCalc) ) then
      begin
         MessageDlg(cMissingModulePayMsg,mtInformation,[mbOK],0);
         Exit;
      end;

   WinData.CallProg.RationCalc;
end;

procedure TMenuForm.ShowBulkTank;
begin
   WinData.CreateAndShowForm(TfmMilkTankRead);
end;

procedure TMenuForm.actWeighingExecute(Sender: TObject);
begin
   ShowWeighingEvent
end;

procedure TMenuForm.actMilkRecordingExecute(Sender: TObject);
begin
   ShowMilkRecording;
end;

procedure TMenuForm.actParlourLinkExecute(Sender: TObject);
begin
   if ShowParlourLink then
      ShowParlourLinkScreen()
   else
      MessageDlg(cMissingModulePayMsg,mtError,[mbOK],0);
end;

procedure TMenuForm.actRationCalcExecute(Sender: TObject);
begin
   if ShowRationCalcLink then
      ShowRationCalc()
   else
      MessageDlg(cMissingModulePayMsg,mtError,[mbOK],0);
end;

procedure TMenuForm.actBulkTankExecute(Sender: TObject);
begin
   ShowBulkTank;
end;

procedure TMenuForm.ShowOnFarmEvents;
begin
   if ( (WinData.MultiHerd) and (WinData.ShowAllAnimals) ) or
      ( not(WinData.MultiHerd) ) then
      CheckSelectedHerd; 
   uEventsByGroup.ShowTheForm(TNoEvent,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.ShowMovementsIn;
var
   DatabaseUpdated : Boolean;
begin
   uKImport.CreateShowForm(TPurchase, DatabaseUpdated, False);
   Application.ProcessMessages;

   if DatabaseUpdated then
      begin
         Menuform.Enabled := False; // prevent any clicking during database operations
         try
            WinData.KingData.CloseDataSets; // Close the Dataset
            WinData.OpenAndCheckTables;
            SetupQuery(True);
         finally
            Menuform.Enabled := True; // Release
         end;

      end;
end;

procedure TMenuForm.ShowMovementsOut;
var
   DatabaseUpdated : Boolean;
begin
   UKImport.CreateShowForm(TSaleDeath, DatabaseUpdated, False);
   Application.ProcessMessages;

   if DatabaseUpdated then
      begin

         Menuform.Enabled := False; // prevent any clicking during database operations
         try
            WinData.KingData.CloseDataSets; // Close the Dataset
            WinData.OpenAndCheckTables;
            SetupQuery(True);
         finally
            Menuform.Enabled := True; // Release
         end;

      end;
end;

procedure TMenuForm.ShowBlockAnimalWelfare;
begin
   TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TDisbudding);
   SetUpQuery;
end;

procedure TMenuForm.actMovementsInExecute(Sender: TObject);
begin
   ShowMovementsIn;
end;

procedure TMenuForm.actMovementsOutExecute(Sender: TObject);
begin
   ShowMovementsOut;
end;

procedure TMenuForm.ShowCTSMovements;
begin
   Update;
   TfmCTSWSMovementReg.Execute;
   Update;
end;

procedure TMenuForm.SetupMenuButtonContainer(AContainer : TPanel);
const
   cContainerCount = 8;
   cButtonPositions : array [0..4] of Integer = (10,108,206,304,402);
   cRightAlignedContainers : set of byte = [8];

   function IsContainerRightAligned : Boolean;
   var
      i : Integer;
   begin
      Result := False;
      for i := 1 to cContainerCount do
         begin
            if i in cRightAlignedContainers then
               begin
                  Result := True;
                  Break;
               end;
         end;
   end;

   procedure SetupButtons(APanel : TPanel);
   begin
      if (APanel.Tag = 1) then
         actDryOff.Visible := (FSelectedHerdType in [htDairy, htSuckler])
      else if (APanel.Tag = 3) or (APanel.Tag = 5) then
         begin
            actFeedAlloc.Visible := (FSelectedHerdType in [htDairy,htSuckler,htBeef]);
            if ( actFeedAlloc.Visible ) and ( Def.Definition.dUseDealer ) then
               actFeedAlloc.Visible := WinData.ShowDealerControls;
         end
      else if (APanel.Tag = 4) then
         begin
            actCalfReg.Visible := (FSelectedHerdType <> htBeef);
            btnAIMMovementEnq.Visible := True;
            //   12/08/13 [V5.1 R9.1] /MK Change - Changes to show ICBF button for Irish Beef Systems.
            //actICBFEventReg.Visible := (FSelectedHerdType <> htBeef);
            actICBFEventReg.Visible := ( FCountry = Ireland ) and ( (Def.Definition.dUseManCal) or (Def.Definition.dUseBeefMan) );

            if ( FCountry = Ireland ) then
               begin
                  if (AIMClient.ClientExists) then
                     begin
                        btnCalfRegistration.Kind := cxbkDropDownButton;
                        lAIMICBFMore.Visible := True;
                        btnAIMMovementEnq.Action := actAIMMovementMenu;
                        btnAIMMovementEnq.Caption := 'AIM'+cCRLF+'Movements';
                     end
                  else
                     begin
                        btnCalfRegistration.Kind := cxbkStandard;
                        lAIMICBFMore.Visible := False;
                        btnAIMMovementEnq.Action := actOrderTags;
                        btnAIMMovementEnq.Caption := 'Order Tags';
                     end;
               end
            else
               begin
                  if (FCountry = England) then
                     begin
                        btnAIMMovementEnq.Action := actMovementPermits;
                        btnAIMMovementEnq.Caption := 'CTS Move.';
                     end
                  else if (FCountry = NIreland) then
                     begin
                        btnAIMMovementEnq.Action := actOrderTags;
                        btnAIMMovementEnq.Caption := 'Retagging';
                     end;
                  lAIMICBFMore.Visible := False;
                  btnCalfRegistration.Kind := cxbkStandard;
               end;
         end
      else if (APanel.Tag = 5) then
         begin
            actPurchGroup.Visible := (FSelectedHerdType = htBeef);
            actSalesGroup.Visible := (FSelectedHerdType = htBeef);
         end
      else if (APanel.Tag = 6) then
         begin
            actBulkTank.Visible := (FSelectedHerdType in [htDairy,htSuckler,htBeef]);
            actMilkRecording.Visible := (FSelectedHerdType = htDairy);
            //actParlourLink.Visible := ShowParlourLink;
            //actRationCalc.Visible := ShowRationCalcLink;
         end;
      ContainerCheckDefFile;
   end;

var
   i : Integer;
   ButtonArray : array of TcxButton;
   VisibleButtonCount : Integer;
begin
   SetLength(ButtonArray,0);
   AContainer.Width := 10;
   VisibleButtonCount := 0;
   AContainer.Top := cContainerTop;
   if AContainer.Tag <> 8 then
      AContainer.Left := cContainerLeft;
   SetupButtons(AContainer);
   for i := 0 to AContainer.ControlCount-1 do
      begin
         if (AContainer.Controls[i] is TcxButton) then
            begin
               if (AContainer.Controls[i] as TcxButton).Visible then
                  begin
                     (AContainer.Controls[i] as TcxButton).Width := cDefaultMenuButtonWidth;
                     SetLength(ButtonArray, Length(ButtonArray)+1);
                     ButtonArray[Length(ButtonArray)-1] := (AContainer.Controls[i] as TcxButton);
                     AContainer.Width := AContainer.Width + cDefaultMenuButtonWidth + 6;
                     DrawRounded(AContainer);
                     Inc(VisibleButtonCount);
                  end;
            end;
      end;

   if Length(ButtonArray) > 0 then
      begin
         QuickSort(ButtonArray,Low(ButtonArray),High(ButtonArray));
         for i := Low(ButtonArray) to High(ButtonArray) do
            begin
               ButtonArray[i].Left := cButtonPositions[i];
               ButtonArray[i].Top := 32;
            end;
      end;

   if ( AContainer.Name = 'pGroupsContainter' ) then
      if ( VisibleButtonCount = 2 ) then
         AContainer.Width := 350;

   AContainer.Visible := True;

   SetupLinkButtons;
end;

procedure TMenuForm.QuickSort(var AButtonArray: array of TcxButton; ALo,
  AHi: Integer);
var
  Lo, Hi,  Pivot: Integer; Button: TcxButton;
begin
   Lo := ALo;
   Hi := AHi;
   Pivot := AButtonArray[(Lo + Hi) div 2].Tag;
  repeat
    while AButtonArray[Lo].Tag < Pivot do Inc(Lo) ;
    while AButtonArray[Hi].Tag > Pivot do Dec(Hi) ;
    if Lo <= Hi then
    begin
      Button := AButtonArray[Lo];
      AButtonArray[Lo] := AButtonArray[Hi];
      AButtonArray[Hi] := Button;
      Inc(Lo) ;
      Dec(Hi) ;
    end;
  until Lo > Hi;
  if Hi > ALo then QuickSort(AButtonArray, ALo, Hi) ;
  if Lo < AHi then QuickSort(AButtonArray, Lo, AHi) ;
end;

procedure TMenuForm.ContainerCheckDefFile;
begin
   actFeedPurch.Visible := Def.Definition.dUsePremiums;
   if ( actFeedPurch.Visible ) then
      actFeedPurch.Visible := ( not(WinData.ShowDealerControls) );
   btnFeedPurch.Visible := actFeedPurch.Visible;

   actFeedAlloc.Visible := ( Def.Definition.dUseMilkRec ) OR ( Def.Definition.dUseBeefMan );
   btnFeedAlloc.Visible := actFeedAlloc.Visible;

   lVeterinaryFeedsLink.Caption := 'Veterinary/Feeds';
   if ( not(actFeedPurch.Visible) ) and ( not(actFeedAlloc.Visible) ) then
      lVeterinaryFeedsLink.Caption := 'Veterinary';

   actVetPurch.Visible := Def.Definition.dUsePremiums;
   btnVetPurch.Visible := actVetPurch.Visible;
   actVetTreat.Visible := Def.Definition.dUsePremiums;
   btnVetTreats.Visible := actVetTreat.Visible;

   //   11/01/18 [V5.7 R6.5] /MK Change - Factory Sale should be visible in the North as Dunbia does it - Grace Dobson.
   actFactorySales.Visible := ( FCountry in [Ireland, NIreland] );
   btnFactorySales.Visible := actFactorySales.Visible;
   actMartFiles.Visible := ( FCountry in [Ireland, NIreland] );
   btnMartFiles.Visible := actMartFiles.Visible;

   btnFactorySales1.Visible := btnFactorySales.Visible;
   btnMartFiles1.Visible := btnMartFiles.Visible;
   btnVetLink.Visible := ( FCountry = Ireland );
   btnCows365.Visible := ( FCountry in [Ireland, NIreland] ) and ( FSelectedHerdType <> htBeef );
   btnICBFImport.Visible := ( FCountry = Ireland ) and ( FSelectedHerdType <> htBeef );

   actCalfReg.Visible := ( (Def.Definition.dUseManCal) and (FSelectedHerdType <> htBeef) );
   btnCalfRegistration.Visible := actCalfReg.Visible;

   actICBFEventReg.Visible := ( FCountry = Ireland ) and ( (Def.Definition.dUseManCal) or (Def.Definition.dUseBeefMan) );
   //  20/08/13 [V5.2 R0.0] /MK Bug Fix - Show actHukiReg if NIreland.
   actHUKIReg.Visible := ( FCountry = NIreland ) and ( Def.Definition.dUsePedigree );
   //  20/08/13 [V5.2 R0.0] /MK Bug Fix - Show ICBF/HUKI button if actICBFEventReg or actHUKIReg Visible.
   btnICBFEventReg.Visible := ( actICBFEventReg.Visible ) or ( actHUKIReg.Visible );

   actWeighing.Visible := ( Def.Definition.dUseManCal ) or ( Def.Definition.dUseBeefMan );
   btnWeighing.Visible := actWeighing.Visible;

   actBulkTank.Visible := ( Def.Definition.dUseQuotaMan ) and ( FSelectedHerdType = htDairy );
   btnBulkTank.Visible := actBulkTank.Visible;

   actMilkRecording.Visible := ( Def.Definition.dUseMilkRec ) and ( FSelectedHerdType = htDairy );
   btnMilkRec.Visible := actMilkRecording.Visible;

   //   25/05/12 [V5.0 R7.0] /MK Change - Only Show Group Purchase If Beef Management And Crush or Preference Enabled - GL Request.
   actPurchGroup.Visible := ( Preferences.ValueAsBoolean[cGSEnableBeefGroupPurchases] ) and
                            ( (Def.Definition.dUseBeefMan) and (Def.Definition.dUseCrush) );
   btnPurchaseGroup.Visible := actPurchGroup.Visible;

   actSalesGroup.Visible := Def.Definition.dUseBeefMan;
   btnSalesGroup.Visible := actSalesGroup.Visible;
   actGroupMovements.Visible := (Def.Definition.dUseManCal) or (Def.Definition.dUseBeefMan) or ( WinData.ShowDealerControls );
   btnGroupMovement.Visible := actGroupMovements.Visible;

   //actParlourLink.Visible := ShowParlourLink;
   //btnParlourLink.Visible := actParlourLink.Visible;
   //actRationCalc.Visible := ShowRationCalcLink;
   //btnRationCalc.Visible := actRationCalc.Visible;
end;

procedure TMenuForm.SetupLinkButtons;
begin
   if not(pBreedingLink.Visible) then
      begin
         pMovementsLink.Top := pBreedingLink.Top;
         pVeterinaryFeedsLink.Top := pMovementsLink.Top + pVeterinaryFeedsLink.Height + 9;
         pRegisterCalfRegLink.Top := pVeterinaryFeedsLink.Top + pRegisterCalfRegLink.Height + 9;
         pGroupsLink.Top := pRegisterCalfRegLink.Top + pGroupsLink.Height + 9;
         pManagementLink.Top := pGroupsLink.Top + pManagementLink.Height + 9;
         pKingswoodLink1.Top := pManagementLink.Top + pKingswoodLink1.Height + 9;
      end
   else
      begin
         pBreedingLink.Top := 3;
         pMovementsLink.Top := 33;
         pVeterinaryFeedsLink.Top := 63;
         pRegisterCalfRegLink.Top := 93;
         pGroupsLink.Top := 123;
         pManagementLink.Top := 153;
         pKingswoodLink1.Top := 183;
      end;
   if not(pManagementLink.Visible) then
      pKingswoodLink1.Top := pGroupsLink.Top + pKingswoodLink1.Height + 9;

end;

procedure TMenuForm.ShowSingleAnimalEventMenu(const AMenuType: TMenuType);
var
   Container : TPanel;
   LinkLabel : TcxLabel;
   i, VisibleButtonCount : Integer;
begin
   VisibleButtonCount := 0;
   HideAllNewEventPanelItems;

   lEventPanelDesc.Caption := '';

   case AMenuType of
      mtBreeding :
         begin
            Container := pBreedingContainter;
            LinkLabel := lBreedingLink;
            lEventPanelDesc.Caption := cBreedingContainerDescription;
         end;
      mtMovements :
         begin
            //   27/09/18 [V5.8 R3.0] /MK Change - Change around buttons in Movement Events Panel depending on Dealer user.
            btnMovementPermits.Glyph := nil;
            if WinData.ShowDealerControls then
               begin
                  btnMovementPermits.Action := actShowDeathEvent;
                  btnMovementPermits.Kind := cxbkStandard;
                  btnMovementPermits.Tag := 3;
                  btnMartFiles.Tag := 4;
                  btnFactorySales.Tag := 5;
               end
            else
               begin
                  btnMovementPermits.Action := actMovementPermits;
                  ShowAIMOrStandardIrishRecScr;
                  btnMartFiles.Tag := 3;
                  btnFactorySales.Tag := 4;
                  btnMovementPermits.Tag := 5;
               end;
            Container := pMovementsContainter;
            LinkLabel := lMovementsLink;
            //   23/04/12 [V5.0 R5.2] /MK Change - New Description For Single Movements.
            if FCountry = England then
               lEventPanelDesc.Caption := cMovementContainerDescriptionEng
            else
               lEventPanelDesc.Caption := cMovementContainerDescription;
         end;
      mtVeterinaryFeeds :
         begin
            Container := pVetFeedsContainter;
            LinkLabel := lVeterinaryFeedsLink;
            if ( actFeedPurch.Visible ) and ( actFeedAlloc.Visible ) then
               lEventPanelDesc.Caption := cVetFeedsContainerDescription
            else if ( actFeedPurch.Visible ) and ( not(actFeedAlloc.Visible) ) then
               lEventPanelDesc.Caption := cVetFeedsContainerNoAllocDescription
            else
               lEventPanelDesc.Caption := cVetContainerDescription;
         end;
      mtRegCalfReg :
         begin
            Container := pRegCalfRegContainter;
            LinkLabel := lRegisterCalfRegLink;
            //   12/08/13 [V5.1 R9.1] /MK Change - Change lEventPanelDesc to non AIM description.
            if ( FCountry = Ireland ) and ( AIMClient.ClientExists ) then
               begin
                  if ( actICBFEventReg.Visible ) then
                     lEventPanelDesc.Caption := cAIMLinkEvRegContainerDescription_IRL
                  else
                     lEventPanelDesc.Caption := cAIMLinkContainerDescription_IRL;
               end
            else
               begin
                  if ( actICBFEventReg.Visible ) then
                     lEventPanelDesc.Caption := cBovRegEvRegContainerDescription_Other
                  else
                     lEventPanelDesc.Caption := cBovRegContainerDescription_Other;
               end;
         end;
      mtAnimalGroups :
         begin
            Container := pGroupsContainter;
            LinkLabel := lGroupsLink;
            if ( (Def.Definition.dUsePremiums) and (not(Def.Definition.dUseManCal)) and
                 (not(Def.Definition.dUseBeefMan)) and (FSelectedHerdType = htBeef) ) then
               lEventPanelDesc.Caption := '  Groups'
            else if ( (Def.Definition.dUseBeefMan) and (FSelectedHerdType = htBeef) ) then
               begin
                  if ( Preferences.ValueAsBoolean[cGSEnableBeefGroupPurchases] ) then
                     lEventPanelDesc.Caption := cGroupsContainerDescriptionAdv
                  else
                     lEventPanelDesc.Caption := cGroupsContainerDescriptionAdvNoPurch;
               end
            else
               lEventPanelDesc.Caption := cGroupsContainerDescriptionStd;
         end;
      mtManagement :
         begin
            Container := pManagementContainter;
            LinkLabel := lManagementLink;
            lEventPanelDesc.Caption := cManagementContainerDescription
         end;
      mtKingswoodLinks :
         begin
            Container := pKingswoodLinksContainer;
            LinkLabel := lKingswoodLinks;
            btnICBFImport.Visible := ( Def.Definition.dUseManCal ) or ( Def.Definition.dUseBeefMan );
            lEventPanelDesc.Caption := cKingswoodLinksContainerDescription;
         end;
      mtBlockMovements :
         begin
            Container := pBlockMovementsContainer;
            LinkLabel := lMovementsInOutLink;
            lEventPanelDesc.Caption := cBlockMovementsContainerDescription;
         end;
      mtCrush :
         begin
            Container := pCrushContainer;
            LinkLabel := lBreedingLink;
            LinkLabel.Caption := 'Crush';
            lEventPanelDesc.Caption := cCrushContainerDescription;
         end;
   end;

   Container.Visible := True;
   Container.Height := 122;
   if ( Container = pBlockMovementsContainer ) then
      begin
         if ( WinData.GlobalSettings.ShowBlockTempMovements ) then
            Container.Left := 260
         else
            Container.Left := 460;
      end
   else
      Container.Left := 166;

   lEventPanelDesc.Parent := Container;
   lEventPanelDesc.Left := 0;
   SetupMenuButtonContainer(Container);

   if ( Container = pManagementContainter ) then
      begin
         for i := 0 to Container.ControlCount-1 do
            begin
               if (Container.Controls[i] is TcxButton) then
                  begin
                     if ( (Container.Controls[i] as TcxButton).Visible ) then
                        Inc(VisibleButtonCount);
                  end;
            end;
         if ( VisibleButtonCount = 1 ) then
            lEventPanelDesc.Caption := cManagementContainerWeighingOnlyDescription; 
      end;

   LinkLabel.Style.Font.Color := clInfoText;
   LinkLabel.Style.Font.Size := 9;
   if LinkLabel.Parent is TPanel then
      (LinkLabel.Parent as TPanel).BevelOuter := bvNone;
end;

procedure DrawRounded(Control: TWinControl) ;
var
   R: TRect;
   Rgn: HRGN;
begin
   with Control do
      begin
         R := ClientRect;
         rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 20, 20) ;
         Perform(EM_GETRECT, 0, lParam(@r)) ;
         InflateRect(r, - 3, - 3) ;
         Perform(EM_SETRECTNP, 0, lParam(@r)) ;
         SetWindowRgn(Handle, rgn, True) ;
         Invalidate;
      end;
end;

procedure TMenuForm.pbCrushContainerPaint(Sender: TObject);
begin
   GradVertical(pbCrushContainer.Canvas, pbCrushContainer.ClientRect, $007BF4A4, $000B862C);
end;

procedure TMenuForm.actCrushAddAnimalExecute(Sender: TObject);
begin
   TfmCrushBarCode.Show(True);
   SetUpQuery;
end;

procedure TMenuForm.actCrushUpdateAnimalExecute(Sender: TObject);
begin
   TfmCrushBarCode.Show(False);
   SetUpQuery;
end;

procedure TMenuForm.actCrushSalesExecute(Sender: TObject);
begin
   TfmCrushSalesGroup.Show;
end;

procedure TMenuForm.btnClearSelectClick(Sender: TObject);
begin
   ClearAnimalSelection();
end;

procedure TMenuForm.btnTopCartKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   RecordIndex : Integer;
begin
   if Key = VK_DOWN then
      begin
         RecordIndex := cxAnimalGridView.DataController.GetFocusedRecordIndex;
         cxAnimalGridView.DataController.Controller.FocusNextRecord(RecordIndex,True,False,False,False);
      end;
end;

procedure TMenuForm.cxAnimalGridViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if EnableCartSpaceBar then
      if Key = VK_SPACE then
         begin
            FAddToCartType := actAfterSpaceBar;
            sbAddAnimalToCartClick(Sender);
         end;
end;

procedure TMenuForm.EnableSpaceBar1Click(Sender: TObject);
begin
   if not(EnableCartSpaceBar) then
      begin
         EnableCartSpaceBar := True;
         EnableSpaceBar1.Caption := 'Disable SpaceBar';
         cxAnimalGrid.SetFocus;
      end
   else
      begin
         EnableCartSpaceBar := False;
         EnableSpaceBar1.Caption := 'Enable SpaceBar';
         cxAnimalGrid.SetFocus;
      end;
end;

procedure TMenuForm.btnTopCartDropDownMenuPopup(Sender: TObject;
   var APopupMenu: TPopupMenu; var AHandled: Boolean);
begin
   cxAnimalGrid.SetFocus;
end;

procedure TMenuForm.Tipoftheday1Click(Sender: TObject);
begin
   try
      Reg.RootKey := HKEY_CURRENT_USER;
      if (Reg.OpenKey('Software\Kingswood\KHMTips',False)) then
         AMTip.LoadFromRegistry('Software\Kingswood\KHMTips',True)
      else
         try
            AMTip.TipsToShow.LoadFromFile(ApplicationPath + 'KHMTips.txt');
         except
            messagedlg('Tips are unavailable - Please contact Kingswood',mtInformation,[mbOK],0);
         end;
      AMTip.Execute;
   finally

   end;
end;

procedure TMenuForm.miCC31ARequest2Click(Sender: TObject);
begin
   WinData.GoToAimComplianceCert(WinData.UserDefaultHerdID,afCustom, CC31A);
end;

procedure TMenuForm.miCC31BRequest2Click(Sender: TObject);
begin
   WinData.GoToAimComplianceCert(WinData.UserDefaultHerdID,afCustom, CC31B);
end;

procedure TMenuForm.miAIMMovementNotification2Click(Sender: TObject);
begin
   if ( AIMClient.GetVersionNumber >= 1029 ) then // This version has support for viewing purchases directly from herd
      WinData.GoToAimMovementNotification(WinData.UserDefaultHerdID)
   else
      MessageDlg('Please contact Kingswood at 01-4599491 about this facility.',mtInformation,[mbOK],0);
end;

procedure TMenuForm.BringAIMClientToFront;
var
   wHandle : Hwnd;
begin
end;

procedure TMenuForm.actAIM31ARequestExecute(Sender: TObject);
begin
   if ( not(AnimalCart.IsEmpty) ) then
      WinData.GoToAimComplianceCert(WinData.UserDefaultHerdID,afCart, CC31A)
   else
      WinData.GoToAimComplianceCert(WinData.UserDefaultHerdID,afCustom, CC31A)
end;

procedure TMenuForm.actAIM31bRequestExecute(Sender: TObject);
begin
   if not AnimalCart.IsEmpty then
      WinData.GoToAimComplianceCert(WinData.UserDefaultHerdID,afCart, CC31B)
   else
      WinData.GoToAimComplianceCert(WinData.UserDefaultHerdID,afCustom, CC31B)
end;

procedure TMenuForm.actAIMMovementNotificationExecute(Sender: TObject);
begin
//   if not AnimalCart.IsEmpty then
//      WinData.GoToAimMovementNotification(WinData.UserDefaultHerdID,afCart)
//   else
//      WinData.GoToAimMovementNotification(WinData.UserDefaultHerdID,afCustom);

   if ( AIMClient.GetVersionNumber >= 1029 ) then
      WinData.GoToAimMovementNotification(WinData.UserDefaultHerdID)
   else
      MessageDlg('Please contact Kingswood at 01-4599491 about this facility.',mtInformation,[mbOK],0);
end;

procedure TMenuForm.actAIMMovementEnquiryExecute(Sender: TObject);
begin
   if ( FSelectedHerdType = htDairy ) then
      WinData.GoToMovementEnquiry(WinData.UserDefaultHerdID, True)
   else
      WinData.GoToMovementEnquiry(WinData.UserDefaultHerdID)
end;

procedure TMenuForm.cxButton5Click(Sender: TObject);
begin
   WinData.GoToMovementEnquiry(WinData.UserDefaultHerdID);
end;

procedure TMenuForm.pmiExportTescoHerdScoringEventsClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfmTescoExport, fmTescoExport);
      fmTescoExport.ShowModal;
   except
      ShowMessage('Cannot show this Form - close program and re-boot');
   end;
end;

procedure TMenuForm.DownloadNETFramework1Click(Sender: TObject);
begin
   kRoutines.OpenUrl('http://www.microsoft.com/download/en/details.aspx?id=24872');
end;

procedure TMenuForm.actHerdStatsExecute(Sender: TObject);
begin
   if ( FSelectedHerdType <> htDairy ) then
      TfmHerdStatistics.ShowForm(dvBeefHerdStats)
   else
      TfmHerdStatistics.ShowForm(dvDairyHerdStats);
end;

//   22/02/12 [V5.0 R4.0] /MK Change - New Drop-Down-Item For DairyCo Sire List - Show If Country <> Ireland.
procedure TMenuForm.AISireDairyCoClick(Sender: TObject);
var
   id : Integer;
   CallSetupQuery : Boolean;
begin
   CallSetupQuery := False;
   EnableBtn(Sender);
   try
      id := WinData.AnimalFileByIDID.AsInteger;
      try
         cxAnimalGridView.DataController.BeginFullUpdate;
         cxAnimalGridView.DataController.LockDataChangedNotify;
         try
            TfmUKSireRegister.execute(TfmUKSireRegister,CallSetupQuery);

            Screen.Cursor := crHourGlass;
            try
               if CallSetupQuery then
                  begin
                     WinData.AnimalFileByID.Close;
                     WinData.AnimalFileByID.Open;
                  end;
               cxAnimalGridView.Datacontroller.BeginLocate;
               try
                  WinData.AnimalFileByID.Locate('ID', id, []);
                  Update;
               finally
                  cxAnimalGridView.Datacontroller.EndLocate;
               end;
            finally
               Screen.Cursor := crDefault;
            end;
         except
         end;
      finally
         cxAnimalGridView.DataController.UnLockDataChangedNotify;
         cxAnimalGridView.DataController.EndFullUpdate;
      end;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.actCrushAnimalFilterExecute(Sender: TObject);
begin
   TfmCrushAnimalFilter.Show;
end;

procedure TMenuForm.cxAnimalGridViewBVDTestDateHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewBVDTestDate.Index );
end;

procedure TMenuForm.act31GPermitApplicationExecute(Sender: TObject);
begin
   ShowMovementPermits;
end;

procedure TMenuForm.miReconcileHerdClick(Sender: TObject);
begin
   //   21/03/12 [V5.0 R4.5] /MK Change - New Boolean Check For Reconcile By Cards Checked Here.
   //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
   uHerdRec.CreateAndShow(cbDefaultHerd.KeyValue, True, True);
end;

procedure TMenuForm.actSyncSettingsExecute(Sender: TObject);
begin
   CheckSelectedHerd;
   if ( WinData.SyncServiceIsAvailable ) then
      begin
         //   05/12/17 [V5.7 R5.9] /MK Additional Feature - Added check for Irish tags with no country code,
         //                                                 multiple herds in a single database and null breeds
         //                                                 if the sync is not configured.
         if ( not(TfmFarmSyncSettings.SyncConfigured(DataDir, WinData.GetSyncingHerd(), stHerd)) ) then
            begin
               if ( not(WinData.AppSyncTagCountryChecked) ) then
                  begin
                     if ( IrishHerdHasTagsWithoutCountryCode ) then
                        begin
                           MessageDlg(cIrishHerdHasTagsWithoutCountryCodeMsg,mtError,[mbOK],0);
                           Exit;
                        end
                     else
                        WinData.AppSyncTagCountryChecked := True;
                  end
               //   22/11/18 [V5.8 R4.7] /MK Change - Check new HerdLookup.MultiHerdHasSameHerdNo function.
               else if ( WinData.MultiHerd ) and ( not(HerdLookup.MultiHerdHasSameHerdNo) ) then
                  begin
                     MessageDlg(cHerdSyncHasMultiHerd,mtError,[mbOK],0);
                     Exit;
                  end
               else if ( CurrentHerdHasNullBreeds ) then
                  begin
                     MessageDlg(cHerdSyncHerdHasNullBreeds,mtError,[mbOK],0);
                     Exit;
                  end;
            end;
         WinData.CallProg.FarmSync(handle, '-e -h "'+ DataDir +'"');
      end;
end;

procedure TMenuForm.RefreshAllExternalData;
begin
   cxAnimalGridView.DataController.BeginFullUpdate;
   try
     cxAnimalGridView.DataController.RefreshExternalData;
   finally
     cxAnimalGridView.DataController.EndFullUpdate;
   end;
   EventGridAnimalEventsView.DataController.BeginFullUpdate;
   try
     EventGridAnimalEventsView.DataController.RefreshExternalData;
   finally
     EventGridAnimalEventsView.DataController.EndFullUpdate;
   end;
end;

procedure TMenuForm.actSyncDataExecute(Sender: TObject);
begin
   SyncData();
end;

procedure TMenuForm.actSyncOptionsExecute(Sender: TObject);
begin
   CheckSelectedHerd;
   if (WinData.SyncServiceIsAvailable) then
      begin
         WinData.CallProg.FarmSync(handle, '-o -h "'+ DataDir +'"');
         btnSyncSettings.Enabled := GetSyncButtonVisibility();
      end;
end;

function TMenuForm.GetSyncButtonVisibility: Boolean;
begin
   Result := ( (WinData.SyncServiceIsAvailable) and
                not(TfmFarmSyncSettings.SyncOnProgramStartup(DataDir, stHerd, WinData.UserDefaultHerdId)) );
end;

procedure TMenuForm.cxAnimalGridExit(Sender: TObject);
begin
   FAddToCartType := atcAfterGridClick;
end;

function TMenuForm.GetAnimalIdsBySqlFilter(AWhatSQL: Integer;
   ABaseFilter : TIntegerArray): TIntegerArray;
var
   MySQLFilter : TSQLFilter;
begin
   SetLength(Result, 0);
   MySQLFilter := TSQLFilter.Create;
   with MySQLFilter do
      try
         AnimalBase := ABaseFilter;

         if ( AWhatSQL = cBullsInUse ) then
            SQLOP := sqlAllBulls
         //   12/11/12 [V5.1 R0.9] /MK Bug Fix - If AWhatSQL in cAllHeifersThisYear,cAllHeifersLastYear then don't do BreedingStockSQL.
         else if ( AWhatSQL in [cAllHeifersThisYear,cAllHeifersLastYear] ) then
            begin
               SQLOp := sqlAllStock;
               HerdID := WinData.UserDefaultHerdID;
            end
         else if ( AWhatSQL = cServedCount ) then
            begin
              FEventDateFrom := fFilters.FilterTable.FieldByName('EventDateFrom').AsDateTime;
              FEventDateTo := fFilters.FilterTable.FieldByName('EventDateTo').AsDateTime;
              FServedCount := fFilters.FilterTable.FieldByName('ServedCount').AsInteger;
              HerdID := WinData.UserDefaultHerdID;
              SQLOp := sqlBreedingStock;
            end
         else
            begin
               FServedCount := fFilters.FilterTable.FieldByName('ServedCount').AsInteger;
               SQLOp := sqlBreedingStock;
               HerdID := WinData.UserDefaultHerdID;
            end;

         try
            Result := MySQLFilter.GetAnimalIds(AWhatSQL);
         except
         end;
      finally
         SafeFreeAndNil(MySQLFilter);
      end;
end;

function TMenuForm.GetAFiltersAsIntArray: TIntegerArray;
var
   Index : Integer;
begin
   Index := 0;
   SetLength(Result, 0);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT AID FROM '+WinData.FilteredAnimals.TableName+' ');
         Open;
         try
            SetLength(Result, RecordCount);
            First;
            while not Eof do
               try
                  Result[Index] := Fields[0].AsInteger;
                  Inc(Index);
                  Next;
               except;

               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TMenuForm.pmiCurrentHerdClick(Sender: TObject);
begin
   FQuickFilter := qfNone;
   actClearFilter.Execute;
end;

procedure TMenuForm.pmCalfRegOptionsPopup(Sender: TObject);
begin
   actAIMCalfRegistrationEnquiry.Visible := AIMClient.ClientExists;
end;

procedure TMenuForm.actAIMCalfRegistrationEnquiryExecute(Sender: TObject);
var
   AimAnimalRegistration : TAimAnimalRegistration;
begin
   AimAnimalRegistration := TAimAnimalRegistration.Create(Handle, WinData.UserDefaultHerdID);;
   try
      AimAnimalRegistration.GoToAimAnimalRegistrationEnquiry;
   finally
      FreeAndNil(AimAnimalRegistration);
   end;
end;

procedure TMenuForm.ShowLinkToWeighingScale(Sender: TObject);
var
   bReportCartApplied : Boolean;
begin
   bReportCartApplied := False;
   uElecWeigh.ShowTheForm(bReportCartApplied);
   //   26/09/16 [V5.5 R9.6] /MK Additional Feature - Filter animals that were weighed and added to the cart - Eddie (UCD Lyons).
   if ( bReportCartApplied ) then
      begin
         btnTopCart.Font.Size := 8;
         btnTopCart.Font.Style := [fsBold,fsItalic];
         btnTopCart.Font.Color := clBlue;
         actFilterCart.Execute;
      end;
   //   20/02/13 [V5.1 R4.5] /MK Change - Refresh Grids after import of weighing events.
   RefreshAllExternalData;
end;

procedure TMenuForm.CaflRegistrationByEmail1Click(Sender: TObject);
begin
   if WinData.MissingCalvingEventsFound or WinData.MissingCalvingAnimalsFound then
      begin
         MessageDlg('A discrepancy has been foud in calving events entered in the last month.'+cCRLF+
                    'Please contact Kingswood Support - 00353-1-4599491.',mtError,[mbOK],0);
         Exit;
      end;
   uCalfRegFlt.ShowForm;
   if not(ReloadSetupQuery) then
      ReloadSetupQuery := WinData.FRequiredCalvingFix;
   if ReloadSetupQuery then
      begin
         ReloadSetupQuery := False;
         WinData.FRequiredCalvingFix := ReloadSetupQuery;
         SetUpQuery();
      end;
end;

function TMenuForm.IsFilterFormActive : Boolean;
begin
   Result := ( FFilters.InnerJoinSQLEvents <> '' ) or ( FFilters.EventDateRangeSQL <> '' ) or ( FFilters.LactSQL <> '' ) or
             ( FFilters.DOBSQL <> '' ) or ( FFilters.SexSQL <> '' ) or ( FFilters.RetagSQL <> '' ) or ( FFilters.AIBullSQL <> '' ) or
             ( FFilters.AncestorsSQL <> '' ) or ( FFilters.BreedingSQL <> '' ) or ( FFilters.NonBreedingSQL <> '' ) or
             ( FFilters.DairySQL <> '' ) or ( FFilters.BeefSQL <> '' ) or ( FFilters.LeftHerdSQL <> '' ) or
             ( FFilters.NoneHerdSQL <> '' ) or ( FSQLFilter.SQLOp <> sqlNone ) or ( FFilters.DaysOnFarmSQL <> '' ) or
             ( FFilters.A1A2ResultSQL <> '' );
end;

procedure TMenuForm.actImportICBFDataExecute(Sender: TObject);
var
  iNewAnimalsAdded : Integer;
begin
   CheckSelectedHerd;
   iNewAnimalsAdded := 0;
   //   29/01/16 [V5.5 R3.4] /MK Change - Added variable to TfmICBFPCDownloadImporter to indicate new animals added.
   if TfmICBFPCDownloadImporter.Execute(WinData.UserDefaultHerdID,True,iNewAnimalsAdded) then
      begin
         WinData.qObservedBy.Close;
         WinData.qObservedBy.Open;
         WinData.AnimalFileByID.Close;
         WinData.AnimalFileByID.Open;
         RefreshAllExternalData();
         //   29/01/16 [V5.5 R3.4] /MK Change - If new animals added then relink calves to dams for new calves added so that the cow
         //                                     of the calf added has the right calving date and then run SetupQuery to load new animals.
         if ( iNewAnimalsAdded > 0 ) then
            SetupQuery;
      end;
end;

procedure TMenuForm.actImportDanRyanDataExecute(Sender: TObject);
var
   NoOfAttachments : Integer;
   FileName : String;
   FileCount : Integer;
begin
   if ( Def.Definition.dUseDanRyanImport ) then
      begin
         if ( WinData.GlobalSettings.DownloadMailAttachments ) then
            begin
               FileCount := 0;
               if ( not(WinData.FAttachmentsDownloaded) ) then
                  CheckAttachments;

               FileName := TfmFileAttachmentImport.execute(itCows365, cbDefaultHerd.Text, FileCount);
               if (FileExists(FileName)) then
                  TfmDanRyanImport.ShowForm(FileName);
            end
         else
            TfmDanRyanImport.ShowForm;

         RefreshAllExternalData();
      end
   else
      MessageDlg(cMissingModulePayMsg,mtError,[mbOK],0);
end;

procedure TMenuForm.actFilterCartExecute(Sender: TObject);
begin
   LastHerdID := WinData.UserDefaultHerdID;

   FilterCart1.Default := not FilterCart1.Default;
   if FilterCart1.Default then
      begin
         FilterCart1.Caption := 'Clear Filter';
         SetUpCartQuery();
         btnClearSelect.Visible := True;
      end
   else
      begin
         FilterCart1.Caption := 'Filter Cart';
         actClearFilter.Execute;
         btnClearSelect.Visible := False;
      end;
   cbAllAnimals.Enabled := not (FilterCart1.Default);
   cbDefaultHerd.Enabled := not (FilterCart1.Default);
   sbEventGrid.Enabled := not (FilterCart1.Default);
   //btnEventDiary.Enabled := not (FilterCart1.Default);
   btnTopFilter.Enabled := not (FilterCart1.Default);
end;

procedure TMenuForm.ShowTempMovementsIn;
begin
   TfmTempMovementsIn.ShowForm;
end;

procedure TMenuForm.ShowTempMovementsOut;
begin
   uEventsByGroup.ShowTheForm(TMovement,False,True);
end;

procedure TMenuForm.actTempMovesInExecute(Sender: TObject);
begin
   ShowTempMovementsIn;
end;

procedure TMenuForm.actTempMovesOutExecute(Sender: TObject);
begin
   ShowTempMovementsOut;
end;

procedure TMenuForm.StartDownload;
begin
   Download;
end;

procedure TMenuForm.miCrushXMLImportClick(Sender: TObject);
begin
   if ( Def.Definition.dUseCrush ) then
      begin
         Screen.Cursor := crHourGlass;
         //   25/05/18 [V5.8 R0.2] /MK Change - Moved the creation of the TCrushXMLImport here as its the standard approach.
         with TCrushXMLImport.Create do
            try
               ProcessXMLFiles;
            finally
               Free;
            end;
         SetUpQuery;
         Screen.Cursor := crDefault;
      end;
end;

procedure TMenuForm.miMilkRecordingClick(Sender: TObject);
var
   FileSaved : Boolean;
begin
   uMilkRec.CreateAndShow(1,FileSaved)
end;

function TMenuForm.ShowDraftGroupsMenu : Boolean;
begin
   //   01/02/19 [V5.8 R6.5] /MK Change - Allow the Drafting menu to appear if the parlour type is Nedap.
   Result := ( Def.Definition.dUseParlour ) and
             ( (UpperCase(WinData.FParlourType) = 'DAIRYMASTER') and (FileExists('C:\Program Files\Dairymaster\Dmmwin\Manager.exe')) ) or
             ( UpperCase(WinData.FParlourType) = 'NEDAP' );
end;

procedure TMenuForm.CreateDraftGroupsMenu;
var
   i : Integer;
   miDraftGroup,
   miClearDraftGroup,
   miClearAddDraftGroup,
   miAddToDraftGroup : TMenuItem;
   miDraftThisGroup : TMenuItem;
   DraftGroupQuery : TQuery;

   procedure CreateMenuItem;
   begin
      miDraftGroup := TMenuItem.Create(pmiDrafting);
      miDraftGroup.Caption := DraftGroupQuery.Fields[1].AsString;
      pmiDrafting.Add(miDraftGroup);

      miAddToDraftGroup := TMenuItem.Create(miDraftGroup);
      miAddToDraftGroup.Caption := 'Add Animals to Group';
      miAddToDraftGroup.Tag := DraftGroupQuery.Fields[0].AsInteger;
      miAddToDraftGroup.OnClick := AddToExistingDraftGroup;
      miDraftGroup.Add(miAddToDraftGroup);

      if ( WinData.GroupManager.GetNumberOfAnimalsInGroup(DraftGroupQuery.Fields[0].AsInteger) > 0 ) then
         begin
            miClearDraftGroup := TMenuItem.Create(miDraftGroup);
            miClearDraftGroup.Caption := 'Clear Animals';
            miClearDraftGroup.Tag := DraftGroupQuery.Fields[0].AsInteger;
            miClearDraftGroup.OnClick := ClearDraftGroupOnClick;
            miDraftGroup.Add(miClearDraftGroup);

            miClearAddDraftGroup := TMenuItem.Create(miDraftGroup);
            miClearAddDraftGroup.Caption := 'Clear/Add Animals';
            miClearAddDraftGroup.Tag := DraftGroupQuery.Fields[0].AsInteger;
            miClearAddDraftGroup.OnClick := ClearAndAddToDraftGroup;
            miDraftGroup.Add(miClearAddDraftGroup);

            miDraftThisGroup := TMenuItem.Create(miDraftGroup);
            miDraftThisGroup.Caption := 'Draft Group';
            miDraftThisGroup.Tag := DraftGroupQuery.Fields[0].AsInteger;
            miDraftThisGroup.OnClick := DraftThisGroup;
            miDraftThisGroup.Hint := miDraftGroup.Caption;
            miDraftGroup.Add(miDraftThisGroup);
         end;
   end;

   procedure CreateBlankDraftGroups;
   begin
      with WinData.Groups do
         begin
            Append;
            FieldByName('GroupType').AsString := 'Drafting';
            FieldByName('Code').AsString := 'LDG';
            FieldByName('Description').AsString := 'Left Draft Group';
            FieldByName('Selected').AsBoolean := False;
            Post;

            Append;
            FieldByName('GroupType').AsString := 'Drafting';
            FieldByName('Code').AsString := 'RDG';
            FieldByName('Description').AsString := 'Right Draft Group';
            FieldByName('Selected').AsBoolean := False;
            Post;
         end;
   end;

begin
   pmiDrafting.Clear;
   DraftGroupQuery := TQuery.Create(nil);
   with DraftGroupQuery do
      begin
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, Description');
         SQL.Add('FROM Grps');
         SQL.Add('WHERE GroupType = "Drafting"');
         Open;

         if RecordCount > 0 then
            begin
               First;
               while not(Eof) do
                  begin
                     CreateMenuItem;
                     Next;
                  end;
            end
         else
            begin
               CreateBlankDraftGroups;
               Close;
               Open;
               First;
               while ( not(Eof) ) do
                  begin
                     CreateMenuItem;
                     Next;
                  end;

            end;
      end;
end;

procedure TMenuForm.ClearDraftGroupOnClick (Sender : TObject);
var
   DraftGroupID : Integer;
begin
   if ( Sender is TMenuItem ) then
      begin
         DraftGroupID := (Sender as TMenuItem).Tag;
         if ( DraftGroupID > 0 ) then
            ClearDraftGroup(DraftGroupID);
      end;
end;

procedure TMenuForm.ClearAndAddToDraftGroup (Sender : TObject);
var
   DraftGroupID : Integer;
begin
   if ( Sender is TMenuItem ) then
      begin
         DraftGroupID := (Sender as TMenuItem).Tag;
         if ( DraftGroupID > 0 ) then
            begin
               ClearDraftGroup(DraftGroupID);
               AddToDraftGroup(DraftGroupID);
            end;
      end;
end;

procedure TMenuForm.AddToExistingDraftGroup (Sender : TObject);
var
   DraftGroupID : Integer;
begin
   if ( Sender is TMenuItem ) then
      begin
         DraftGroupID := (Sender as TMenuItem).Tag;
         if ( DraftGroupID > 0 ) then
            AddToDraftGroup(DraftGroupID);
      end;
end;

procedure TMenuForm.DraftThisGroup ( Sender : TObject );
begin
   if ( Sender is TMenuItem ) then
      if ( (Sender as TMenuItem).Hint <> '' ) then
         ShowParlourLinkScreen('-g "'+(Sender as TMenuItem).Hint+'"')
      else
         ShowParlourLinkScreen('');
end;

procedure TMenuForm.ClearDraftGroup ( ADraftGroupID : Integer );
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('DELETE FROM GrpLinks');
         SQL.Add('WHERE GroupID = '+IntToStr(ADraftGroupID)+'');
         try
            ExecSQL;
         finally
            Close;
         end;
      finally
         Free;
      end;

   CreateDraftGroupsMenu;
end;

procedure TMenuForm.AddToDraftGroup ( ADraftGroupID : Integer );
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, TransponderNo');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID IN '+AnimalCart.AnimalCartDataAsWideString+'');
         Open;
         try
            First;
            while ( not(Eof) ) do
               begin
                  if ( Fields[1].AsString <> '' ) then
                     WinData.GroupManager.AddToGroup(Fields[0].AsInteger,ADraftGroupID,True,Date);
                  Next;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;

   CreateDraftGroupsMenu;
end;

procedure TMenuForm.smiUnitsClick(Sender: TObject);
begin
   uUnitsSetUp.ShowTheForm(TRUE);
end;

procedure TMenuForm.smiAdminByClick(Sender: TObject);
begin
   uMediAdminSetUp.ShowTheForm(False,adAdministrator);
end;

procedure TMenuForm.smiPrescribedByClick(Sender: TObject);
begin
   uMediAdminSetUp.ShowTheForm(False,adPrescribingVet);
end;

procedure TMenuForm.smiFeedTypesClick(Sender: TObject);
begin
   uFeedTypes.ShowTheForm(0,TRUE);
end;

procedure TMenuForm.smiManufacturersClick(Sender: TObject);
begin
   uManufacturers.ShowTheForm(TRUE);
end;

procedure TMenuForm.cxAnimalGridViewCustomization(Sender: TObject);
begin
   if not cxAnimalGridView.Controller.Customization then
      begin
         //
      end;
end;

procedure TMenuForm.ResetSyncData1Click(Sender: TObject);
begin
   uHerdSync.ResetSyncFlagsOnAllData(True);
   if (MessageDlg('Your herd data has changed.' + cCRLFx2 +
               'Do you want to sync your herd data now?',
               mtConfirmation,[mbYes,mbNo],0) = idYes) then
   begin
      actSyncData.Execute;
   end;
end;

procedure TMenuForm.ResetActiveBullListClick(Sender: TObject);
begin
   //Utility to remove all bulls in use.
   if ( WinData.ActiveFilter ) then
      btnClearSelectClick(Sender);
   HerdPassword.CreateAndShow(paResetBullsInUse);
end;

procedure TMenuForm.actImportVetDrugRegisterExecute(Sender: TObject);
var
   NoOfAttachments : Integer;
   FileName : String;
   FileCount : Integer;
begin
   if WinData.GlobalSettings.DownloadMailAttachments then
      begin
         FileCount := 0;
         if ( not(WinData.FAttachmentsDownloaded) ) then
            CheckAttachments;

         FileName := TfmFileAttachmentImport.execute(itVetLink, cbDefaultHerd.Text, FileCount);
         if (FileExists(FileName)) then
            begin
               TfmDrugsRegisterImport.ShowForm(FileName);
               SetUpQuery;
            end;
      end
   else
      begin
         TfmDrugsRegisterImport.ShowForm;
         SetUpQuery;
      end;
end;

procedure TMenuForm.BroadcastToAllForms(aMessage: Cardinal; aWParam,
  aLParam: Integer; ExcludeForm: TForm);
var
   i : Integer;
begin
   for i := 0 to Screen.FormCount-1 do
      begin
         // This is a synchronous broadcast, the procedure will only return after all
         // forms have been notified. You can make it asynchronous by using PostMessage
         // instead of Perform.
         if Screen.Forms[I] <> ExcludeForm then
            Screen.Forms[I].Perform(aMessage, aWParam, aLParam);
      end;
end;

procedure TMenuForm.ProcessAimMovements;
var
   Dir  : string;
   MoveOffSummary : TMovementSummary;
   MoveOnSummary : TMovementSummary;
begin
   if ( FAimMovementSummaries = nil ) then
      FAimMovementSummaries := TList.Create;

   MoveOnSummary := nil;
   MoveOffSummary := nil;
   Dir := IncludeTrailingBackslash(DataPath) + 'AIM\Output\';

   if ( FileExists(Dir + 'movementsOn.xml') )then
      begin
         MoveOnSummary := TAimAnimalMovement.ProcessMovements(Dir + 'movementsOn.xml', mtOn);
         FAimMovementSummaries.Add(MoveOnSummary);
      end;

   if ( FileExists(Dir + 'movementsOff.xml') )then
      begin
         MoveOffSummary := TAimAnimalMovement.ProcessMovements(Dir + 'movementsOff.xml', mtOff);
         FAimMovementSummaries.Add(MoveOffSummary);
      end;

   DisplayAimMovementSummary;
end;

procedure TMenuForm.DisplayAimMovementSummary;
var
   i, j : Integer;
   Animal : TAnimal;
   FemaleAnimals : TAnimals;
   MovementSummary : TMovementSummary;
   Animals : GenTypesConst.TIntArray;
begin
   SetLength(Animals,0);
   if (FAimMovementSummaries = nil) or (FAimMovementSummaries.Count <= 0) then Exit;

   FemaleAnimals := TAnimals.Create();
   try
      TfmAimAnimalMovementSummary.OutputMovementSummary(FAimMovementSummaries);
      for i := 0 to FAimMovementSummaries.Count-1 do
         begin
            MovementSummary := TMovementSummary(FAimMovementSummaries[i]);

            for j := 0 to Length(MovementSummary.Animals)-1 do
               begin
                  SetLength(Animals, Length(Animals)+1);
                  Animals[Length(Animals)-1] := MovementSummary.Animals[j];
               end;
         end;

      if ( Length(Animals) > 0 ) then
         TfmAIMAnimalMovementEdit.Load(Animals,mtPurchase);

      // Refresh data if movements have been imported.
      SetUpQuery(True);
      EventGridAnimalEventsView.DataController.RefreshExternalData;
   finally
      FAimMovementSummaries := nil;
      SetLength(Animals,0);
   end;
end;

procedure TMenuForm.actAIMMovementsExecute(Sender: TObject);
var
   pt : tPoint;
begin
   CheckAIMInstalled();
   GetCursorPos(pt);
   pmAIMMovements.Popup(pt.x,pt.y);
end;

procedure TMenuForm.lAIMICBFMoreClick(Sender: TObject);
var
   pt : tPoint;
begin
   GetCursorPos(pt);
   pmAIMICBFMoreOptions.Popup(pt.x,pt.y);
end;

procedure TMenuForm.CheckAIMInstalled;
begin
   if not (AIMClient.ClientExists) then
      begin
         MessageDlg('The AIM Link has not been installed. Please contact Kingswood if you wish to use the AIM Link.',mtWarning,[mbOk],0);
         Abort;
      end;
end;

procedure TMenuForm.actBordBiaExecute(Sender: TObject);
var
   pShowHint : TPoint;
begin
   BordBiaEventHintTimer.Enabled := False;
   HideHintStyleController;
   uBordBiaPrint.ShowTheForm;
   if ( HerdLookup.FShowMeEventInfoType = setNone ) then Exit;
   case HerdLookup.FShowMeEventInfoType of
      setIndividualVetFeeds : begin
                                 ShowSingleAnimalEventMenu(mtVeterinaryFeeds);
                                 pShowHint := btnVetTreats.ClientToScreen(btnVetTreats.ClientRect.BottomRight);
                                 ShowIndicatorToControl(pShowHint,cShowMeEventInfo_VetFeeds,'This is where you want to go.',cxbpLeftTop);
                              end;
      setBlockHealth : begin
                          pShowHint := pOnFarmEventsLink.ClientToScreen(pOnFarmEventsLink.ClientRect.BottomRight);
                          ShowIndicatorToControl(pShowHint,cShowMeEventInfo_BlockHealth,'This is where you want to go.',cxbpTopLeft);
                       end;
      setVetLink : begin
                      ShowSingleAnimalEventMenu(mtKingswoodLinks);
                      pShowHint := btnVetLink.ClientToScreen(btnVetLink.ClientRect.BottomRight);
                      ShowIndicatorToControl(pShowHint,cShowMeEventInfo_VetLink,'This is where you want to go.',cxbpLeftTop);
                   end;
      setPhoneApp : OpenUrl('http://www.kingswoodcomputing.com/index.php?id=90');
   end;
end;

procedure TMenuForm.smiMedicinePurchaseClick(Sender: TObject);
begin
   TfMediPurch.Execute(False);   
end;

procedure TMenuForm.smsiMedicineAddClick(Sender: TObject);
begin
   uMedicineSetUp.ShowTheForm();
end;

procedure TMenuForm.smsiMedicineEditClick(Sender: TObject);
begin
   actReviewMedicine.Execute;
end;

procedure TMenuForm.cxAnimalGridViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
   WinData.FMainGridSortOrder := AColumn.SortOrder;
   FSortedColumn := AColumn;
end;

procedure TMenuForm.actReviewMedicineExecute(Sender: TObject);
var
   FocusedMedicineID : Integer;
begin
   // Query to focus record on Medicine Setup on first drug in order by code.
   // 17/07/17 [V5.6 R9.2] /MK Change - Added function to HerdLookup to get first medicine so it can be used in other areas.
   FocusedMedicineID := HerdLookup.FirstMedicineID;
   if ( FocusedMedicineID > 0 ) then
      uMedicineSetUp.ShowTheForm(FocusedMedicineID)
   else
      uMedicineSetUp.ShowTheForm();
end;

procedure TMenuForm.ReloadSyncEvents1Click(Sender: TObject);
var
   password : string;
   AnimalRemedyMedicineFixer : TfmAnimalRemedyMedicineFixer;
begin
   password := InputBox('Password', 'Enter Password', '');
   if (password <> 'config') then
      begin
         MessageDlg('Incorrect password entered.',mtError,[mbOK],0);
         Exit;
      end;

   if ( MessageDlg('This facility should only be run under the supervision of a Kingswood support representative.'+cCRLF+
                   'It is strongly advised to take a backup before running this update.'+cCRLFx2+
                   'Click OK to continue with update, or cancel to exit.', mtWarning,[mbOK,mbCancel],0) = idCancel) then Exit;

   AnimalRemedyMedicineFixer := TfmAnimalRemedyMedicineFixer.Create(nil);
   try
      AnimalRemedyMedicineFixer.ShowModal;
      RefreshAllExternalData();
   finally
      FreeandNil(AnimalRemedyMedicineFixer);
   end;
end;

procedure TMenuForm.pmiUpdateHealthUnitsClick(Sender: TObject);
begin
  if (MessageDlg('It is strongly advised to take a backup before running this update.'+cCRLFx2+
                 'Click OK to continue with update, or cancel to exit.', mtWarning,[mbOK,mbCancel],0) = idCancel) then Exit ;
     TfmUpdateHealthUnits.ShowForm;
end;

function TMenuForm.GetFQASDateCount: Integer;
var
   qFQASDateCount : TQuery;
begin
   Result := 0;

   qFQASDateCount := TQuery.Create(nil);
   with qFQASDateCount do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Count(ID)');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE (QADate IS NOT NULL)');
         try
            Open;
            Result := Fields[0].AsInteger;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
         Close;
      finally
         Free;
      end;
end;

procedure TMenuForm.actSyncAnimalExecute(Sender: TObject);
begin
   if ((WinData.AnimalFileByID.Active) and (WinData.AnimalFileByIDID.AsInteger>0)) then
       WinData.SetIsSynchronizedFlag(WinData.AnimalFileByIDID.AsInteger);
end;

procedure TMenuForm.pmiMediPurchClick(Sender: TObject);
begin
   TfMediPurch.Execute(False);
end;

procedure TMenuForm.ViewSyncWarnings1Click(Sender: TObject);
begin
   TfmSyncWarning.ShowWarnings(False);
end;

procedure TMenuForm.RemoveAnimalNoDuplicates1Click(Sender: TObject);
begin
   TfmDuplicateAnimals.ShowForm;
   RemoveAnimalNoDuplicates1.Visible := TfmDuplicateAnimals.DuplicatesFound;
end;

procedure TMenuForm.RestoreCartCreatedOnApp1Click(Sender: TObject);
begin
   WinData.RestoreAnimalCartFromWebApp();
   actFilterCart.Execute();
end;

procedure TMenuForm.actQueryAimAnimalDetailsExecute(Sender: TObject);
begin
   WinData.GoToAimAnimalDetails(WinData.UserDefaultHerdID,afNone, WinData.AnimalFileByIDID.AsInteger);
end;

procedure TMenuForm.actQueryAimAnimalDetailByBatchExecute(Sender: TObject);
begin
   if not AnimalCart.IsEmpty then
      WinData.GoToAimAnimalDetails(WinData.UserDefaultHerdID,afCart)
   else if (WinData.ActiveFilter) then
      WinData.GoToAimAnimalDetails(WinData.UserDefaultHerdID,afCustom)
   else
      WinData.GoToAimAnimalDetails(WinData.UserDefaultHerdID,afNone, WinData.AnimalFileByIDID.AsInteger);
end;

procedure TMenuForm.pmiOrderTagsClick(Sender: TObject);
begin
   ShowOrderTags;
end;

procedure TMenuForm.pmAIMMovementEnqPopup(Sender: TObject);
begin
   pmiAIMMovementListing.Visible := (FSelectedHerdType <> htDairy);
   pmiAIMImportSalesDeaths.Visible := (FSelectedHerdType = htDairy);
   pmiAIMImportPurchases.Visible := (FSelectedHerdType = htDairy);
end;

procedure TMenuForm.actICBFEmailAttachExecute(Sender: TObject);
var
   iNewAnimalsAdded : Integer;
begin
   CheckSelectedHerd;
   iNewAnimalsAdded := 0;
   //   29/01/16 [V5.5 R3.4] /MK Change - Added variable to TfmICBFPCDownloadImporter to indicate new animals added.
   if TfmICBFPCDownloadImporter.Execute(WinData.UserDefaultHerdID,False,iNewAnimalsAdded,False) then
      begin
         WinData.qObservedBy.Close;
         WinData.qObservedBy.Open;
         WinData.AnimalFileByID.Close;
         WinData.AnimalFileByID.Open;
         RefreshAllExternalData();
         //   29/01/16 [V5.5 R3.4] /MK Change - If new animals added then relink calves to dams for new calves added so that the cow
         //                                     of the calf added has the right calving date and then run SetupQuery to load new animals.
         if ( iNewAnimalsAdded > 0 ) then
            SetupQuery;
      end;
end;

procedure TMenuForm.actIMartFilesAttachExecute(Sender: TObject);
var
   FileName : string;
   FileCount : Integer;
begin
   CheckSelectedHerd;
   FileName := '';
   if WinData.GlobalSettings.DownloadMailAttachments then
      begin
         FileCount := 0;
         if ( not(WinData.FAttachmentsDownloaded) ) then
            CheckAttachments;

         FileName := TfmFileAttachmentImport.execute(itMart, cbDefaultHerd.Text, FileCount, False);
         if ( FileName <> '' ) and (FileExists(FileName)) and ( FileCount > 0 ) then
            begin
               TfmMartImport.open(mftMART,WinData.userDefaultHerdID,FileName);
               SetUpQuery;
            end
         else if ( FileCount = 0 ) then
            MessageDlg('No outstanding Mart files to import.',mtInformation,[mbOK],0);
      end;
end;

procedure TMenuForm.actFactorySalesAttachExecute(Sender: TObject);
var
   FileName : string;
   FileCount : Integer;
begin
   CheckSelectedHerd;
   FileName := '';
   if ( WinData.GlobalSettings.DownloadMailAttachments ) then
      begin
         FileCount := 0;
         if ( not(WinData.FAttachmentsDownloaded) ) then
            CheckAttachments;

         Update;
         FileName := TfmFileAttachmentImport.execute(itFactorySales, cbDefaultHerd.Text, FileCount, False);
         if ( FileName <> '' ) and (FileExists(FileName)) and ( FileCount > 0 ) then
            begin
               TfRemittance.Create(Self).ExecuteFile(FileName);
               SetUpQuery;
            end
         else if ( FileCount = 0 ) then
            MessageDlg('No outstanding Factory files to import.',mtInformation,[mbOK],0);
      end;
end;

procedure TMenuForm.actVetLinkAttachExecute(Sender: TObject);
var
   FileName : String;
   FileCount : Integer;
begin
   FileName := '';
   HideHintStyleController;
   if ( WinData.GlobalSettings.DownloadMailAttachments ) then
      begin
         if ( not(WinData.FAttachmentsDownloaded) ) then
            CheckAttachments;

         FileName := TfmFileAttachmentImport.Execute(itVetLink, cbDefaultHerd.Text, FileCount, False);
         if ( FileName <> '' ) and (FileExists(FileName)) and ( FileCount > 0 ) then
            begin
               TfmDrugsRegisterImport.ShowForm(FileName);
               SetUpQuery;
            end
         //   18/12/14 [V5.4 R0.4] /MK Change - If no files found then allow user into view VetLink screen for Review Medicine purposes - GL request.
         else if ( FileCount = 0 ) then

            if ( MessageDlg('There are no new VetLink files available to download.'+cCRLFx2+
                            'Do you want to browse for a VetLink file?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
               begin
                  TfmDrugsRegisterImport.Browse();
               end;
      end;
end;

procedure TMenuForm.actCows365AttachExecute(Sender: TObject);
var
   FileName : String;
   FileCount : Integer;
begin
   FileName := '';
   if ( Def.Definition.dUseDanRyanImport ) then
      begin
         if ( WinData.GlobalSettings.DownloadMailAttachments ) then
            begin
               FileCount := 0;
               if ( not(WinData.FAttachmentsDownloaded) ) then
                  CheckAttachments;
               FileName := TfmFileAttachmentImport.execute(itCows365, cbDefaultHerd.Text, FileCount, False);
               if (FileExists(FileName)) then
                  begin
                     TfmDanRyanImport.ShowForm(FileName);
                     RefreshAllExternalData();
                  end
               else if ( FileCount = 0 ) then
                  MessageDlg('No outstanding Cows365 files to import.',mtInformation,[mbOK],0);
            end;
      end
   else
      MessageDlg(cMissingModulePayMsg,mtError,[mbOK],0);
end;

procedure TMenuForm.actAIMMovementMenuExecute(Sender: TObject);
var
   pt : TPoint;
begin
   GetCursorPos(pt);
   pmAIMMovementEnq.Popup(pt.x,pt.y);
end;

procedure TMenuForm.ClearAnimalSelection;
begin
   //   11/05/12 [V5.0 R5.5] /MK Additional Feature - Clear Search Text On Clear Select.
   if ( teSearchText.Text <> '' ) then
      teSearchText.Text := '';

   if WinData.ActiveFilter then
      actClearFilter.Execute;
   if not(AnimalCart.IsEmpty) then
      begin
         FilterCart1.Default := False;
         ClearCart1.Click;
      end;

   //   18/03/16 [V5.5 R5.4] /MK Bug Fix - After FilterCart1.Default is assigned then assign caption of FilterCart1.
   //                                      This was stopping the user from filtering the cart again after the user clicked
   //                                      no to clear the filter after ClearSelect was clicked - Emer Howard reported.
   if FilterCart1.Default then
      FilterCart1.Caption := 'Clear Filter'
   else
      FilterCart1.Caption := 'Filter Cart';

   if not(btnTopFilter.Enabled) then
      btnTopFilter.Enabled := True;
   if not(sbEventGrid.Enabled) then
      sbEventGrid.Enabled := True;
   //if not(btnEventDiary.Enabled) then
      //btnEventDiary.Enabled := True;
   btnClearSelect.Visible := False;

   //   21/12/20 [V5.9 R7.9] /MK Change - If the sort was changed by the filter of Bulls In Use then set sort back to original sorted column.
   cxAnimalGridView.DataController.ClearSorting(False);
   if ( FSortedColumn <> nil ) then
      begin
         FSortedColumn.SortOrder := soAscending;
         FSortedColumn.SortIndex := 0;
      end;
end;

procedure TMenuForm.SyncData(ADirection: TSyncDirection);
begin
   CheckSelectedHerd;
   WinData.SyncData(ADirection, MenuForm.Handle);
end;

procedure TMenuForm.actTreatmentStatsExecute(Sender: TObject);
begin
   TfmTreatmentSummary.ShowTheForm(StrToInt(cbDefaultHerd.Value));
end;

procedure TMenuForm.pmiAddMedicineClick(Sender: TObject);
begin
   uMedicineSetUp.ShowTheForm(0);
end;

procedure TMenuForm.actMedicineNullTypesExecute(Sender: TObject);
begin
   TfmMedicinesNullGroup.ShowTheForm(True);
end;

procedure TMenuForm.imgFarmSafetyLogoClick(Sender: TObject);
begin
   ShellExecute(Self.Handle,'open','http://www.hsa.ie/eng/Publications_and_Forms/Publications/Agriculture_and_Forestry/Code_of_Practice_for_preventing_injury_and_occupational_ill_health_in_agriculture.pdf',nil,nil,SW_SHOWNORMAL);
end;

procedure TMenuForm.RemoveDuplicateAIBulls1Click(Sender: TObject);
begin
   TfmDuplicateAnimals.ShowForm(taAIBulls);
   RemoveDuplicateAIBulls1.Visible := TfmDuplicateAnimals.DuplicatesFound(taAIBulls);
end;

procedure TMenuForm.pmiAddMedSupplierClick(Sender: TObject);
var
   ID : Integer;
begin
   uSuppliers.ShowTheForm(TRUE, ID);
end;

procedure TMenuForm.pmiAddMedAdminByClick(Sender: TObject);
begin
   uMediAdminSetUp.ShowTheForm(TRUE,adAdministrator);
end;

procedure TMenuForm.pmiMedPrescribedByClick(Sender: TObject);
begin
   uMediAdminSetUp.ShowTheForm(TRUE,adPrescribingVet);
end;

procedure TMenuForm.actBordBiaClientConfigExecute(Sender: TObject);
begin
   CheckSelectedHerd;
   try
      WinData.CallProg.BordBiaClient(handle, '/c');
   except
      on e : Exception do
         ShowMessage(e.Message);
   end;
end;

procedure TMenuForm.actBordBiaClientSettingsExecute(Sender: TObject);
begin
   CheckSelectedHerd;
   try
      WinData.CallProg.BordBiaClient(handle, '/s');
   except
      on e : Exception do
         ShowMessage(e.Message);
   end;
end;

procedure TMenuForm.actCrushVetTreatExecute(Sender: TObject);
begin
   //ShowVetTreatEvent(True);
   TfmAnimalBrowser.ShowTheForm;
end;

procedure TMenuForm.actRedTractorExecute(Sender: TObject);
begin
   TfmRedTractor.ShowTheForm;
end;

procedure TMenuForm.CheckAttachments;
begin
   //   09/03/18 [V5.7 R8.2] /MK Change - Don't allow attachments to be downloaded if all All Herds is selected as All Herds folder in Mail Attachments is created - Geraldine Carroll.
   if ( cbDefaultHerd.Text = 'All Herds' ) then
      begin
         MessageDlg(cAllHerdsSelected, mtInformation,[mbok],0);
         cbDefaultHerd.DropDown;
         Abort;
      end;
   Update;
   WinData.FAttachmentsDownloaded := True;
   if ( not(WinData.DownloadEmailAttachments(cbDefaultHerd.Text) > 0) ) then
      MessageDlg(cEmail_NoNewAttachments,mtInformation,[mbOk],0);
   Update;
end;

procedure TMenuForm.lRefreshAttachmentsClick(Sender: TObject);
begin
   CheckAttachments;
end;

procedure TMenuForm.miSettingsClick(Sender: TObject);
begin
   TfmHerdSyncDataSettings.Show;
end;

procedure TMenuForm.actDiseaseSummaryExecute(Sender: TObject);
begin
   TfmRedTractorHealthCodeSummary.ShowTheForm(WinData.UserDefaultHerdID);
end;

procedure TMenuForm.btnVetStatsClick(Sender: TObject);
var
   pt : tPoint;
begin
   GetCursorPos(pt);
   pmVetStats.Popup(pt.x,pt.y);
end;

procedure TMenuForm.actReverseFilterExecute(Sender: TObject);
begin
   if ( not(WinData.ActiveFilter) ) then Exit;
   if ( WinData.AnimalFileByID.SQL.Text = '' ) then Exit;

   with WinData.AnimalFileByID do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT (A.ID), A.*');
         SQL.Add('FROM Animals A');
         SQL.Add('WHERE (A.InHerd = TRUE)');
         SQL.Add('AND   (A.AnimalDeleted = FALSE)');
         SQL.Add('AND   (A.HerdID = '+IntToStr(WinData.UserDefaultHerdID)+')');
         SQL.Add('AND   (A.ID NOT IN (SELECT AF.AID FROM AFilters AF))');
         try
            Open;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      end;
end;

procedure TMenuForm.cxAnimalGridViewPDStatusHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewPDStatus.Index );
end;

procedure TMenuForm.actImportParlourDataExecute(Sender: TObject);
var
   sParlourType,
   sParlourLinkDir,
   sFileName : String;
   NetworkLink : Boolean;
   iMooMonitorImportCount : Integer;
begin
   if ( not(Def.Definition.dUseParlour) ) then Exit;

   sParlourType := FParlourInfo.ParlourType;
   sParlourLinkDir := FParlourInfo.ParlourDir;
   NetworkLink := FParlourInfo.NetworkLink;
   //   16/05/14 [V5.3 R0.4] /MK Additional Feature - Automatically bring over parlour events from this parlour types
   //                                                 when parlour link closes.
   if ( (UpperCase(sParlourType) = 'GASCOIGNE') or
        (UpperCase(sParlourType) = 'GM2000') or
        (UpperCase(sParlourType) = 'GASCOIGNEWINDOWS') or
        (UpperCase(sParlourType) = 'LELY') or
        //   13/02/15 [V5.4 R2.6] /MK Change - Added DelPro system to this list - Johnny O'Hanlon.
        (UpperCase(sParlourType) = 'DELPRO') or
        (UpperCase(sParlourType) = 'WESTFALIA4.3') or
        (UpperCase(sParlourType) = 'WESTFALIA') or
        //   20/01/17 [V5.6 R4.2] /MK Bug Fix - Added Insentec to the list of parlours that bring data into the program - John Wynne.
        (UpperCase(sParlourType) = 'INSENTEC') or
        (UpperCase(sParlourType) = 'DAIRYMASTER') or
        //   02/02/18 [V5.7 R7.8] /MK Change - Allow CowManager parlour link.
        (UpperCase(sParlourType) = 'COWMANAGER') or
        //   14/02/18 [V5.7 R8.1] /MK Change - Allow Nedap parlour link.
        (UpperCase(sParlourType) = 'NEDAP') ) then
      if ( WinData.ParlourFileExists ) then
         WinData.CreateParlourEvents;
   ShowParlourEvents;
   SetupQuery(True);
end;

procedure TMenuForm.ShowParlourEventsTimerTimer(Sender: TObject);
begin
   if ( Def.Definition.dUseParlour ) then
      ShowParlourEvents;
end;

procedure TMenuForm.ShowParlourEvents;
begin
   ImportParlourData1.Visible := ( Def.Definition.dUseParlour ) and ( WinData.ActiveParlourLinkEvents );
   actImportParlourData.Visible := ImportParlourData1.Visible;
   ShowParlourEventsTimer.Enabled := ( not(actImportParlourData.Visible) );
end;

procedure TMenuForm.pmiChangeCustomerSupplierNamesClick(Sender: TObject);
begin
   HerdPassword.CreateAndShow(UpdateCustomerSupplierNames);
end;

procedure TMenuForm.pmiDanRyanImportClick(Sender: TObject);
begin
   TfmDanRyanImport.ShowForm;
end;

procedure TMenuForm.pmiTagReconcileClick(Sender: TObject);
begin
   TfmTagReconcile.ShowTheForm;
end;

procedure TMenuForm.AISireFromBeefRegisterClick(Sender: TObject);
var
   id : Integer;
   CallSetupQuery : Boolean;
begin
   CallSetupQuery := False;
   EnableBtn(Sender);
   try
      id := WinData.AnimalFileByIDID.AsInteger;
      try
         cxAnimalGridView.DataController.BeginFullUpdate;
         cxAnimalGridView.DataController.LockDataChangedNotify;
         try
            TfmBeefAISireRegister.execute(TfmBeefAISireRegister,CallSetupQuery);
            Screen.Cursor := crHourGlass;
            try
               if CallSetupQuery then
                  begin
                     WinData.AnimalFileByID.Close;
                     WinData.AnimalFileByID.Open;
                  end;
               cxAnimalGridView.Datacontroller.BeginLocate;
               try
                  WinData.AnimalFileByID.Locate('ID', id, []);
                  Update;
               finally
                  cxAnimalGridView.Datacontroller.EndLocate;
               end;
            finally
               Screen.Cursor := crDefault;
            end;
         except
         end;
      finally
         cxAnimalGridView.DataController.UnLockDataChangedNotify;
         cxAnimalGridView.DataController.EndFullUpdate;
      end;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.actExportGridToCSVExecute(Sender: TObject);
var
   i, j,
   ColIndex : Integer;
   saColumnArray : array of String;
   slExportFile : TStringList;
   sFieldName,
   sLine : String;
   sdSaveToFile : TSaveDialog;
   AValue : Variant;
begin
   try
      try
         SetLength(saColumnArray,0);
         for ColIndex := 0 to cxAnimalGridView.ColumnCount-1 do
            begin
               if ( cxAnimalGridView.Columns[ColIndex].Visible ) then
                  begin
                     SetLength(saColumnArray,Length(saColumnArray)+1);
                     saColumnArray[Length(saColumnArray)-1] := cxAnimalGridView.Columns[ColIndex].DataBinding.FieldName;
                     if ( Length(sLine) > 0 ) then
                        if ( Pos('"',sLine) > 0 ) then
                           sLine := sLine + ',';
                     sLine := sLine + '"' + cxAnimalGridView.Columns[ColIndex].Caption + '"';
                  end;
            end;
         if ( Length(sLine) = 0 ) then Exit;
         if ( slExportFile = nil ) then
            slExportFile := TStringList.Create();
         slExportFile.Add(sLine);
         if ( Length(saColumnArray) = 0 ) then Exit;

         with cxAnimalGridView.ViewData do
             begin
                for i := 0 to RowCount-1 do
                   begin
                      sLine := '';
                      for j := 0 to Length(saColumnArray)-1 do
                         begin
                            if ( UpperCase(saColumnArray[j]) = 'SORTANIMALNO' ) then
                               AValue := Rows[i].Values[cxAnimalGridView.DataController.GetItemByFieldName('AnimalNo').Index]
                            else if ( UpperCase(saColumnArray[j]) = 'SORTNATID' ) then
                               AValue := Rows[i].Values[cxAnimalGridView.DataController.GetItemByFieldName('NatIDNum').Index]
                            else if ( UpperCase(saColumnArray[j]) = 'PDSTATUS' ) then
                               AValue := Rows[i].Values[cxAnimalGridView.DataController.GetItemByFieldName(saColumnArray[j]).Index]
                            else
                               AValue := Rows[i].Values[cxAnimalGridView.DataController.GetItemByFieldName(saColumnArray[j]).Index];
                            if ( AValue <> Null ) then
                               begin
                                  if ( slExportFile = nil ) then
                                     slExportFile := TStringList.Create();
                                  if ( Length(sLine) > 0 ) then
                                     if ( Pos('"',sLine) > 0 ) then
                                        sLine := sLine + ',';
                                  if ( VarType(AValue) = VarDate ) then
                                     sLine := sLine + '"' + DateToStr(AValue) + '"'
                                  else if ( VarType(AValue) = VarInteger ) then
                                     sLine := sLine + '"' + IntToStr(AValue) + '"'
                                  else if ( VarType(AValue) = VarDouble ) then
                                     sLine := sLine + '"' + FloatToStr(AValue) + '"'
                                  else if ( VarType(AValue) = VarBoolean ) then
                                     begin
                                        //   15/02/18 [V5.7 R8.2] /MK Bug Fix - If AValue was False then CSV file showed True - Eddie Jordan UCD.
                                        if AValue = True then
                                           sLine := sLine + '"True"'
                                        else
                                           sLine := sLine + '"False"';
                                     end
                                  else
                                     sLine := sLine + '"' + AValue + '"';
                               end
                            else
                               begin
                                  if ( Length(sLine) > 0 ) then
                                     if ( Pos('"',sLine) > 0 ) then
                                        sLine := sLine + ',';
                                  sLine := sLine + '""';
                               end;
                         end;
                      if ( Length(sLine) > 0 ) then
                         slExportFile.Add(sLine);
                   end;
             end;
         if ( slExportFile.Count <= 1 ) then
            MessageDlg('No animals to export.',mtError,[mbOK],0)
         else
            begin
               if ( sdSaveToFile = nil ) then
                  try
                     sdSaveToFile := TSaveDialog.Create(self);
                     sdSaveToFile.Filter := 'CSV file|*.csv';
                     sdSaveToFile.DefaultExt := 'csv';
                     sdSaveToFile.InitialDir := GetSpecialFolder(CSIDL_DESKTOP);
                     if ( sdSaveToFile.Execute ) then
                        begin
                           slExportFile.SaveToFile(sdSaveToFile.FileName);
                           MessageDlg('File successfully saved.',mtInformation,[mbOK],0);
                        end;
                  finally
                     FreeAndNil(sdSaveToFile);
                  end;
            end;
      except
         on e : Exception do
            begin
               ShowMessage(e.Message);
               SysUtils.Abort;
            end;
      end;
   finally
      FreeAndNil(slExportFile);
   end;
end;

procedure TMenuForm.pmiAIMImportPurchasesClick(Sender: TObject);
begin
   if AIMClient.GetVersionNumber >= 1024 then // This version has support for viewing purchases directly from herd
      WinData.GoToMovementEnquiry(WinData.UserDefaultHerdID, True, 'In')
   else
      WinData.GoToMovementEnquiry(WinData.UserDefaultHerdID, False);
end;


procedure TMenuForm.actMoveEventLactNoUtilityExecute(Sender: TObject);
begin
   HerdPassword.CreateAndShow(UpdateEventsLactNo);
   SetUpQuery;
end;

procedure TMenuForm.actClearSoldAnimalTranspondersExecute(Sender: TObject);
begin
   HerdPassword.CreateAndShow(paClearSoldAnimalTransponders);
   SetUpQuery;
end;

procedure TMenuForm.pmiAIMImportSalesDeathsClick(Sender: TObject);
begin
   WinData.GoToMovementEnquiry(WinData.UserDefaultHerdID, True, 'Out');
end;

procedure TMenuForm.DownloadInstallerIfMissing;
var
   GetkInstaller : TLMDWebHTTPGet;
   LMDWebDownload : TLMDWebDownload;
begin
   if (FileExists(ApplicationPath + cKInstallerProgram)) or not (IsNetConnected) then Exit;

   GetkInstaller := TLMDWebHTTPGet.Create(nil);
   with GetkInstaller do
      try
         Screen.Cursor := crHourglass;

         URL := 'http://www.kingswood.ie/download/winherd/kinstaller.exe';
         DownloadDir := 'C:\Kingswood Herd Management\';
         DestinationName := 'kinstaller.exe';
         OnProcessed := OnFileDownloaded;
         Process(False,False);
      finally
         Free;
         Screen.Cursor := crDefault;
      end;
end;

procedure TMenuForm.OnFileDownloaded(Sender: TObject);
begin
   if FileExists(ApplicationPath + cKInstallerProgram) then
      Download;
end;

procedure TMenuForm.miFixAnimalLactationNumbersClick(Sender: TObject);
begin
   HerdPassword.CreateAndShow(paFixAnimalLactNos);
   if ( WinData.AnimalLactNoFixCompleted ) then
      SetUpQuery;
end;

procedure TMenuForm.AddStockBullEvent(AInEvent : Boolean);
var
   bIsStockBull,
   bMessageShown : Boolean;
const
   cStockBullError = 'Animal sex must be a stock bull!';
begin
   bMessageShown := False;
   if ( UpperCase(WinData.AnimalFileByIDSex.AsString) <> 'BULL' ) then
      MessageDlg(cStockBullError,mtInformation,[mbOK],0)
   else
      begin
         if ( not(HerdLookup.qStockBulls.Active) ) then
            HerdLookup.qStockBulls.Open;
         bIsStockBull := HerdLookup.qStockBulls.Locate('ID',WinData.AnimalFileByIDID.AsInteger,[]);
         if ( HerdLookup.qStockBulls.Active ) then
            HerdLookup.qStockBulls.Close;
         if ( not(bIsStockBull) ) then
            MessageDlg(cStockBullError,mtError,[mbOK],0)
         else
            begin
               if ( AInEvent ) then
                  begin
                     HerdLookup.CalcAnimalStockBullEvents(WinData.AnimalFileByIDID.AsInteger,True,bMessageShown);
                     if ( bMessageShown ) then
                        MessageDlg('An active stock bull in event already exists for this animal.',mtError,[mbOK],0)
                     else
                        begin
                           TfmStockBullEvent.ShowTheForm(sbIn, AddEvent);
                           SetUpQuery;
                        end;
                  end
               else
                  begin
                     HerdLookup.CalcAnimalStockBullEvents(WinData.AnimalFileByIDID.AsInteger,False,bMessageShown);
                     if ( bMessageShown ) then
                        MessageDlg('An active stock bull out event already exists for this animal.',mtError,[mbOK],0)
                     else
                        begin
                           TfmStockBullEvent.ShowTheForm(sbOut, AddEvent);
                           SetupQuery;
                        end;
                  end;
            end;
      end;
end;

procedure TMenuForm.actStockBullInExecute(Sender: TObject);
begin
   AddStockBullEvent(True);
end;

procedure TMenuForm.actStockBullOutExecute(Sender: TObject);
begin
   AddStockBullEvent(False);
end;

procedure TMenuForm.SetupServicesBtn;
begin
   if ( not(HerdLookup.qStockBulls.Active) ) then
      HerdLookup.qStockBulls.Open;
   if ( HerdLookup.qStockBulls.RecordCount = 0 ) then
      btnService.Kind := cxbkStandard
   else
      begin
         btnService.Kind := cxbkDropDownButton;
         btnService.DropDownMenu := pmStockBullEvent;
      end;
   if ( HerdLookup.qStockBulls.Active ) then
      HerdLookup.qStockBulls.Close;
end;

procedure TMenuForm.FormPaint(Sender: TObject);
begin
   Update;
end;

procedure TMenuForm.miHerdSyncClick(Sender: TObject);
begin
   ViewSyncWarnings1.Visible := TfmSyncWarning.HasWarnings;
   N46.Visible := ( ReloadSyncEvents1.Visible ) or ( ViewSyncWarnings1.Visible ); 
end;

procedure TMenuForm.actUpdateHerdDesignatorExecute(Sender: TObject);
begin
   HerdPassword.CreateAndShow(paFixHerdDesignator);
   ShowUpdateHerdDesignatorUtility;
   if ( WinData.IETagDesignatorUpdated ) then
      SetUpQuery;
end;

procedure TMenuForm.ShowUpdateHerdDesignatorUtility;
begin
   pmiUpdateHerdDesignator.Visible := ( (WinData.SystemRegisteredCountry = Ireland) and
                                        (ValidEIDTagFormat(WinData.UserDefaultHerdDesignator)) and
                                        (StripAllSpaces(GetTagPrefix(WinData.UserDefaultHerdID)) = cTagPreFix_IE) );
end;

procedure TMenuForm.ShowDeletedAnimals1Click(Sender: TObject);
begin
   if ( MessageDlg('WARNING: Some features of Kingswood Herd may not be available for deleted animals.'+cCRLF+
                   'Do you wish to continue?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
      DoFilter(qfDeletedAnimals,'Deleted Animals');
end;

procedure TMenuForm.DeletedAnimalsFilter;
begin
   try
      Screen.Cursor := crHourGlass;
      Update;
      cxAnimalGridView.DataController.BeginFullUpdate;
      WinData.AnimalFileByID.DisableControls;
         try
            WinData.AnimalFileByID.Active := False;
            WinData.AnimalFileByID.SQL.Clear;
            WinData.AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.*');
            WinData.AnimalFileByID.SQL.Add('FROM Animals A');
            WinData.AnimalFileByID.SQL.Add('WHERE (A.AnimalDeleted = True)');
            ApplySortToAnimalFileByIdAndOpenQuery();
         finally
            WinData.AnimalFileByID.EnableControls;
            cxAnimalGridView.DataController.EndFullUpdate;
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.actUndeleteAnimalExecute(Sender: TObject);
begin
   if ( WinData.IsDeletedCalf(WinData.AnimalFileByIDId.AsInteger) ) then
      begin
         MessageDlg('This is a deleted calf and cannot be un-deleted.'+cCRLF+
                    'To un-delete this animal enter the tag number in a calving event'+cCRLF+
                    'and click Yes to the prompt to re-use the calf record.',mtInformation,[mbOK],0);
         Exit;
      end;
   if ( WinData.Delete_UndeleteAnimal(WinData.AnimalFileByIDId.AsInteger,False) ) then
      begin
         SetupQuery(False);
         cxAnimalGridView.DataController.FocusedRecordIndex := 0;
      end;
end;

procedure TMenuForm.actDeleteAnimalExecute(Sender: TObject);
var
   iAnimalIdent : String;
begin
   iAnimalIdent := '';
   if ( Length(WinData.AnimalFileByIDAnimalNo.AsString) > 0 ) then
      iAnimalIdent := WinData.AnimalFileByIDAnimalNo.AsString
   else if ( Length(WinData.AnimalFileByIDNatIDNum.AsString) > 0 ) then
      iAnimalIdent := WinData.AnimalFileByIDNatIDNum.AsString;
   HerdPassword.CreateAndShow(paDeleteSelectedAnimal);
   if ( WinData.DeleteSelectedAnimalOnMainGrid ) then
      if ( MessageDlg('Deleting Animal ' + iAnimalIdent + #13#13 + cDeleteAnimalMessage,mtWarning,[mbYes,mbNo],0) = mrYes ) then
         if ( WinData.Delete_UndeleteAnimal(WinData.AnimalFileByIDId.AsInteger,True) ) then
            begin
               SetupQuery(False);
               cxAnimalGridView.DataController.FocusedRecordIndex := 0;
            end;
   WinData.DeleteSelectedAnimalOnMainGrid := False;
end;

procedure TMenuForm.actSyncNowExecute(Sender: TObject);
begin
   SyncData();
end;

procedure TMenuForm.ProcessAIMHerdReconcile;
var
   sDir,
   sAIMHerdRecFile : string;
begin
   sDir := IncludeTrailingBackslash(DataPath) + 'AIM\Output\';
   sAIMHerdRecFile := sDir + 'reconcile.xml';
   if ( not(FileExists(sAIMHerdRecFile)) ) then Exit;
   Update;
   TfmAIMHerdRecImport.ShowTheForm(sAIMHerdRecFile);
   Update;
   SetUpQuery(False);
   cxAnimalGridView.DataController.FocusedRecordIndex := 0;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.DefaultHandler(var Message);
begin
  with TMessage(Message) do
     begin
        if (Msg = WM_KINGSWOOD_AIMCLIENT_CLOSED) then
           begin
              BroadcastToAllForms(WM_INTERNAL_AIMCLIENT_CLOSED, 0,0,nil);
              if AIMMovementsActivated then
                 begin
                    AIMMovementsActivated := False;
                    ProcessAimMovements();
                    DisplayAimMovementSummary();
                 end;
              if ( HerdReconcileActivated ) then
                 begin
                    HerdReconcileActivated := False;
                    ProcessAIMHerdReconcile();
                 end;
           end
        else if (Msg = WM_KINGSWOOD_AIMCLIENT_ANIMALREGISTERED) then
           WinData.UpdateAnimalRegistrationStatus(lParam,wParam)
        else if (Msg = WM_KINGSWOOD_AIMCLIENT_PROCESSDISASSOCIATEDTRANSACTIONS) then
           WinData.ProcessDisassociatedAimAnimalRegistrationTransactions()
        else if (Msg = WM_KINGSWOOD_AIMCLIENT_PROCESSMOVEMENTSON) or (Msg = WM_KINGSWOOD_AIMCLIENT_PROCESSMOVEMENTSOFF) then
           AIMMovementsActivated := True
        else if (Msg = WM_KINGSWOOD_AIMCLIENT_RECONCILEHERD) then
           HerdReconcileActivated := True
        else if (Msg = WM_KINGSWOOD_FARMSYNC_COMPLETED) then
           begin
              // Process any aim animal registrations.
              SetUpQuery(True);
              EventGridAnimalEventsView.DataController.RefreshExternalData;

              if (TfmSyncWarning.HasWarnings()) then
                 TfmSyncWarning.ShowWarnings(True);
           end
        else if (Msg = WM_KINGSWOOD_FARMSYNC_SETTINGSCHANGED) then
           begin
              if (_MessageDlg('The Farm Sync settings have changed' + cCRLFx2 +
                             'Do you want to sync your herd data now?',
                             mtConfirmation,[mbYes,mbNo],0) = idYes) then
                 begin
                    actSyncData.Execute;
                 end;
           end
        else if (Msg = WM_KINGSWOOD_FARMSYNC_OPTIONSCHANGED) then
           begin
           end
        else if (Msg = WM_KINGSWOOD_FARMSYNC_ERRORINSYNCPROCESS) then
           begin
              _MessageDlg('Error''s have occurred during the Farm Sync operation - please contact Kingswood support.',mtError,[mbOK],0);
           end
        else if (Msg = WM_KINGSWOOD_FARMSYNC_LOGINFAILED) then
           begin
              _MessageDlg('The Farm Sync operation could not be started. ' + cCRLFX2 +
                          'Please check your internet connection is working and '+
                          'your username && password settings are correct.',mtError,[mbOK],0);
           end
        else if (Msg = WM_KINGSWOOD_FARMSYNC_UPDATEREQUIRED) then
           begin
              if (Windata.SessionState <> nil) then
                  Windata.SessionState.FarmSyncUpdateRequired := True;

              Application.BringToFront;
              Application.RestoreTopMosts;
              if (_MessageDlg('The Farm Sync operation has been cancelled.' + cCRLFx2 +
                              'An update of the Farm Sync program is available to download.'+ cCRLFx2 +
                              'PLEASE NOTE: No further sync operations cannot be completed until the '+ cCRLF +
                              'update has been downloaded.'+ cCRLFx2 +
                              'Click OK to begin download.',mtWarning,[mbOK,mbCancel],0) = mrOK) then
                 begin
                    Download;
                 end;
           end
        else if (Msg = WM_KINGSWOOD_FARMSYNC_MARKASSYNCHRONIZED) then
           begin
              ApplicationLog.LogDebugMessage('WM_KINGSWOOD_FARMSYNC_MARKASSYNCHRONIZED called');
              THerdSync.MarkAsSynchronized(WinData.KingData.Directory);
           end
        else if (Msg = WM_KINGSWOOD_FARMSYNC_PROCESS_EVENTS) then
           begin
              ApplicationLog.LogDebugMessage('WM_KINGSWOOD_FARMSYNC_PROCESS_EVENTS called');
              THerdSync.ReadHerdSyncData(DataPath + '\herdData_output.xml');
              SetUpQuery(True);
              EventGridAnimalEventsView.DataController.RefreshExternalData;
              if (TfmSyncWarning.HasWarnings()) then
                 TfmSyncWarning.ShowWarnings(True);
           end
        else if (Msg = WM_KINGSWOOD_INVALID_SYSTEM_DATE_FORMAT) then
           begin
              ApplicationLog.LogDebugMessage('WM_KINGSWOOD_INVALID_SYSTEM_DATE_FORMAT called');
              _MessageDlg('This process could not be started.' + cCRLFX2 +
                          'Please check the date format in Control Panel/Regional Settings.',mtError,[mbOK],0);
           end
        else if (Msg = WM_KINGSWOOD_AIMCLIENT_PROCESS_PROCESSNEWCUSTOMER) then
           begin
              ApplicationLog.LogDebugMessage('WM_KINGSWOOD_AIMCLIENT_PROCESS_PROCESSNEWCUSTOMER called');
              ProcessAIMCompCertNewCustomer;
           end
        else if ( Msg = WM_KINGSWOOD_FARMSYNC_ADJUST_MAX_ACTIVE_BULL_COUNT ) then
           PostMessage(Handle,WM_KINGSWOOD_SHOW_MAX_ACTIVE_BULL_SCR,0,0)
        else if ( Msg = WM_KINGSWOOD_SHOW_MAX_ACTIVE_BULL_SCR ) then
           TfmHerdSyncDataSettings.Show
        else
           inherited DefaultHandler(Message);
      end;
end;

procedure TMenuForm.ShowIndicatorToControl(APoint : TPoint; const
   AHintTitle, AHintText: string; APos : TcxCallOutPosition);
begin
   BordBiaEventHintTimer.Enabled := False;
   HideHintStyleController();
   CreateBordBiaHintStyleController();
   HintStyleController.HintStyle.CallOutPosition := APos;
   BordBiaEventHintTimer.Enabled := True;
   HintStyleController.ShowHint(APoint.x, APoint.y, AHintTitle, AHintText);
end;

procedure TMenuForm.pVetFeedsContainterEnter(Sender: TObject);
begin
   BordBiaEventHintTimer.Enabled := False;
   HideHintStyleController;
end;

procedure TMenuForm.BordBiaEventHintTimerTimer(Sender: TObject);
begin
   BordBiaEventHintTimer.Enabled := False;
   HideHintStyleController;
end;

procedure TMenuForm.CreateAnimalCartHintStyleController;
begin
   HintStyleController.HintStyle.Standard := False;
   HintStyleController.HintStyle.Color := $00FCD6B4;
   HintStyleController.HintStyle.IconType := cxhiInformation;
   HintStyleController.HintStyle.Animate := cxhaNone;
   HintStyleController.HintStyle.AnimationDelay := 500;
   HintStyleController.HintStyle.CallOutPosition := cxbpNone;
   HintStyleController.HintStyle.CaptionFont.Name := 'Tahoma';
   HintStyleController.HintStyle.CaptionFont.Size := 8;
   HintStyleController.HintStyle.CaptionFont.Style := [fsBold];
   HintStyleController.HintStyle.CaptionFont.Color := clWindowText;
   HintStyleController.HintStyle.Font.Name := 'Tahoma';
   HintStyleController.HintStyle.Font.Size := 8;
   HintStyleController.HintStyle.Font.Style := [];
   HintStyleController.HintStyle.Font.Color := clWindowText;
   HintStyleController.HintStyle.Rounded := True;
   HintStyleController.HintStyle.RoundRadius := 12;
end;

procedure TMenuForm.CreateBordBiaHintStyleController;
begin
   HintStyleController.HintStyle.Standard := False;
   HintStyleController.HintStyle.Color := clRed;
   HintStyleController.HintStyle.IconType := cxhiNone;
   HintStyleController.HintStyle.Animate := cxhaSlideDownward;
   HintStyleController.HintStyle.AnimationDelay := 50;
   HintStyleController.HintStyle.CallOutPosition := cxbpLeftTop;
   HintStyleController.HintStyle.CaptionFont.Name := 'Segoe UI';
   HintStyleController.HintStyle.CaptionFont.Size := 14;
   HintStyleController.HintStyle.CaptionFont.Style := [fsBold];
   HintStyleController.HintStyle.CaptionFont.Color := clWhite;
   HintStyleController.HintStyle.Font := HintStyleController.HintStyle.CaptionFont;
   HintStyleController.HintStyle.Font.Size := 12;
   HintStyleController.HintStyle.Rounded := False;
end;

procedure TMenuForm.HideHintStyleController;
begin
   if ( HintStyleController <> nil ) then
      HintStyleController.HideHint;
end;

procedure TMenuForm.pbBordBiaLinkPaint(Sender: TObject);
begin
   GradVertical(pbBordBiaLink.Canvas, pbBordBiaLink.ClientRect, $0069CCFC, $00048ED0);
end;

procedure TMenuForm.ShowBordBiaEventAreaButton;
begin
   pBordBiaLink.Visible := ( FCountry = Ireland ) and ( not(WinData.ShowDealerControls) );
   ToolbarSep972.Visible := btnBordBiaRedTrac.Visible;
   pBordBiaLink.Top := 175;
   if ( (pBordBiaLink.Visible) and (pParlourEventsLink.Visible) ) then
      begin
         pBordBiaLink.Left := 204;
         pParlourEventsLink.Left := 428;
      end
   else if ( (pBordBiaLink.Visible) and (not(pParlourEventsLink.Visible)) ) then
      pBordBiaLink.Left := 325
   else if ( (not(pBordBiaLink.Visible)) and (pParlourEventsLink.Visible) ) then
      pParlourEventsLink.Left := 325;
end;

procedure TMenuForm.actFeedDiaryExecute(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   try
      cxAnimalGridView.DataController.BeginFullUpdate;
   finally
      Screen.Cursor := crDefault;
   end;

   try
      Screen.Cursor := crHourGlass;
      TfmFeedEventFilter.ShowTheForm;
   finally
      Screen.Cursor := crHourGlass;
      try
         cxAnimalGridView.DataController.EndFullUpdate;
      finally
         Screen.Cursor := crDefault;
      end;
   end;
end;

procedure TMenuForm.actCreateBatchGroupFilterExecute(Sender: TObject);
begin
   CreateGroupFromSelection(gtBatch, stFilter);
end;

procedure TMenuForm.actCreateFeedGroupFilterExecute(Sender: TObject);
begin
   CreateGroupFromSelection(gtFeed, stFilter);
end;

procedure TMenuForm.actCreateBatchGroupCartExecute(Sender: TObject);
begin
   CreateGroupFromSelection(gtBatch, stCart);
end;

procedure TMenuForm.actCreateFeedGroupCartExecute(Sender: TObject);
begin
   CreateGroupFromSelection(gtFeed, stCart);
end;

procedure TMenuForm.CreateGroupFromSelection(AGroupType: TGroupType; ASelectionType : TSelectionType);
var
   sGroupType,
   sGroupName,
   sAnimalIdent : String;
   i,
   iNewGroupID,
   iGroupCount : Integer;
   slErrorList,
   slReviewList : TStringList;
   AnimalData : TAnimal;
   iaAdded,
   iaErrors,
   iaFeedErrors : array of Integer;
   bAllowMove : Boolean;

   function InExistingFeedGroupWithActiveRegime (AAnimalID : Integer) : Boolean;
   var
      iAnimalExistGroupIDs : PIntegerArray;
      iExistGroupType : TGroupType;
   begin
      Result := False;
      if ( AAnimalID = 0 ) then Exit;
      if ( AGroupType <> gtFeed ) then Exit;

      SetLength(iAnimalExistGroupIDs,0);
      iAnimalExistGroupIDs := WinData.GroupManager.GetAnimalsExistGroupIDs(AAnimalID,AGroupType);
      iExistGroupType := gtNone;
      if ( Length(iAnimalExistGroupIDs) > 0 ) then
         iExistGroupType := WinData.GroupManager.GetGroupIDGroupType(iAnimalExistGroupIDs[0]);

      if ( iExistGroupType = gtFeed ) then
         Result := WinData.FeedManager.GroupHasActiveFeedRegime(iAnimalExistGroupIDs[0]);
      if ( not(Result) ) then Exit;

      SetLength(iaFeedErrors,Length(iaFeedErrors)+1);
      iaFeedErrors[Length(iaFeedErrors)-1] := AAnimalID;
      AnimalData := GetAnimal(AAnimalID);
      if ( Length(AnimalData.AnimalNo) > 0 ) then
         sAnimalIdent := AnimalData.AnimalNo
      else
         sAnimalIdent := AnimalData.NatIdNum;
      slErrorList.Add(Format('Animal %s exists in a feed group with an active feed regime.',[sAnimalIdent]));
   end;

   function InExistingGroup (AAnimalID : Integer) : Boolean;
   var
      iAnimalsExistGroupIDs : PIntegerArray;
      iExistGroupType : TGroupType;
   begin
      Result := False;
      if ( AAnimalID = 0 ) then Exit;
      iExistGroupType := gtNone;
      SetLength(iAnimalsExistGroupIDs,0);
      iAnimalsExistGroupIDs := WinData.GroupManager.GetAnimalsExistGroupIDs(AAnimalID,AGroupType);
      if ( Length(iAnimalsExistGroupIDs) > 0 ) then
         iExistGroupType := WinData.GroupManager.GetGroupIDGroupType(iAnimalsExistGroupIDs[0]);
      Result := ( iExistGroupType = AGroupType );
      if ( Result ) and ( AGroupType = gtFeed ) and ( InExistingFeedGroupWithActiveRegime(AAnimalID) ) then Exit;

      if Result then
         begin
            SetLength(iaErrors,Length(iaErrors)+1);
            iaErrors[Length(iaErrors)-1] := AAnimalID;
            AnimalData := GetAnimal(AAnimalID);
            if ( Length(AnimalData.AnimalNo) > 0 ) then
               sAnimalIdent := AnimalData.AnimalNo
            else
               sAnimalIdent := AnimalData.NatIdNum;
            slErrorList.Add(Format('Animal %s is already in a %s group.',[sAnimalIdent,sGroupType]));
         end
   end;

   procedure AddAnimalToGroup (AAnimalID : Integer; AAllowMove : Boolean);
   var
      iaAnimalExistGroupIDs : PIntegerArray;
      iExistGroupType : TGroupType;
      AnimalData : TAnimal;
      bInActiveFeedGroup : Boolean;
   begin
      if ( AAnimalID = 0 ) then Exit;
      SetLength(iaAnimalExistGroupIDs,0);
      iExistGroupType := gtNone;
      iaAnimalExistGroupIDs := WinData.GroupManager.GetAnimalsExistGroupIDs(AAnimalID, AGroupType);
      if ( Length(iaAnimalExistGroupIDs) > 0 ) then
         iExistGroupType := WinData.GroupManager.GetGroupIDGroupType(iaAnimalExistGroupIDs[0]);
      bInActiveFeedGroup := InExistingFeedGroupWithActiveRegime(AAnimalID);
      if ( (iExistGroupType = gtFeed) and  bInActiveFeedGroup ) then Exit;
      if ( (iExistGroupType = AGroupType) and (not(AAllowMove)) ) then Exit; 

      try
         if ( AAllowMove ) then
            begin
               WinData.GroupManager.AddToGroup(AAnimalID, iNewGroupID, AAllowMove, Date, '', False);
               SetLength(iaAdded,Length(iaAdded)+1);
               iaAdded[Length(iaAdded)-1] := AAnimalID;
            end;
      except
      end;
   end;

   procedure AddAnimalFromSelectionToGroup (AAllowMove : Boolean);
   var
      i : Integer;
   begin
      if ( (ASelectionType = stFilter) and (WinData.ActiveFilter) ) then
         begin
            iGroupCount := WinData.FilteredAnimals.RecordCount;
            WinData.FilteredAnimals.First;
            while ( not(WinData.FilteredAnimals.Eof) ) do
               begin
                  AddAnimalToGroup(WinData.FilteredAnimals.FieldByName('AID').AsInteger,AAllowMove);
                  WinData.FilteredAnimals.Next;
               end;
         end
      else if ( (ASelectionType = stCart) and (not(AnimalCart.IsEmpty)) ) then
         begin
            iGroupCount := Length(AnimalCart.AnimalCartData);
            for i := 0 to Length(AnimalCart.AnimalCartData)-1 do
               AddAnimalToGroup(AnimalCart.AnimalCartData[i],AAllowMove);
         end;
   end;

begin
   if ( ASelectionType = stNoSelection ) then Exit;
   if ( (ASelectionType = stFilter) and (not(WinData.ActiveFilter)) and (WinData.FilteredAnimals.RecordCount = 0) ) then Exit;
   if ( (ASelectionType = stCart) and (AnimalCart.IsEmpty) ) then Exit;

   try
      Screen.Cursor := crHourGlass;
      bAllowMove := False;

      sGroupType := WinData.GroupManager.GroupTypeStringFromType(AGroupType);

      // Go through the filter or cart list and see if the animals are already in a group of this type.
      slErrorList := TStringList.Create();
      SetLength(iaAdded,0);
      SetLength(iaErrors,0);
      SetLength(iaFeedErrors,0);
      if ( (ASelectionType = stFilter) and (WinData.ActiveFilter) ) then
         begin
            iGroupCount := WinData.FilteredAnimals.RecordCount;
            WinData.FilteredAnimals.First;
            while ( not(WinData.FilteredAnimals.Eof) ) do
               begin
                  InExistingGroup(WinData.FilteredAnimals.FieldByName('AID').AsInteger);
                  WinData.FilteredAnimals.Next;
               end;
         end
      else if ( (ASelectionType = stCart) and (not(AnimalCart.IsEmpty)) ) then
         begin
            iGroupCount := Length(AnimalCart.AnimalCartData);
            for i := 0 to Length(AnimalCart.AnimalCartData)-1 do
               InExistingGroup(AnimalCart.AnimalCartData[i]);
         end;

      // If there is an ErrorList and the count of animals equals the cart or filter coun then don't create group just give the review and exit.
      if ( (Length(iaErrors) > 0) and (iGroupCount = Length(iaErrors)) ) or
         ( (Length(iaFeedErrors) > 0) and (iGroupCount = Length(iaFeedErrors)) ) then
         begin
            slErrorList.Clear;
            if ( Length(iaFeedErrors) > 0 ) then
               begin
                  slErrorList.Add(Format('All animals are already in a %s group with an active feed regime.',[sGroupType]));
                  SetLength(iaFeedErrors,0);
                  TfmGeneralReview.ShowTheForm(rtGroups,slErrorList,bAllowMove,False);
                  Exit;
               end
            else
               begin
                  slErrorList.Add(Format('All animals are already in a %s group.'+cCRLF+
                                         'Click Move Animals to move these animals to the new %s group.',[sGroupType, sGroupType]));
                  TfmGeneralReview.ShowTheForm(rtGroups,slErrorList,bAllowMove,True);
                  if ( not(bAllowMove) ) then Exit;
               end;
         end;

      sGroupName := '';
      sGroupName := InputBox(sGroupType+' Group Name','Please enter the name of the new '+sGroupType+' Group.',sGroupName);
      if ( Length(sGroupName) = 0 ) then Exit;
      iNewGroupID := WinData.GroupManager.CreateGroup(sGroupName,AGroupType);
      if ( iNewGroupID = 0 ) then Exit;

      // If the animal is in an existing group then stop the animal from going to the new group and give a summary of animals
      // that were added to the group or not.

      slErrorList.Clear;
      SetLength(iaErrors,0);
      SetLength(iaFeedErrors,0);

      slReviewList := TStringList.Create();
      bAllowMove := True;
      AddAnimalFromSelectionToGroup(bAllowMove);

      if ( Length(iaAdded) > 0 ) then
         begin
            slReviewList.Add(Format('%d animal(s) successfully added to %s %s group.',[Length(iaAdded),sGroupName,sGroupType]));
            slReviewList.Add('');
         end;

      if ( Length(iaErrors) > 0 ) then
         begin
            slReviewList.Add(Format('Some animals cannot be added to the new group as they are already in a %s group.'+cCRLF+
                                    'Click Move Animals to move these animals to the new %s group.',[sGroupType, sGroupType]));
            slReviewList.Add('');
            for i := 0 to slErrorList.Count-1 do
               slReviewList.Add(slErrorList.Strings[i]);
         end;

      if ( Length(iaFeedErrors) > 0 ) then
         begin
            slReviewList.Add(Format('Some animals are in a %s group with an active feed regime.'+cCRLF+
                                    'These animals cannot be moved to the new %s group',[sGroupType, sGroupType]));
            slReviewList.Add('');
            for i := 0 to slErrorList.Count-1 do
               slReviewList.Add(slErrorList.Strings[i]);
         end;

   finally
      Screen.Cursor := crDefault;
      if ( iNewGroupID > 0 ) then
         begin
            TfmGeneralReview.ShowTheForm(rtGroups,slReviewList,bAllowMove,( Length(iaErrors) > 0 ));
            if ( bAllowMove ) then
               AddAnimalFromSelectionToGroup(bAllowMove);
         end;
      if ( slReviewList <> nil ) then
         FreeAndNil(slReviewList);
      if ( slErrorList <> nil ) then
         FreeAndNil(slErrorList);
   end;
end;

procedure TMenuForm.actGroupSetupFromFilterExecute(Sender: TObject);
begin
   uGroupSetUp.ShowTheForm(0,False,stFilter);
   SetUpQuery;
end;

procedure TMenuForm.actGroupSetupFromCartExecute(Sender: TObject);
begin
   uGroupSetUp.ShowTheForm(0,False,stCart);
   SetUpQuery;
end;

procedure TMenuForm.actGoToCC31ACartExecute(Sender: TObject);
begin
   if ( not(AnimalCart.IsEmpty) ) then
      WinData.GoToAimComplianceCert(WinData.UserDefaultHerdID,afCart, CC31A);
end;

procedure TMenuForm.actGoToCC31BCartExecute(Sender: TObject);
begin
   if ( not(AnimalCart.IsEmpty) ) then
      WinData.GoToAimComplianceCert(WinData.UserDefaultHerdID,afCart, CC31B);
end;

procedure TMenuForm.actGoToCC31AFilterExecute(Sender: TObject);
begin
   WinData.GoToAimComplianceCert(WinData.UserDefaultHerdID,afCustom, CC31A);
end;

procedure TMenuForm.actGoToCC31BFilterExecute(Sender: TObject);
begin
   WinData.GoToAimComplianceCert(WinData.UserDefaultHerdID,afCustom, CC31B);
end;

procedure TMenuForm.cxAnimalGridViewTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
   Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
   var AText: String);

   function GetAvgOverallGainPerDay : Double;
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AVG(OverallWeightGain)');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE ID IN (SELECT AID FROM AFilters)');
            SQL.Add('AND OverallWeightGain > 0');
            try
               Open;
               if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
                  Result := Fields[0].AsFloat;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   //   12/01/18 [V5.7 R7.4] /MK Additional Feature - AvgOverallGainPerDay should be based on animals with a gain NOT animals with zero gain per day - GL.
   AText := FormatFloat('0.00',GetAvgOverallGainPerDay);
end;

procedure TMenuForm.actRefreshAnimalsExecute(Sender: TObject);
var
   iCalcYear : Integer;
   WeighedAnimals : TTable;
   QueryAnimals : TQuery;
   fOverallGain : Double;
   bHasSoldAnimals : Boolean;
begin
   QueryAnimals := TQuery.Create(nil);
   try
      Screen.Cursor := crHourGlass;

      QueryAnimals.DatabaseName := AliasName;

      WinData.RefreshOverGainPerDay := False;

      if ( FSelectedHerdType <> htDairy ) and ( cxAnimalGridViewOverallGainPerDay.Visible ) then
         try
            //   25/01/18 [V5.7 R7.5] /MK Change - Bring up prompt to run the check for all animals both in herd or after the selected year.
            iCalcYear := TfmUpdateAnimalGainPerDayMsg.GetWeightGainCalcYear;
            if ( iCalcYear = 0 ) then Exit;

            if ( not(WinData.EventDataHelper.CanCalcOverallGainPerDay) ) then
               begin
                  MessageDlg('To calculate lifetime weight gain/day, you need to have'+cCRLF+
                             'entered at least two sets of weighings.',mtInformation,[mbOK],0);
                  Exit;
               end;

            QueryAnimals.SQL.Clear;
            QueryAnimals.SQL.Add('UPDATE Animals');
            QueryAnimals.SQL.Add('SET OverallWeightGain = 0');
            QueryAnimals.ExecSQL;

            WinData.AnimalFileByID.Close;
            WinData.AnimalFileByID.Open;

            WeighedAnimals := TTable.Create(nil);
            WeighedAnimals.DatabaseName := AliasName;
            WeighedAnimals.TableName := 'tWeighedAnimals';
            WeighedAnimals.FieldDefs.Add('ID',ftAutoInc);
            WeighedAnimals.FieldDefs.Add('AnimalID',ftInteger);
            if WeighedAnimals.Exists then Exit;

            WeighedAnimals.FieldDefs.Clear;
            WeighedAnimals.IndexDefs.Clear;

            WeighedAnimals.FieldDefs.Add('Id',ftAutoInc);
            WeighedAnimals.FieldDefs.Add('AnimalID',ftInteger);

            WeighedAnimals.IndexDefs.Add('iId','Id',[ixPrimary, ixUnique]);
            WeighedAnimals.IndexDefs.Add('iAnimalID','AnimalID',[ixUnique, ixCaseInsensitive]);
            WeighedAnimals.CreateTable;
            WeighedAnimals.Open;

            // Get all animals in the currently in the herd first.
            QueryAnimals.SQL.Clear;
            QueryAnimals.SQL.Add('INSERT INTO '+WeighedAnimals.TableName+' (AnimalID)');
            QueryAnimals.SQL.Add('SELECT ID');
            QueryAnimals.SQL.Add('FROM Animals');
            QueryAnimals.SQL.Add('WHERE InHerd = True');
            QueryAnimals.SQL.Add('AND   AnimalDeleted = False');
            QueryAnimals.SQL.Add('AND   HerdID = '+IntToStr(WinData.UserDefaultHerdID)+'');
            try
               QueryAnimals.ExecSQL;
            except
               MessageDlg('Cannot get In Herd animals',mtError,[mbOK],0);
               Exit;
            end;

            // Get all animals that were sold since the date period selected.
            QueryAnimals.Close;
            QueryAnimals.SQL.Clear;
            QueryAnimals.SQL.Add('INSERT INTO '+WeighedAnimals.TableName+' (AnimalID)');
            QueryAnimals.SQL.Add('SELECT A.ID');
            QueryAnimals.SQL.Add('FROM Animals A');
            QueryAnimals.SQL.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)');
            QueryAnimals.SQL.Add('WHERE A.InHerd = False');
            QueryAnimals.SQL.Add('AND   A.HerdID = '+IntToStr(WinData.UserDefaultHerdID)+'');
            QueryAnimals.SQL.Add('AND   E.EventType = '+IntToStr(CSaleDeathEvent)+'');
            QueryAnimals.SQL.Add('AND   E.EventDate >= "01/01/'+IntToStr(iCalcYear)+'"');
            try
               QueryAnimals.ExecSQL;
            except
               MessageDlg('Cannot get sold animals',mtError,[mbOK],0);
               Exit;
            end;

            // Delete animals from WeighedAnimals table that have never been weighed to update of Animals table quicker.
            QueryAnimals.Close;
            QueryAnimals.SQL.Clear;
            QueryAnimals.SQL.Add('DELETE FROM '+WeighedAnimals.TableName);
            QueryAnimals.SQL.Add('WHERE AnimalID NOT IN (SELECT AnimalID');
            QueryAnimals.SQL.Add('                       FROM Events');
            QueryAnimals.SQL.Add('                       WHERE EventType = :CWeighingEvent)');
            QueryAnimals.Params[0].AsInteger := CWeightEvent;
            QueryAnimals.ExecSQL;

            WeighedAnimals.Close;
            WeighedAnimals.Open;

            ShowProgressIndicator('Processing Lifetime Weight Gain/Day',0,WeighedAnimals.RecordCount,1);
            ProgressIndicator.Max := WeighedAnimals.RecordCount;
            Application.ProcessMessages;
            Update;

            //   27/06/18 [V5.8 R0.6] /MK Change - Update animals table of animals in WeighedAnimals table who have an OverAllGainPerDay value.
            WeighedAnimals.First;
            while ( not(WeighedAnimals.Eof) ) do
               begin
                  fOverallGain := WinData.FEventDataHelper.GetAnimalOverallGainPerDay(WeighedAnimals.FieldByName('AnimalID').AsInteger);
                  if ( fOverallGain > 0 ) then
                     begin
                        QueryAnimals.Close;
                        QueryAnimals.SQL.Clear;
                        QueryAnimals.SQL.Add('UPDATE Animals');
                        QueryAnimals.SQL.Add('SET OverallWeightGain = :Gain');
                        QueryAnimals.SQL.Add('WHERE ID = :AnimalID');
                        QueryAnimals.Params[0].AsFloat := fOverallGain;
                        QueryAnimals.Params[1].AsInteger := WeighedAnimals.FieldByName('AnimalID').AsInteger;
                        QueryAnimals.ExecSQL;
                     end;
                  ProgressIndicator.Position := ProgressIndicator.Position + 1;
                  WeighedAnimals.Next;
               end;
            ProgressIndicator.Close;
            Application.ProcessMessages;
            Update;

            WinData.RefreshOverGainPerDay := False;

         finally
            if ( WeighedAnimals <> nil ) then
               begin
                  WeighedAnimals.Close;
                  WeighedAnimals.DeleteTable;
                  FreeAndNil(WeighedAnimals);
               end;
         end;

      //   14/05/21 [V6.0 R1.1] /MK Additional Feature - Added calculation of Gross Margin from WinData.MDGridPurchData and WinData.MDGridSaleData.
      // Get the count of animals on the main grid that are sold. If none then no point running through procedure.
      bHasSoldAnimals := False;
      QueryAnimals.Close;
      QueryAnimals.SQL.Clear;
      QueryAnimals.SQL.Add('SELECT AF.AId');
      QueryAnimals.SQL.Add('FROM AFilters AF');
      QueryAnimals.SQL.Add('INNER JOIN Animals A ON (AF.AId = A.Id)');
      QueryAnimals.SQL.Add('WHERE (A.InHerd = False)');
      QueryAnimals.SQL.Add('AND   (A.AnimalDeleted = False)');
      QueryAnimals.SQL.Add('AND   (A.HerdId In (SELECT DefaultHerdID FROM Defaults))');
      QueryAnimals.Open;
      bHasSoldAnimals := ( QueryAnimals.RecordCount > 0 );
      if ( FSelectedHerdType = htBeef ) and ( WinData.GlobalSettings.DisplayMovementFeedColsInGridView ) and
         ( cxAnimalGridViewGrossMargin.Visible ) and ( bHasSoldAnimals ) then
         try
            cxAnimalGridView.DataController.BeginFullUpdate;
            WinData.AnimalFileByID.DisableControls;

            WinData.MDGridGrossMarginData.Close;
            WinData.MDGridGrossMarginData.Open;

            if ( not(WinData.MDGridPurchData.Active) ) or ( (WinData.MDGridPurchData.Active) and (WinData.MDGridPurchData.RecordCount = 0) ) then Exit;

            ShowProgressIndicator('Processing Gross Margin Data',0,QueryAnimals.RecordCount,1);
            ProgressIndicator.Max := QueryAnimals.RecordCount;
            Application.ProcessMessages;
            Update;

            QueryAnimals.First;
            while ( not(QueryAnimals.Eof) ) do
               begin
                  if ( WinData.MDGridPurchData.Locate('AnimalId',QueryAnimals.FieldByName('AId').AsInteger,[]) ) and
                     ( WinData.MDGridSaleData.Locate('AnimalId',QueryAnimals.FieldByName('AId').AsInteger,[]) ) then
                     if ( WinData.MDGridPurchData.FieldByName('PurchPrice').AsFloat > 0 ) and ( WinData.MDGridSaleData.FieldByName('SalePrice').AsFloat > 0 ) then
                        try
                           WinData.MDGridGrossMarginData.Append;
                           WinData.MDGridGrossMarginData.FieldByName('AnimalId').AsInteger := QueryAnimals.FieldByName('AId').AsInteger;
                           WinData.MDGridGrossMarginData.FieldByName('GrossMargin').AsFloat := ( WinData.MDGridSaleData.FieldByName('SalePrice').AsFloat -
                                                                                                 WinData.MDGridPurchData.FieldByName('PurchPrice').AsFloat );
                           WinData.MDGridGrossMarginData.Post;
                        except
                           on e : Exception do
                              begin
                                 ShowDebugMessage(e.Message);
                                 ApplicationLog.LogException(e);
                                 ApplicationLog.LogError(Format('WinData.MDGridGrossMarginData : Error posting for AnimalId :d.',
                                                                [QueryAnimals.FieldByName('AId').AsInteger]));
                              end;
                        end;
                  ProgressIndicator.Position := ProgressIndicator.Position + 1;
                  QueryAnimals.Next;
               end;
            ProgressIndicator.Close;
            Application.ProcessMessages;
            Update;
            WinData.MDGridGrossMarginData.Open;
         finally
            try
               cxAnimalGridView.DataController.EndFullUpdate;
               Windata.AnimalFileByID.EnableControls;
            except
            end;
         end;

   finally
      if ( QueryAnimals <> nil ) then
         begin
            QueryAnimals.Close;
            FreeAndNil(QueryAnimals);
         end;

      Screen.Cursor := crDefault;
      Application.ProcessMessages;
      Update;
   end;
end;

procedure TMenuForm.btnImportClick(Sender: TObject);
var
   pt : tPoint;
begin
   GetCursorPos(pt);
   pmImportOptions.Popup(pt.x,pt.y);
end;

procedure TMenuForm.btnExportClick(Sender: TObject);
var
   pt : tPoint;
begin
   GetCursorPos(pt);
   pmExportOptions.Popup(pt.x,pt.y);
end;

procedure TMenuForm.actStopSyncingOnThisMachineExecute(Sender: TObject);
begin
   if ( TfmFarmSyncSettings.SyncSettingsFileExists ) then
      if ( Application.MessageBox('Do you want to remove the sync settings file from this device?',
                                  'Remove Sync Settings',MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = idYes ) then
         begin
            DeleteFile(TfmFarmSyncSettings.SyncSettingsFile);
            SetupForm;
         end;
end;

procedure TMenuForm.UpdateServiceComments1Click(Sender: TObject);
begin
   HerdPassword.CreateAndShow(paUpdateServiceComment);
end;

procedure TMenuForm.ShowHideAnimalCategoryItems;
begin
   pmiBullsInUse.Visible := ( FSelectedHerdType <> htBeef );
   N36.Visible := ( FSelectedHerdType <> htBeef );
   pmiMilkingCows.Visible := ( FSelectedHerdType <> htBeef );
   pmiReplacements.Visible := ( FSelectedHerdType = htDairy );
   pmiCowsInMilk.Visible := ( FSelectedHerdType = htDairy );
   pmiCowsDry.Visible := ( FSelectedHerdType = htDairy );
   pmiBeefCattle.Visible := ( FSelectedHerdType = htDairy );
   N37.Visible := ( FSelectedHerdType <> htBeef );
   pmiAllCalves.Visible := ( FSelectedHerdType <> htBeef );
   pmiHeifers.Visible := ( FSelectedHerdType <> htBeef );
   pmiDairyHeifers.Visible := ( FSelectedHerdType = htDairy );
   pmiBeefHeifers.Visible := ( FSelectedHerdType = htDairy );
   pmiBulls.Visible := ( FSelectedHerdType <> htBeef );
   pmiLeftHerdCulled.Visible := ( FSelectedHerdType <> htBeef );
end;

procedure TMenuForm.actUpdateAnimalDetailsTransponderExecute(
  Sender: TObject);
begin
   TfmEditAnimalsByGrid.ShowTheForm(eftTransponder);
   SetUpQuery(True);
end;

procedure TMenuForm.actUpdateAnimalDetailsAnimalNoExecute(Sender: TObject);
begin
   TfmEditAnimalsByGrid.ShowTheForm(eftAnimalNo);
   SetUpQuery(True);
end;

procedure TMenuForm.actGroupVetTreatExecute(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(THealth,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.actGroupWeighingExecute(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TWeight,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.actShowDeathEventExecute(Sender: TObject);
begin
   ShowSalesDeathEvent(False);
end;

procedure TMenuForm.ShowAIMOrStandardIrishRecScr;
begin
   if ( AIMClient.ClientExists ) and ( FCountry = Ireland ) then
      begin
         actMovementPermits.Caption := 'AIM'+#13#10+'Movements';
         btnMovementPermits.Kind := cxbkDropDown;
         btnMovementPermits.DropDownMenu := pmAIMMovements;
         btnAimMovements.Action := actAIMMovements;
         actRegisterRemarks.Caption := 'Register Remarks';
      end
   else
      begin
         if ( FCountry = NIreland ) then
            actMovementPermits.Caption := 'APHIS'+#13#10+'Movement'
         else
            actMovementPermits.Caption := 'CTS Move.';
         btnMovementPermits.Kind := cxbkStandard;
         btnMovementPermits.DropDownMenu := nil;
         btnAimMovements.Action := actRegisterRemarks;
         actRegisterRemarks.Caption := 'Register'+cCRLF+'Remarks';
      end;
end;

procedure TMenuForm.NewFeatures1Click(Sender: TObject);
begin
   TfmHerdNewFeatures.ShowTheForm(False);
end;

procedure TMenuForm.ClearDiseaseTestDates1Click(Sender: TObject);
begin
   HerdPassword.CreateAndShow(paClearDiseaseTestDates);
   SetUpQuery;
end;

procedure TMenuForm.DeleteGroupsNotUsedClick(Sender: TObject);
begin
   TfmGroupsNotUsed.ShowTheForm;
   HerdLookup.qGroupsNotUsed.Open;
   DeleteGroupsNotUsed.Visible := ( HerdLookup.qGroupsNotUsed.RecordCount > 0 );
   HerdLookup.qGroupsNotUsed.Close;
end;

procedure TMenuForm.actImportTransponderFileToCartExecute(Sender: TObject);
var
   slNotImported,
   slTransponderFile : TStringList;
   i, j, iAddedCount, iNotAddedCount : Integer;
   Parser : TSPParser;
   sLine, sTransponder : String;
   qTransponders : TQuery;

   function TranponderAddedToCart ( ATransponder : String ) : Boolean;
   begin
      qTransponders.First;
      while ( not(qTransponders.Eof) ) do
         begin
            Result := ( Pos(StripAllSpaces(qTransponders.FieldByName('TransponderNo').AsString),ATransponder) > 0 );
            if ( not(Result) ) then
               Result := ( Pos(StripAllSpaces(qTransponders.FieldByName('LocateNatID').AsString),ATransponder) > 0 );
            if Result then
               begin
                  AnimalCart.AddToCart(qTransponders.FieldByName('ID').AsInteger);
                  Break;
               end
            else
            qTransponders.Next;
         end;
   end;

begin
   if ( WinData.ActiveFilter ) and ( WinData.FilteredAnimals.RecordCount > 0 ) and
      ( MessageDlg('There is currently an active filter.'+cCRLF+
                   'Do you want to clear this filter before importing the selected file?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
      begin
         MessageDlg('Import cannot continue with an active filter.'+cCRLF+
                    'The import will now be cancelled.',mtError,[mbOK],0);
         Exit;
      end;

   if ( not(AnimalCart.IsEmpty) ) then
      if ( MessageDlg('There is currently an active animal cart.'+cCRLF+
                      'Do you want to clear this cart before importing the selected file?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
      begin
         MessageDlg('Import cannot continue with an active cart.'+cCRLF+
                    'The import will now be cancelled.',mtError,[mbOK],0);
         Exit;
      end;

   with TOpenDialog.Create(nil) do
      try
         slTransponderFile := TStringList.Create();
         try
            Filter := 'CSV file|*.csv';
            DefaultExt := 'csv';
            InitialDir := GetSpecialFolder(CSIDL_DESKTOP);
            Execute;

            if ( Length(FileName) = 0 ) then
               begin
                  MessageDlg('No transponder file selected.',mtError,[mbOK],0);
                  Exit;
               end;

            slTransponderFile.LoadFromFile(FileName);
            if ( slTransponderFile.Count = 0 ) then
               begin
                  MessageDlg('No data available in selected file.',mtError,[mbOK],0);
                  Exit;
               end;

            iAddedCount := 0;
            Screen.Cursor := crHourGlass;

            AnimalCart.ClearCart;
            FilterCart1.Default := False;
            AnimalCartFiltered := False;
            FilterCart1.Caption := 'Filter Cart';

            actClearFilter.Execute;

            qTransponders := TQuery.Create(nil);
            Parser := TSPParser.Create(nil);
            slNotImported := TStringList.Create();
            try
               qTransponders.DatabaseName := AliasName;
               qTransponders.SQL.Clear;
               qTransponders.SQL.Add('SELECT ID, TransponderNo, LocateNatID, HerdID');
               qTransponders.SQL.Add('FROM Animals');
               qTransponders.SQL.Add('WHERE InHerd = True');
               qTransponders.SQL.Add('AND   AnimalDeleted = False');
               qTransponders.Open;
               Parser.Sepchar := ',';
               for i := 0 to slTransponderFile.Count-1 do
                  begin
                     sLine := slTransponderFile.Strings[i];
                     Parser.Parse(sLine);
                     for j := 1 to Parser.Count do
                        if ( IsNumeric(StripAllSpaces(Parser.Fields[j])) ) and
                           ( Length(StripAllSpaces(Parser.Fields[j])) = 15 ) then
                           begin
                              sTransponder := StripAllSpaces(Parser.Fields[j]);
                              if ( TranponderAddedToCart(sTransponder) ) then
                                 Inc(iAddedCount)
                              else
                                 slNotImported.Add(Format('Unable to locate transponder %s in Kingswood.',[sTransponder]));
                           end;
                  end;
               if ( not(AnimalCart.IsEmpty) ) then
                  begin
                     if ( WinData.MultiHerd ) then
                        cbDefaultHerd.KeyValue := AllHerds;
                     actFilterCart.Execute;
                     RefreshAllExternalData;
                  end;
            finally
               if ( Parser <> nil ) then
                  FreeAndNil(Parser);
               if ( qTransponders <> nil ) then
                  begin
                     qTransponders.Close;
                     FreeAndNil(qTransponders);
                  end;
            end;
         finally
            Screen.Cursor := crDefault;
            if ( slTransponderFile <> nil ) then
               FreeAndNil(slTransponderFile);
            if ( slNotImported <> nil ) then
               begin
                  iNotAddedCount := slNotImported.Count;
                  if ( iNotAddedCount > 0 ) then
                     begin
                        slNotImported.Strings[0] := Format('%d transponder(s) found.',[iAddedCount]) + cCRLF + cCRLF +
                                                    Format('%d transponder(s) not found.',[iNotAddedCount]) + cCRLF + cCRLF + slNotImported.Strings[0];
                        TfmImportFileMemo.ShowTheForm('Transponder File To Cart Import Errors',slNotImported);
                     end;
                  FreeAndNil(slNotImported);
               end
         end;
      finally
         Free;
      end;
end;

procedure TMenuForm.ShowLinksMenu;
begin
   //   18/03/14 [V5.2 R9.0] /MK Additional Feature - Only show new Kingswood Links for Irish herds with Gmail & Mail Attachments.
   //   03/01/19 [V5.8 R5.9] /MK Change - WinData.GlobalSettings.DownloadMailAttachments now based on existence of mailbox.config file not preference as preference removed - GL/SP request.
   pKingswoodLink1.Visible := ( FCountry in [Ireland, NIreland] ) and ( WinData.GlobalSettings.DownloadMailAttachments ) ;

   //   07/08/14 [V5.3 R4.4] /MK Change - Make Link buttons for ICBF & Cows365 not visible for Beef Herds.
   if ( pKingswoodLink1.Visible ) then
      begin
         btnMartFiles1.Visible := ( FCountry in [Ireland, NIreland] );
         btnFactorySales1.Visible := ( FCountry = Ireland );
         btnVetLink.Visible := ( FCountry = Ireland );
         btnCows365.Visible := ( FCountry in [Ireland, NIreland] ) and ( FSelectedHerdType <> htBeef );
         btnICBFImport.Visible := ( FCountry = Ireland ) and ( FSelectedHerdType <> htBeef );
      end;
end;

procedure TMenuForm.TeamViewerClick(Sender: TObject);
begin
   WinData.CallProg.CallTeamViewer();
end;

procedure TMenuForm.mnuTeamViewerClick(Sender: TObject);
begin
   TeamViewerClick(Sender);
end;

procedure TMenuForm.FocusAnimalOnMainGrid(const AAnimalID: Integer);
begin
   if (WinData.AnimalFileByID.RecordCount=0) then Exit;
   cxAnimalGridView.DataController.BeginLocate;
   try
      if ( AAnimalID <= 0 ) or ( not(cxAnimalGridView.DataController.LocateByKey(AAnimalID)) ) then
         cxAnimalGridView.DataController.FocusedRowIndex := 0;
   finally
      cxAnimalGridView.DataController.EndLocate;
   end;
end;

procedure TMenuForm.pmAnimalCartPopupPopup(Sender: TObject);
begin
   ClearCart1.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) );
   ViewCart1.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) );

   AddAlltoCart1.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) );
   AddToQueue2.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) );
   if ( AnimalCart.InCart(WinData.AnimalFileByIDID.AsInteger) ) then
      AddToQueue2.Caption := 'Remove From Cart'
   else
      AddToQueue2.Caption := 'Add To Cart';

   pmiDrafting.Visible := ShowDraftGroupsMenu;
   N55.Visible := pmiDrafting.Visible;
   if ( pmiDrafting.Visible ) then
      CreateDraftGroupsMenu;

   FilterCart1.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) );
   //   27/03/19 [V5.8 R8.3] /MK Change - Don't hide the Create Group option, instead disable it - GL request.
   pmiCreateFromCart.Enabled := ( not(AnimalCart.IsEmpty) );

   GoTo1.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) );
   RestoreCartCreatedOnApp1.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) ) and ( WinData.SyncServiceIsAvailable );

   EnableSpaceBar1.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) );
   Help2.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) );

   actQueryAimAnimalDetailByBatch.Enabled := ( AIMQueryAnimalHistory1.Visible ) and ( AnimalCart.Count > 0 );

   FilterCart1.Enabled := not(AnimalCart.IsEmpty);
   ClearCart1.Enabled := FilterCart1.Enabled;
   ViewCart1.Enabled := FilterCart1.Enabled;
   GoTo1.Enabled := FilterCart1.Enabled;
   pmiDrafting.Enabled := FilterCart1.Enabled;

   //   07/12/17 [V5.7 R6.1] /MK Bug Fix - Tag Replacement Form was alwas showing but should only show for Irish herds.
   MenuItem22.Visible := ( FCountry = Ireland );

   MenuItem31.Visible := ( not(WinData.AnimalFileByIDHerdID.AsInteger = WinData.NONEHerdID) ) and ( FCountry in [NIreland, England] );
   MenuItem30.Visible := MenuItem31.Visible;

   BuildOnFarmEventsMenu(pmAnimalCartPopup, OnFarmEvents1);

   Application.ProcessMessages;
   Update;
end;

procedure TMenuForm.cxAnimalGridViewJohnesResultGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ( AText = '1' ) then
      AText := 'Low'
   else if ( AText = '2') then
      AText := 'Medium'
   else if ( AText = '3' ) then
      AText := 'High';
end;

procedure TMenuForm.pmiEditGroupClick(Sender: TObject);
var
   GroupID : SmallInt;
begin
   GroupID := 0;
   uGroupSetUp.ShowTheFormID(1, GroupID);
end;

procedure TMenuForm.actAutoArchiveExecute(Sender: TObject);
begin
   //   09/04/19 [V5.8 R8.6] /MK Additional Feature - New feature added to run an AutoArchive program that stores the current database in
   //                                                 a new database called "DatabaseName" + Today's date and then reindexs the current database.
   sbExit.Enabled := False;
   try
      Screen.Cursor := crHourGlass;
      try
         if WinData.ActiveFilter then
            ClearAnimalSelection();
         WinData.KingData.CloseDataSets;
         WinData.KingData.Close;
         WinData.CallProg.AutoArchive();
         ForceIndicesRemoval(WinData.KingData.Directory);
         ReIndexAll(True);
         WinData.OpenAndCheckTables;
         WinData.MoveIDsToAFilter;
      except
         on E : Exception do
            raise Exception.Create('AutoArchive Failed: Error occured while disconnecting from database.' + cCRLF +
                                   'Restart program and try again. If problem persists contact Kingwood');
      end;
   finally
      sbExit.Enabled := True;
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.psmManualAIClick(Sender: TObject);
begin
   TfmAddSire.ShowTheForm(stAISire);
end;

procedure TMenuForm.pmNonHerdStockBullClick(Sender: TObject);
begin
   TfmAddSire.ShowTheForm(stNonHerdSire);
end;

procedure TMenuForm.pmiNonHerdDamClick(Sender: TObject);
begin
   fSetUpAnimals.DefaultAnimalType := atNonHerdDam;
   AddAnimal;
end;

procedure TMenuForm.ProcessAIMCompCertNewCustomer;
var
   sDir,
   sAIMNewCustFile : string;
begin
   sDir := IncludeTrailingBackslash(DataPath) + 'AIM\Output\';
   sAIMNewCustFile := sDir + 'newcustomers.xml';
   if ( not(FileExists(sAIMNewCustFile)) ) then Exit;
   TAimAnimalMovement.ProcessAIMCompCertNewCustXML(sAIMNewCustFile);
end;

procedure TMenuForm.pmExportOptionsPopup(Sender: TObject);
begin
   if ( FCountry <> Ireland ) and ( Def.Definition.dUseMilkRec ) then
      begin
         if ( WinData.OwnerFileUKMilkRecorder.AsString = '' ) then
            begin
               MessageDlg('Please select a Milk Recorder from the Herd Settings screen.',mtError,[mbOK],0);
               uHerdSetUp.ShowTheForm(FALSE);
               CreateMilkRecorderCaption;
            end
         else
            CreateMilkRecorderCaption;
      end;
end;

procedure TMenuForm.pmiAHDBFileClick(Sender: TObject);
begin
   TfmAHDBImport.ShowTheForm;
   RefreshAllExternalData;
end;

procedure TMenuForm.miTestFacilityClick(Sender: TObject);
begin
   if ( WinData.MDGridGrossMarginData.Locate('AnimalId',WinData.AnimalFileByIDID.AsInteger,[]) ) then
      ShowMessage(WinData.AnimalFileByIDNatIDNum.AsString + ' Gross Margin = '+FloatToStr(WinData.MDGridGrossMarginData.FieldByName('GrossMargin').AsFloat))
   else
      ShowMessage('Animal No Found in mdGridGrossMarginData');
end;

procedure TMenuForm.actAddA1A2ResultExecute(Sender: TObject);
var
   bResultSaved : Boolean;
begin
   TfmPopupAnimalEdit.ShowTheForm(WinData.AnimalFileByIDID.AsInteger,bResultSaved);
   if bResultSaved then
      RefreshAnimalGrid;
end;

procedure TMenuForm.ImportA1A2Results;
var
   Parser : TSPParser;
   sLine, sTag, sResult : String;
   slFile : TStringList;
   opFile : TOpenDialog;
   i, iTagPos, iResultPos, iUpdateCount : Integer;
   Animal : TAnimal;
   qAddModResult : TQuery;
const
   // The Result can either be Homozygous or Heterozygous (based on file from Jennifer Matthews/Pat Ryan).
   cHomozygous = 'HOMOZYGOUS';
   cHeterozygous = 'HETEROZYGOUS';
begin
   // A1A2 Result Files are converted from Excel to CSV.
   // They should contain a header line with headings "herd ID" being the tag and "Genotype" being the result.
   opFile := TOpenDialog.Create(nil);
   try
      opFile.Title := 'Select A1/A2 Result File';
      opFile.Filter := 'CSV file|*.csv';
      opFile.DefaultExt := 'csv';
      opFile.InitialDir := GetSpecialFolder(CSIDL_DESKTOP);
      opFile.Execute;
      if ( Length(opFile.FileName) = 0 ) then
         begin
            MessageDlg('No file selected.',mtError,[mbOK],0);
            Exit;
         end;

      slFile := TStringList.Create();
      slFile.LoadFromFile(opFile.FileName);
      if ( slFile.Count = 0 ) then
         begin
            MessageDlg('The selected file is empty.',mtError,[mbOK],0);
            Exit;
         end;

      Parser := TSPParser.Create(nil);
      Parser.Sepchar := ',';

      iTagPos := 0;
      iResultPos := 0;
      iUpdateCount := 0;

      sLine := slFile.Strings[0];
      Parser.Parse(sLine);
      for i := 1 to Parser.Count do
         begin
            if ( UpperCase(Parser.Fields[i]) = 'HERD ID' ) then
               iTagPos := i
            else if ( UpperCase(Parser.Fields[i]) = 'GENOTYPE' ) then
               iResultPos := i;
            if ( iTagPos > 0 ) and ( iResultPos > 0 ) then Break;
         end;

      if ( iTagPos = 0 ) or ( iResultPos = 0 ) then
         begin
            MessageDlg('Unable to find the Tag Number or Result postion in the file.'+cCRLF+
                       'Contact Kingswood at +353-1-4599491.',mtError,[mbOK],0);
            Exit;
         end;

      qAddModResult := TQuery.Create(nil);
      qAddModResult.DatabaseName := AliasName;

      ShowProgressIndicator('Importing A1/A2 Results',0,slFile.Count-1,1);
      ProgressIndicator.Max := slFile.Count-1;
      ProgressIndicator.Position := 1;
      Application.ProcessMessages;
      Update;

      for i := 1 to slFile.Count-1 do
         try
            sLine := slFile.Strings[i];
            Parser.Parse(sLine);
            sTag := StripAllSpaces(Parser.Fields[iTagPos]);
            sResult := UpperCase(Parser.Fields[iResultPos]);
            if ( Pos(cHomozygous,sResult) > 0 ) then
               Delete(sResult,Pos(cHomozygous,sResult),Length(cHomozygous))
            else if ( Pos(cHeterozygous,sResult) > 0 ) then
               Delete(sResult,Pos(cHeterozygous,sResult),Length(cHeterozygous));
            sResult := StripAllSpaces(sResult);
            Animal := GetAnimal(sTag,True,WinData.UserDefaultHerdID);
            if ( Animal <> nil ) and ( Length(sResult) = 5 ) then
               begin
                  qAddModResult.Close;
                  qAddModResult.SQL.Clear;
                  qAddModResult.SQL.Add('SELECT *');
                  qAddModResult.SQL.Add('FROM DNAResults');
                  qAddModResult.SQL.Add('WHERE AnimalID = :AID');
                  qAddModResult.Params[0].AsInteger := Animal.Id;
                  qAddModResult.Open;
                  if ( qAddModResult.RecordCount = 0 ) then
                     begin
                        qAddModResult.Close;
                        qAddModResult.SQL.Clear;
                        qAddModResult.SQL.Add('INSERT INTO DNAResults (AnimalID, A1A2)');
                        qAddModResult.SQL.Add('VALUES (:AID, :DNAResult)');
                        qAddModResult.Params[0].AsInteger := Animal.Id;
                        qAddModResult.Params[1].AsString := sResult;
                        qAddModResult.ExecSQL;
                     end
                  else
                     begin
                        qAddModResult.Close;
                        qAddModResult.SQL.Clear;
                        qAddModResult.SQL.Add('UPDATE DNAResults');
                        qAddModResult.SQL.Add('SET A1A2 = :DNAResult');
                        qAddModResult.SQL.Add('WHERE AnimalID = :AID');
                        qAddModResult.Params[0].AsString := sResult;
                        qAddModResult.Params[1].AsInteger := Animal.Id;
                        qAddModResult.ExecSQL;
                     end;
                  Inc(iUpdateCount);
               end;
            ProgressIndicator.Position := ProgressIndicator.Position + 1;
         except
            on e : Exception do
               begin
                  ApplicationLog.LogException(e);
                  ApplicationLog.LogError('Error Importing A1/A2 Results : '+e.Message);
               end;
         end;
      ProgressIndicator.Close;
   finally
      if ( Parser <> nil ) then
         FreeAndNil(Parser);
      if ( slFile <> nil ) then
         FreeAndNil(slFile);
      if ( qAddModResult <> nil ) then
         FreeAndNil(qAddModResult);
      if ( opFile <> nil ) then
         FreeAndNil(opFile);
      if ( iUpdateCount > 0 ) then
         RefreshAnimalGrid;
   end;
end;

procedure TMenuForm.RefreshAnimalGrid;
var
   iFocusedAnimalID : Integer;
begin
    Screen.Cursor := crHourGlass;
    try
       iFocusedAnimalID := WinData.AnimalFileByIdID.AsInteger;
       WinData.AnimalFileByID.DisableControls;
       WinData.AnimalFileByID.Close;
       WinData.AnimalFileByID.Open;
       cxAnimalGridView.Datacontroller.BeginLocate;
       try
          WinData.AnimalFileByID.Locate('ID', iFocusedAnimalID, []);
          Update;
       finally
          cxAnimalGridView.Datacontroller.EndLocate;
       end;
       WinData.AnimalFileByID.EnableControls;
    finally
       Screen.Cursor := crDefault;
    end;
end;

procedure TMenuForm.pmiA1A2ResultFileClick(Sender: TObject);
begin
   ImportA1A2Results;
end;

procedure TMenuForm.actModifyGridExecute(Sender: TObject);
var
   CurrGridView : TcxGridTableView;
   i, j : Integer;
begin
   CurrGridView := cxAnimalGridView;
   TfmModifyGridCols.ShowTheForm(CurrGridView);
   for i := 0 to CurrGridView.ColumnCount-1 do
      for j := 0 to cxAnimalGridView.ColumnCount-1 do
         if ( cxAnimalGridView.Columns[j].Name = CurrGridView.Columns[i].Name ) then
            cxAnimalGridView.Columns[j].Visible := CurrGridView.Columns[i].Visible;
   StoreAnimalGridView;         
end;

procedure TMenuForm.actCalvingHelpExecute(Sender: TObject);
begin
   if ( IsNetConnected ) then
      WinData.CallProg.CallCalvingHelp
   else
      MessageDlg('Unable to open calving online help.'+cCRLF+
                 'Please make sure your connected to the internet.',mtError,[mbOK],0);
end;

procedure TMenuForm.StockBullsInUseFilter;
begin
   try
      Update;
      cxAnimalGridView.DataController.BeginFullUpdate;
      WinData.AnimalFileByID.DisableControls;
      WinData.AnimalFileByID.Active := False;
      with WinData.AnimalFileByID.SQL do
         try
            Clear;
            Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
            Add('INNER JOIN BullSemenStk B ON (B.AnimalID=A.ID)');
            Add('WHERE (A.AnimalDeleted=FALSE)');
            Add('AND   (A.Sex="'+cSex_Bull+'")');
            Add('AND   (A.AnimalNo <> "")');
            Add('AND   (B.InUse = True)');
            Add('AND   (A.Breeding = True)');
            Add('AND   (A.HerdID IN (SELECT DefaultHerdID FROM Defaults))');
            ApplySortToAnimalFileByIdAndOpenQuery();
            fFilters.AIBullSQL := '';
            fFilters.AIBullSQL := WinData.AnimalFileByID.SQL.Text;
         finally
            WinData.AnimalFileByID.EnableControls;
            cxAnimalGridView.DataController.EndFullUpdate;
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.pmiNatIdSortClick(Sender: TObject);
begin
// General NatIdNum Sort.
end;

procedure TMenuForm.pmiNatIdCheckDigitClick(Sender: TObject);
begin
// NatIdNum Sort Check Digit.
end;

procedure TMenuForm.pmiNatIdLast4DigitsClick(Sender: TObject);
begin
// NatIdNum Last 4 Digit Sort.
end;

procedure TMenuForm.pmiListStockBullsClick(Sender: TObject);
begin
   DoFilter(qfStockBullInUse,'Stock Bulls');
end;

procedure TMenuForm.pmiPurchaseStockBullClick(Sender: TObject);
begin
   actPurchase.Execute;
end;

procedure TMenuForm.cxAnimalGridViewPrintTotalAmountCount(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
   if ( WinData.AnimalFileByID <> nil ) and ( WinData.AnimalFileByID.Active ) and ( WinData.AnimalFileByID.RecordCount > 0 ) then
      AText := IntToStr(WinData.AnimalFileByID.RecordCount);
end;

procedure TMenuForm.cxAnimalGridViewPrintAvgPricePerKg(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
   AText := '';
   if ( WinData.AnimalFileByID <> nil ) and ( WinData.AnimalFileByID.Active ) and ( WinData.AnimalFileByID.RecordCount > 0 ) then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AVG(S.Price), AVG(S.ColdDeadWt)');
            SQL.Add('FROM SalesDeaths S');
            SQL.Add('WHERE ((S.Price > 0) AND (S.ColdDeadWt > 0))');
            SQL.Add('AND S.EventId IN (SELECT ID');
            SQL.Add('                  FROM Events');
            SQL.Add('                  WHERE EventType = 11');
            SQL.Add('                  AND AnimalID IN (SELECT AID FROM AFilters))');
            try
               Open;
               if ( RecordCount > 0 ) then
                  begin
                     if ( Fields[0].AsFloat > 0 ) and ( Fields[1].AsFloat > 0 ) then
                        AText := FormatFloat('#.00',Fields[0].AsFloat/Fields[1].AsFloat);
                  end;
            except
               on e : Exception do
                  ShowDebugMessage(e.Message);
            end;
         finally
            Free;
         end;
end;

procedure TMenuForm.cxAnimalGridViewPrintSummaryText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
   if ( AText = '0.00' ) then
      AText := '';
end;

procedure TMenuForm.cxAnimalGridViewPrintAvgSalePrice(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
   AText := '';
   if ( WinData.AnimalFileByID <> nil ) and ( WinData.AnimalFileByID.Active ) and ( WinData.AnimalFileByID.RecordCount > 0 ) then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AVG(S.Price)');
            SQL.Add('FROM SalesDeaths S');
            SQL.Add('WHERE S.Price > 0');
            SQL.Add('AND S.EventId IN (SELECT ID');
            SQL.Add('                  FROM Events');
            SQL.Add('                  WHERE EventType = 11');
            SQL.Add('                  AND AnimalID IN (SELECT AID FROM AFilters))');
            try
               Open;
               if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
                  AText := FormatFloat('0.00',Fields[0].AsFloat);
            except
               on e : Exception do
                  ShowDebugMessage(e.Message);
            end;
         finally
            Free;
         end;
end;

procedure TMenuForm.cxAnimalGridViewPrintColdDeadWt(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
   AText := '';
   if ( WinData.AnimalFileByID <> nil ) and ( WinData.AnimalFileByID.Active ) and ( WinData.AnimalFileByID.RecordCount > 0 ) then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AVG(S.ColdDeadWt)');
            SQL.Add('FROM SalesDeaths S');
            SQL.Add('WHERE S.ColdDeadWt > 0');
            SQL.Add('AND S.EventId IN (SELECT ID');
            SQL.Add('                  FROM Events');
            SQL.Add('                  WHERE EventType = 11');
            SQL.Add('                  AND AnimalID IN (SELECT AID FROM AFilters))');
            try
               Open;
               if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
                  AText := FormatFloat('0.00',Fields[0].AsFloat);
            except
               on e : Exception do
                  ShowDebugMessage(e.Message);
            end;
         finally
            Free;
         end;
end;

procedure TMenuForm.cxAnimalGridViewPrintAvgPurchWeight(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
   AText := '';
   if ( WinData.AnimalFileByID <> nil ) and ( WinData.AnimalFileByID.Active ) and ( WinData.AnimalFileByID.RecordCount > 0 ) then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AVG(P.Weight)');
            SQL.Add('FROM Purchases P');
            SQL.Add('WHERE P.Weight > 0');
            SQL.Add('AND P.EventId IN (SELECT ID');
            SQL.Add('                  FROM Events');
            SQL.Add('                  WHERE EventType = 12');
            SQL.Add('                  AND AnimalID IN (SELECT AID FROM AFilters))');
            try
               Open;
               if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
                  AText := FormatFloat('0.00',Fields[0].AsFloat);
            except
               on e : Exception do
                  ShowDebugMessage(e.Message);
            end;
         finally
            Free;
         end;
end;

procedure TMenuForm.cxAnimalGridViewPrintAvgPurchPrice(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
   AText := '';
   if ( WinData.AnimalFileByID <> nil ) and ( WinData.AnimalFileByID.Active ) and ( WinData.AnimalFileByID.RecordCount > 0 ) then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AVG(P.Price)');
            SQL.Add('FROM Purchases P');
            SQL.Add('WHERE P.Price > 0');
            SQL.Add('AND P.EventId IN (SELECT ID');
            SQL.Add('                  FROM Events');
            SQL.Add('                  WHERE EventType = 12');
            SQL.Add('                  AND AnimalID IN (SELECT AID FROM AFilters))');
            try
               Open;
               if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
                  AText := FormatFloat('0.00',Fields[0].AsFloat);
            except
               on e : Exception do
                  ShowDebugMessage(e.Message);
            end;
         finally
            Free;
         end;
end;

procedure TMenuForm.cxAnimalGridViewPrintAvgDaysOnFarm(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
   dEntryDate,
   dDateOfBirth,
   dPurchDate,
   dSaleDate : TDateTime;
   iAnimalCount,
   iTotDaysOnFarm,
   iDaysBetween : Integer;
begin
   AText := '';
   if ( WinData.AnimalFileByID <> nil ) and ( WinData.AnimalFileByID.Active ) and ( WinData.AnimalFileByID.RecordCount > 0 ) then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AF.AId, A.DateOfBirth ,PE.EventDate PurchDate, SE.EventDate SaleDate');
            SQL.Add('FROM AFilters AF');
            SQL.Add('LEFT JOIN Events PE ON ((PE.AnimalId = AF.AId) AND (PE.EventType = 12))');
            SQL.Add('LEFT JOIN Events SE ON ((SE.AnimalId = AF.AId) AND (SE.EventType = 11))');
            SQL.Add('INNER JOIN Animals A ON (A.Id = AF.AId)');
            try
               Open;
               First;
               iAnimalCount := 0;
               iTotDaysOnFarm := 0;
               while ( not(Eof) ) do
                  begin
                     dEntryDate := 0;
                     dDateOfBirth := 0;
                     dPurchDate := 0;
                     dSaleDate := 0;
                     dDateOfBirth := FieldByName('DateOfBirth').AsDateTime;
                     dPurchDate := FieldByName('PurchDate').AsDateTime;
                     dSaleDate := FieldByName('SaleDate').AsDateTime;
                     if ( dPurchDate > 0 ) then
                        dEntryDate := dPurchDate
                     else
                        dEntryDate := dDateOfBirth;
                     if ( dSaleDate > 0 ) and ( dSaleDate > dEntryDate ) then
                        iTotDaysOnFarm := iTotDaysOnFarm + Trunc(dSaleDate - dEntryDate)
                     else if ( dSaleDate = 0 ) and ( Date > dEntryDate ) then
                        iTotDaysOnFarm := iTotDaysOnFarm + Trunc(Date - dEntryDate);
                     Inc(iAnimalCount);
                     Next;
                  end;
               if ( iTotDaysOnFarm > 0 ) and ( iAnimalCount > 0 ) then
                  AText := FormatFloat('0',(iTotDaysOnFarm/iAnimalCount));
            except
               on e : Exception do
                  ShowDebugMessage(e.Message);
            end;
         finally
            Free;
         end;
end;

procedure TMenuForm.cxAnimalGridViewPrintAvgGrossMargin(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
var
   fAvgPurchPrice,
   fAvgSalePrice : Double;
begin
   AText := '';
   if ( WinData.AnimalFileByID <> nil ) and ( WinData.AnimalFileByID.Active ) and ( WinData.AnimalFileByID.RecordCount > 0 ) then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT AVG(S.Price)');
            SQL.Add('FROM SalesDeaths S');
            SQL.Add('WHERE S.Price > 0');
            SQL.Add('AND S.EventId IN (SELECT ID');
            SQL.Add('                  FROM Events');
            SQL.Add('                  WHERE EventType = 11');
            SQL.Add('                  AND AnimalID IN (SELECT AID FROM AFilters))');
            try
               Open;
               if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
                  fAvgSalePrice := Fields[0].AsFloat;
               Close;
               SQL.Clear;
               SQL.Add('SELECT AVG(P.Price)');
               SQL.Add('FROM Purchases P');
               SQL.Add('WHERE P.Price > 0');
               SQL.Add('AND P.EventId IN (SELECT ID');
               SQL.Add('                  FROM Events');
               SQL.Add('                  WHERE EventType = 12');
               SQL.Add('                  AND AnimalID IN (SELECT AID FROM AFilters))');
               Open;
               if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
                  fAvgPurchPrice := Fields[0].AsFloat;
               if ( fAvgSalePrice > 0 ) and ( fAvgPurchPrice > 0 ) then
                  AText := FormatFloat('0.00',(fAvgSalePrice - fAvgPurchPrice));
            except
               on e : Exception do
                  ShowDebugMessage(e.Message);
            end;
         finally
            Free;
         end;
end;

initialization
  WM_KINGSWOOD_AIMCLIENT_CLOSED := RegisterWindowMessage('WM_KINGSWOOD_AIMCLIENT_CLOSED');
  WM_KINGSWOOD_AIMCLIENT_ANIMALREGISTERED := RegisterWindowMessage('WM_KINGSWOOD_AIMCLIENT_ANIMALREGISTERED');
  WM_KINGSWOOD_AIMCLIENT_PROCESSDISASSOCIATEDTRANSACTIONS := RegisterWindowMessage('WM_KINGSWOOD_AIMCLIENT_PROCESSDISASSOCIATEDTRANSACTIONS');
  WM_KINGSWOOD_AIMCLIENT_PROCESSMOVEMENTSON := RegisterWindowMessage('WM_KINGSWOOD_AIMCLIENT_PROCESSMOVEMENTSON');
  WM_KINGSWOOD_AIMCLIENT_PROCESSMOVEMENTSOFF := RegisterWindowMessage('WM_KINGSWOOD_AIMCLIENT_PROCESSMOVEMENTSOFF');
  WM_KINGSWOOD_AIMCLIENT_RECONCILEHERD := RegisterWindowMessage('WM_KINGSWOOD_AIMCLIENT_RECONCILEHERD');
  WM_KINGSWOOD_AIMCLIENT_PROCESS_PROCESSNEWCUSTOMER := RegisterWindowMessage('WM_KINGSWOOD_AIMCLIENT_PROCESS_PROCESSNEWCUSTOMER');

  WM_KINGSWOOD_FARMSYNC_COMPLETED := RegisterWindowMessage('WM_KINGSWOOD_FARMSYNC_COMPLETED');
  WM_KINGSWOOD_FARMSYNC_SETTINGSCHANGED := RegisterWindowMessage('WM_KINGSWOOD_FARMSYNC_SETTINGSCHANGED');
  WM_KINGSWOOD_FARMSYNC_OPTIONSCHANGED := RegisterWindowMessage('WM_KINGSWOOD_FARMSYNC_OPTIONSCHANGED');
  WM_KINGSWOOD_FARMSYNC_ERRORINSYNCPROCESS := RegisterWindowMessage('WM_KINGSWOOD_FARMSYNC_ERRORINSYNCPROCESS');
  WM_KINGSWOOD_FARMSYNC_LOGINFAILED := RegisterWindowMessage('WM_KINGSWOOD_FARMSYNC_LOGINFAILED');

  WM_KINGSWOOD_FARMSYNC_UPDATEREQUIRED := RegisterWindowMessage('WM_KINGSWOOD_FARMSYNC_UPDATEREQUIRED');
  WM_KINGSWOOD_FARMSYNC_MARKASSYNCHRONIZED := RegisterWindowMessage('WM_KINGSWOOD_FARMSYNC_MARKASSYNCHRONIZED');
  WM_KINGSWOOD_INVALID_SYSTEM_DATE_FORMAT := RegisterWindowMessage('WM_KINGSWOOD_INVALID_SYSTEM_DATE_FORMAT');
  WM_KINGSWOOD_FARMSYNC_PROCESS_EVENTS := RegisterWindowMessage('WM_KINGSWOOD_FARMSYNC_PROCESS_EVENTS');
  WM_KINGSWOOD_FARMSYNC_ADJUST_MAX_ACTIVE_BULL_COUNT := RegisterWindowMessage('WM_KINGSWOOD_FARMSYNC_ADJUST_MAX_ACTIVE_BULL_COUNT');

  WM_KINGSWOOD_SHOW_MAX_ACTIVE_BULL_SCR := RegisterWindowMessage('WM_KINGSWOOD_SHOW_MAX_ACTIVE_BULL_SCR');

  { Tell Delphi to hide it's hidden application window for now to avoid }
  { a "fsplash" on the taskbar if we halt due to another instance }
  ShowWindow(Application.Handle, SW_HIDE);

end.
