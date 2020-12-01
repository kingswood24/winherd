{

  16/02/2009 [Dev V3.9 6.1] /SP Program Change - Addition of Breed (VO Vosgienne)

}
unit GenTypesConst;


{
  ------------------------------------------------------------------------

  SP 15/11/2002:-

  Set new constants for phone link.

  SP 15/11/2002.

  ------------------------------------------------------------------------

  SP 09/12/2002:-

  tICBFBreeds modified to include changes from the Bandon.

  SP 09/12/2002:-

}

interface
uses
    SysUtils, Messages, Graphics, Windows, FileCtrl;

const
  HerdVerNo = 'KHM V4.0 R4.5';
  iHerdVerNo = 4045;   //  17/08/10 [V4.0 R4.5] /MK Bug Fix - MenuUnit - Check for AIBullListUpdate where HerdType <> Beef and Country is Ireland.
                       //  18/08/10 [V4.0 R4.5] /MK Bug Fix - CowRepFlt - ScaleDown - SQL To Filter Out Sales and Purchases did not work properly.

//  iHerdVerNo = 4044; //  17/08/10 [V4.0 R4.4] /MK - DairyData - TempCalvingAfterScroll was not set to look at DefaultNatIDMask where DefCountry <> Ireland.

//  iHerdVerNo = 4043; // MK -  Milk Recording - Change for UK to take out UK and spaces from Tag on Milk File when matching Tag Number.
                       // MK - CIS Export File - Export UKAISireCode From Animals Where UKAISireCode is <> ''.

//  iHerdVerNo = 4042; // Animal Welfare Scheme: re-introduction of the check for the no. of permissible weanings.

//  iHerdVerNo = 4041; // Calvings - Allow Dead Calf to be entered without valid tag. Default Tag to ABOR + DamNatIDNo + Month + Year.
                       // ICBF Export - Allow Invalid Tag to be registered from DeadCalf Tag but remove Tag and Sex from File Export.
                       // Milk Recording - Allow CIS Milk Recording to be Matched by Tag Number - UK Only (Not Ireland or NIreland).
                       // Main Menu - Days On Farm now looking at SaleDate.

//  iHerdVerNo = 4040; // Service - Changed qBullUsed to show only bulls that have an AnimalNo.
                       // Allowed import of Gallagher Electronic Weighings File.

//  iHerdVerNo = 4039; // Allow manual entry of bulk tank readings, new cxgrids imployed.
                       // Import ElectronicID from PDAEvents purchases, calvings.

//  iHerdVerNo = 4038; // Change in Quota Planner - annual Bfat % from 0.18 to 0.09

//  iHerdVerNo = 4037; // Enabled sending of Mart/Remittance email request by hotmail/gmail.

//  iHerdVerNo = 4036; // fix in weighingflt.pas - Inner join moved to after left joins.
                       // moorepark update, supplier and customer field length increased.

//  iHerdVerNo = 4034; // fix in weighingflt.pas - Inner join moved to after left joins.

//  iHerdVerNo = 4031; // Remove natidno formatting in BCMS reconciliation. - Alan Ramsey scottish customer.
                       // 18/03/10 - Remove duplicate group movements from the PDAevents table. These duplicates arose when Windows CE / Hotsync crashed during hotsync operation.
                       // 11/03/10 - Facilitator role enabled.

//  iHerdVerNo = 4030; // 11/03/10 - Update to Getting Started screen allowing user to setup a hotmail address and link to email settings screen.  }

//  iHerdVerNo = 4028; // 26/02/10 - CTS Movements/Births , auto remove Nat Id. No. formatting for all tags. / Mart Import/Export Limit SourceName to length 30, max length of name field in SupplierBreeds/Customers

//  iHerdVerNo = 4027; // 17/02/10 - New xml support for Movements In/Out adding breeding/health/dam&sire/milk lactations
                       //           to import/export, also added new Select All button to Multiple animal events

// iHerdVerNo = 4026;  // 04/02/10 - Fixed bug in determining the KingswdDBName

//  iHerdVerNo = 4025; // 28/1/10 - Tidy up of Preferences,
                       // 01/2/10   Exclude blank lines from Movements In file,
                       // 04/2/10   Killout Perc worked out for heinz eggert -
                       //          he was not happy hhow program calcs Killouts
                       //          based on Christy Wastson Killout matrix

//  iHerdVerNo = 4024; // 25/1/10 - CTS Field incorporated into EventRecording.TSaleDeath Event, Remove auto calc of Dead Weigth from Sale event.}

//  iHerdVerNo = 4023; // 18/1/10 - Auto Complete PDA Calvings, Register Dead Calf with Bandon, Updated NI Breed Table 'VOS',  Mullnahone Co-op Tel No. changes.


  KingswoodEmailAddress = 'info@kingswood.ie';
  TGMEmailAddress = 'george@tgmcs.com';


  c_WSOnlineBackupPassKey = 'ZvxM0TZRU/W5bwj4dWJPaHwPyW1zKBB9FmIiOHZtkRgRVsh89a3aIvlwz/ve2am2SIb6zVHdNCh+3w==';

  {c_WSOnlineBackupPassKey = 'ZvxM0TZRU/W5bwj4dWJPaHwPyW1zKBB9FmIiOHZtkRgRVsh89a3aIvlwz/ve2am2SIb6zVHdNCh+3w==' // Backup}
  cGmailAddress = 'www.gmail.com';
  cHotmailAddress = 'www.hotmail.com';

  { MooorePark File Version No.}
  MooreParkVerNo = 'MP1.0';

  { Set Up constants to control the Events - Used to set EventType }
  cFeedingEvent     = 0; 
  CBullingEvent     = 1;
  CServiceEvent     = 2;
  CPregDiagEvent    = 3;
  CDryOffEvent      = 4;
  CCalvingEvent     = 5;
  CHealthEvent      = 6;
  CWeightEvent      = 7;
  CPremium10Event   = 8;
  CPremium22Event   = 9;
  CPremiumBullEvent = 10;
  CSaleDeathEvent   = 11;
  CPurchaseEvent    = 12;
  CMovementEvent    = 13;
  CInterHerdEvent   = 14;
  CStockBullEvent   = 15;
  CNewIDEvent       = 16;
  // Suckler Substitution Event Implemented 14/12/2002. NOT IN USE YET!!!.
  CSucklerSubEvent  = 17;

  { *****MoorePark***** }
  CAbortionEvent    = 18;
  CCastrateEvent    = 19;
  CCondScoreEvent   = 20;
  CDiagProblemEvent = 21;
  CEmbryoTransEvent = 22;
  CMastitisEvent    = 23;
  CToBeCulledEvent  = 24;
  CWeaningEvent     = 25;
  CIntExamEvent     = 26;
  CStockBullIn      = 27;
  CStockBullOut     = 28;
  CChangeOfGroup    = 29;
  CHistoricPregDiag = 30;
  { ***End MoorePark*** }

  CDisbuddingEvent  = 31;
  CMealFeedingEvent = 32;
  CDisbuddingNAEvent = 33;
  CCastrationNAEvent = 34;

  cStrHeatBulling = 'Heat/Bulling';
  cStrService = 'Service';
  cStrPregDiagnosis = 'Scan/PD';
  cStrDryOff = 'Dry Off';
  cStrCalving = 'Calving';
  cStrVetTreatment = 'Vet. Treatment';
  cStrWeighing = 'Weighing';
  cStrDisbudding = 'Disbudding';
  cStrMealFeeding = 'Meal Feeding';
  cStrDisbuddingNA = 'Disbudding N/A';
  cStrCastrationNA = 'Castration N/A';
  cStrWeaning = 'Weaning';
  cStrCastration = 'Castration';
  cStrPurchase = 'Purchase';

  cReviewAnimalWelfareEvents = 'Review Animal Welfare Events';





  { Set Up constants to control the Farm Diary Events - Used to set DiaryEventType }
  cSoilTest         = 1;
  cFertApplic       = 2;
  cSilageHarvest    = 3;
  cSlurryApplic     = 4;
  cReSeeding        = 5;
  cTopping          = 6;
  cSpraying         = 7;
  cPaddockRotation  = 8;

  { Set Up constants to control the General Listings }
  LServiceType  = 1;
  LServedBy     = 2;
  LPDType       = 4;
  LPDBy         = 5;
  LBirthType    = 6;
  LCalfType     = 7;
  LHerdType     = 8;
  LAnimalColour = 9;
  LObservedBy   = 10;
  LHeatType     = 11;
  LApplicMethod = 12;
  LHealthCode   = 13;
  LCulledCode   = 14;
  LMortality    = 15;
  LFeedCategory = 16;
  { ///// }
  LEmbryoType   = 17;
  LIntExamRes   = 18; // Exam Result
  LIntExamRea   = 19; // Exam Reason
  LIntExamMet   = 20; // Exam Method

  LICBFHealthCode = 21;
  LNIDisposalManner = 22; // NI Deaths Registration. Used to determine disposl manner.

  LHealthReportDesc = 23; 

  LSpecies = 24;
  LMedicineGroup = 25;
  

  // MoorePark

  { Phone Link / Create Events Constants }
  { TEventFileSource = (esNoLink, esNokiaLink, esSiemensLink, esParlourLink ); }
  plNOLINK  = 0;
  plNOKIA   = 1;
  plSIEMENS = 2;
  plPARLOURLINK = 3;
  { Phone Link Constants }

  { Event Source Constants }
  sINTERNAL    = 0;
  sPHONELINK   = 1;
  sPARLOURLINK = 2;
  sICBFSETUP   = 3;
  sEXTERNAL    = 4;
  sPDA         = 5;
  sMART        = 6;
  sKINGSWOOD   = 7;
  { Event Source Constants }

  cMaxCalves    = 4;

  cLUSCows    = 1.0;
  cLUSSuckler = 1.0;
  cLUSUnder24 = 0.6;
  cLUSOver24  = 1.0;
  cLUS10      = 0.6;
  cLUSEwes    = 0.15;
  cBullOver24 = 1.0; // SP  14/02/01

  { Paradox table level }
  MaxParadoxTableLevel = 7;

  // Grps GroupTypes constants
  cPurchaseGroup = 'Purchase';
  cSalesGroup    = 'Sales';
  cGroupGroup    = 'Group';
  cPenGroup      = 'Pen';
  cFeedGroup     = 'Feed';

  // DEfault Units for Farm Diary
  cMetric       = 'Metric';
  cImperial     = 'Imperial';
  cConvertToAcres   = 2.471;
  cConvertFromAcres = 0.4047;
  cConvertToCWT     = 0.01968;
  cConvertFromCWT   = 50.80;
  cConvertToGallons = 0.2200;
  cConvertFromGallons = 4.546;

  // Euro Conversion Rate
  cEuro  = 0.787564;

  { Extensification Figures }
  MaxLUPH = '1.8';   // Maximum Livestock Units Per Hectare
  MinLUPH = '1.4';   // Minimum Livestock Units Per Hectare

  { Stocking Density }
  { StockDenLU = 1.9;  2002 }
  StockDenLU = 1.8;  { 2003 }

  { Premium Animal Claim Limit }
  MaxPremLimit = 180;

  { Max Number of Applications Per Herd }
  MaxNoApplicsPerHerd = 12;

  { NI Premium Applic Limitations}
  MaxBullApplicNI = 6;
  Max1stApplicNI  = 6;
  Max2ndApplicNI  = 18;

  cThisApplicationYear = 2004;

  { Suckler Premium Application Dates }
  SPOpeningDate = '02/01/2004';
  SPClosingDate = '30/06/2004';

  { SuckMilkQuotaLimit = '35470';  2002 Gallons }
  { SuckMilkQuotaLimit = '39594'; { 2003 Gallons}
  SuckMilkQuotaLimit = '200000'; { 43994 Gallons 2003 Changed to Litres }

  { Suckler Replacement const's }
  cIncCows = 0;
  cDecCows = 1;
  cIncHefs = 2;
  cDecHefs = 3;

  DefaultMinimumDaysOnFarm = 45;
  MinimumBrucellosisTestDays = 30;
  MaxDaysForDiseaseTestCheck = 28;

  { Premia Defaults }
  PremDefYear          = 2003;
  PremDefMonth10       = 150;
  PremDefMonth22       = 150;
  PremDefBull          = 210;
  PremDefSuckCowHeif   = 224.15;
  PremDefSuckHeifTopUp = 76;
  PremDefSlgth         = 80;
  PremDefSlgthTopUp    = 22.85;

  //Default Calf Weight 50KG
  cDefaultCalfWeight = 50;

  // Filenames for Darm Diary
  cFarms    = 'P1';
  cPlots    = 'P2';
  cFields   = 'P3';
  cAreaAids = 'P4';
  cPaddocks = 'P5';

  cPassword = 'CONFIG';
  cCRLF = #13#10;
  cCRLFx2 = #13#10+#13#10;

  WinAccsPath = 'C:\KingsAcc\Winaccs.exe'; // SP 16/09/02
  WinAccsFolder = 'C:\Kingsacc\';

  ParlourFilePath = 'parlour\Parlourevents.txt';
  cPhoneEventsIniFile = 'phoneevents.ini';
  cIniDirectory = 'Ini';

  {$IFDEF VER_PLATFORM_WIN32_NT}
  HerdUpdate = 'C:\Kingswood Herd Management\HerdUpdate.exe';
  {$ELSE}
  HerdUpdate = 'HerdUpdate.exe';
  {$ENDIF}

  MASTER_PASSWORD = 'copper';

  NullTerminator = #0;

  // Hints for the Main Grid
  cAnimalHint  = 'Click a header to sort the grid:' + #13 +
                 'eg. to sort by Animal Number, click on the "Number" Heading' + #13 +
                 '------------------------------------------------------------------------------------------------' + #13 +
                 'DOUBLE Click To View / Amend Details.';
  cPaddockHint = 'Click a header to sort the grid:' + #13 +
                 'eg. to sort by Paddock Name, click on the "Name" Heading' + #13 +
                 '------------------------------------------------------------------------------------------------' + #13 +
                 'DOUBLE Click To View / Amend Details.';


  iBreedCodes
               : array [0..115] of string = ('AA', 'AAX', 'AN', 'ANX', 'AU', 'AUX', 'AY', 'AYX', 'BB', 'BBX',
                                            'BI', 'BIX', 'BA', 'BAX', 'BS', 'BSX', 'CH', 'CHX', 'CI', 'CIX',
                                            'RD', 'RDX', 'DX', 'DXX', 'GA', 'GAX', 'GU', 'GUX', 'HE', 'HEX',
                                            'FR', 'FRX', 'HI', 'HIX', 'IM', 'IMX', 'JE', 'JEX', 'KE', 'KEX',
                                            'LM', 'LMX', 'MA', 'MAX', 'MO', 'MOX', 'GS', 'GSX', 'MY', 'MYX',
                                            'NO', 'NOX', 'NR', 'NRX', 'PT', 'PTX', 'PI', 'PIX', 'RM', 'RMX',
                                            'RB', 'RBX', 'SA', 'SAX', 'SH', 'SHX', 'SI', 'SIX', 'SD', 'SDX',
                                            'SR', 'SRX', 'WB', 'WBX', 'WP', 'WPX', 'BW', 'BWX', 'GL', 'GLX',
                                            'LH', 'LHX', 'LR', 'LRX', 'LU', 'LUX', 'SL', 'SLX', 'RP', 'RPX',
                                            'ST', 'STX', 'BL', 'BLX', 'CL', 'CLX', 'DE', 'DEX', 'GC', 'GCX',
                                            'SU', 'SUX', 'VA', 'VAX', 'TY', 'TYX', 'CB', 'CBX', 'GV', 'GVX',
                                            'PZ', 'PZX', 'BF', 'BFX', 'VO', 'VOX' );

  iBreedNames  : array [0..115] of string = ('Angus', 'Angus Cross', 'Angler', 'Angler Cross', 'Aubrac', 'Aubrac Cross',
                                            'Ayrshire', 'Ayrshire Cross', 'Belgian Blue', 'Belgian Blue Cross', 'Bison',
                                            'Bison Cross', 'Blonde d''Aquitaine', 'Blonde d''Aquitaine Cross', 'Brown Swiss',
                                            'Brown Swiss Cross', 'Charolais', 'Charolais Cross', 'Chianina', 'Chianina Cross',
                                            'Danish Red', 'Danish Red Cross', 'Dexter', 'Dexter Cross', 'Galloway', 'Galloway Cross',
                                            'Guernsey', 'Guernsey Cross', 'Hereford', 'Hereford Cross','Holstein-Friesian',
                                            'Holstein-Friesian Cross', 'Highland', 'Highland Cross', 'Irish Maol/Droimeann','Irish Maol Cross',
                                            'Jersey', 'Jersey Cross', 'Kerry', 'Kerry Cross', 'Limousin', 'Limousin Cross', 'Maine Anjou',
                                            'Maine Anjou Cross', 'Montbeliarde', 'Montbeliarde Cross', 'Murray Grey', 'Murray Grey Cross',
                                            'MRI/MRY', 'MRI/MRY Cross', 'Normande', 'Normande Cross', 'Norwegian Red', 'Norwegian Red Cross',
                                            'Parthenaise', 'Parthenaise Cross', 'Piedmontaise', 'Piedmontaise Cross', 'Rogmanola', 'Rogmanola Cross',
                                            'Rotbunde', 'Rotbunde Cross', 'Salers', 'Salers Cross', 'Shorthorn', 'Shorthorn Cross', 'Simmental',
                                            'Simmental Cross', 'South Devon', 'South Devon Cross', 'Swedish Red', 'Swedish Red Cross',
                                            'Welsh Black','Welsh Black Cross','White Park','White Park Cross',
                                            'British White','British White Cross','Gloucester','Gloucester Cross',
                                            'Longhorn','Longhorn Cross','Lincoln Red','Lincoln Red Cross',
                                            'Luing','Luing Cross','Shetland','Shetland Cross','Red Poll','Red Poll Cross',
                                            'Stabiliser','Stabiliser Cross','Blue Albion','Blue Albion Cross',
                                            'Chillingham','Chillingham Cross','Devon','Devon Cross','Gasconne','Gasconne Cross',
                                            'Sussex','Sussex Cross','Vaynol','Vaynol Cross','Tyrone Black','Tyrone Black Cross',
                                            'Canadian Black','Canadian Black Cross','Gelbvieh','Gelbvieh Cross',
                                            'Pinzgauer','Pinzgauer Cross','Water Buffalo','Water Buffalo Cross', 'Vosgienne', 'Vosgienne Cross');

   iNIValidColourCodes : array [0..11] of string = ('B', 'BL', 'BLW', 'BR', 'BW', 'DW', 'R', 'RN', 'RW', 'W', 'XX', 'D');


  HealthCodeArray : Array [0..57] of String =
  ('DS', 'GS', 'MF', 'CA', 'CO', 'LM', 'PI', 'AB', 'SB', 'SC', // CA = castration
   'PN', 'LW', 'JL', 'RW', 'DC', 'RP', 'EN', 'ME', 'PY', 'AN',
   'FC', 'LC', 'MF', 'DN', 'GT', 'KE', 'FL', 'LD', 'RD', 'BL',
   'AC', 'CL', 'MA', 'EC', 'CT', 'SM', 'LA', 'MR', 'FF', 'SH',
   'UL', 'DR', 'WL', 'DB', 'ML', 'WN', 'D1', 'D2', 'D3', 'D4',
   'D5', 'Q1', 'Q2', 'Q3', 'Q4', 'Q5', 'ND', 'NC' ); // DB = Disbudding, ML = Meal Feeding, WN Weaning, D1-5 Weaning-Docility, Q1-5 Weaning-Quality / 'ND' Disbudding not applicable, 'NC' castration not applicable




  CullingCodeArray : Array [0..16] of String =
  ('AB','AG','BE','VD','CO','EB','HP','SC','IF','IJ',
   'IP','JD','LA','LM','MA','SR','ZZ');

  iMarts : array [0..1] of string = ('Carnaross Mart','Clare Marts');


      cSaveDefaultsMessage = 'Save defaults?'+#13#10+#13#10+
                          'Click Yes to SAVE NEW defaults.'+#13#10+#13#10+
                          'Click No to STOP USING defaults.'+#13#10+#13#10+
                          'Click Cancel to return to screen WITHOUT ACTION';

   OpenCloseTableCount = 39;

   AliasName = 'Kingswd';
   Reg_DefaultPath = 'Software\Kingswood\Herd\';
   Reg_DefaultHerdID = '.DEFAULT\Software\Kingswood\HERD\DefaultHerdID'; // If changed, need to reflect changes in Paddocks pGenTypesConst.pas
   Reg_FieldsReps = 'Software\Kingswood\Paddocks'; // If changed, need to reflect changes in Paddocks pGenTypesConst.pas
   Reg_ExitProgTimer = '.DEFAULT\Software\Kingswood\HERD\ExitProgTime';
   Reg_DLLActiveXReg = '.DEFAULT\Software\Kingswood\HERD\DLLActiveXReg'; // If changed, need to reflect changes in Paddocks pGenTypesConst.pas
   Reg_ICBFMatchField = '.DEFAULT\Software\Kingswood\HERD\ICBFMatchField';

   Reg_BeefGrpPurchIdent = 'BeefGrpPurch';
   Reg_UseCrushFileIdent = 'UseCrushFile';
   Reg_BeefGrpSalesIdent = 'BeefGrpSales';

   xPixels = 800;  // All forms designed on this Screen size
   yPixels = 600;

   AllHerds = 0; // Zero represents the value of Herd drop downs, when All Herds is selected

   { PhoneLink Stored Directory }
   cPhoneLinkDirectory = 'PhoneLink';
   { PhoneLink Ini File }
   cPhoneLinkIniFile = 'phonelink.ini';
   { Phone ActiveX File }
   cPhoneLinkActiveXPath = 'C:\Windows\MobileControl_rt.ocx';
   { Phone Licence File}
   cPhoneLinkLicencePath = 'C:\Windows\MobileControl_rt.lic';

   IniNokia = 'Nokia';
   IniNokiaConnectionType = 'Connection Type';
   IniComPort = 'COM Port';
   IniSiemens = 'Siemens';

   { Nokia Data Connection Types }
   Nokia_DAU9P = 0;
   Nokia_DLR3  = 1;
   Nokia_InfraRed = 2;

   sNokia_DAU9P = 'Connection Type: DAU-9P';
   sNokia_DLR3  = 'Connection Type: DLR-3';
   sNokia_InfraRed = 'Connection Type: InfraRed';

   { Default Gestation Period (days) }
   cGestationPeriod = 283;

   sSettingsFile = 'settings.def';
   SettingsFileVersion = 10;

   PDAImportDir = 'C:\Kingswood Herd Management\PDA Import Files\';


   AlphaNumSet = ['A'..'Z', 'a'..'z', '0'..'9'];
   iCharSearchSet = ['A'..'Z', 'a'..'z', '0'..'9', '''', '(', ')', '.',',', '>','<','{','}', ' ' ];
   { NATID MASK INDEX }
   MT_NEWPLASTIC = 0;
   MT_OLDPLASTIC = 1;
   MT_BRASSTAG   = 2;
   MT_NITAG      = 3;
   MT_UKTAG      = 4;
   MT_FREEFORMAT = 5;
   { NATID MASK INDEX }

  { Internal Messages }
  WM_plActivate = WM_USER + 1;
  WM_plDeActivate = WM_USER + 2;
  WM_MainDisplayBreedCode = WM_USER + 3;
  WM_MainHideBreedCode = WM_USER + 4;
  WM_BladeRegistered = WM_USER + 5;
  WM_BladeNotRegistered = WM_USER + 6;
  WM_Locate = wm_user + 7;
  WM_RaiseAnimalNotFound = wm_user + 8;
  WM_UpdateMartImportScreen = WM_USER + 9;
  WM_ShowReportsScreen = WM_USER + 10;
  WM_ShowSucklerCowEvents = WM_USER + 11;
  WM_RefreshGridViewExternalData = WM_USER + 12;
  WM_ReadBarcodeOuput = WM_USER + 13;


     { Used in conjuction with Windata.Images }
  cBtnImgExit     = 0;
  cBtnImgPrint    = 1;
  cBtnImgPreview  = 2;
  cBtnImgLoad     = 3;
  cBtnImgRecord   = 4;
  cBtnImgPrint2   = 5;
  cBtnImgSave     = 6;
  cBtnImgCancel   = 7;
  cBtnImgUpdate   = 8;
  cBtnImgFloppy   = 9;
  cBtnImgViewAnimal = 10;
  cBtnImgFloppy2  = 11;
  cBtnImgEdit     = 12;
  cBtnImgAdd      = 13;
  cBtnImgHelp     = 14;
  cBtnImgCDROM    = 15;
  cBtnImgFormat   = 16;
  cBtnImgDefault  = 17;
  cBtnImgOptions  = 18;
  cBtnImgExecute  = 19;
  cBtnImgMail     = 20;
  cBtnImgExternalDevice = 21;
  cBtnImgLargeHelp = 22;
  cBtnImgDelete = 23;

  cErrorContact = 'If problem persists contact Kingswood';
  cFormCreateError = 'Unable to create form, close program and reboot';
  cReportErrorMsgStr = 'Unable to create report, close program and reboot.'+#13+cErrorContact;
  cAllHerdsSelected = '''All Herds'' is currently selected, please select your herd';
  cErrorContact_2 = 'An error has occurred contact Kingswood';

  cInvalid_NatIdNo = 'An invalid "Nat. Id. No." value has been entered.';

  cDairyHerd = 'DAIRY';
  cSucklerHerd = 'SUCKLER';
  cBeefHerd = 'BEEF';

  cIDField = 'ID';

  cMAXSDTarget = 1.7999;
  cMINSDTarget = 1.3999;

  cSQL_SELECTALL = 'SELECT * FROM ';

  cGridColLayoutFile = 'gridcols.ini';

  cEventLactFilterStr = 'AnimalID = %d and AnimalLactNo = %d and EventType = %d ';
  cEventFilterStr = 'AnimalID = %d and EventType = %d ';

  { Northern Ireland Births/Deaths/Still Births Registration Consts }
  cRegFileDir = 'APHIS Registration';
  sDirCreateError = 'Cannot create directory %s';

  cRegTypeBirths = 0;
  cRegTypeDeaths = 1;
  cRegTypeStillBirth = 2;

  cRegType_Births = 'B';
  cRegType_Deaths = 'D';
  cRegType_StillBirths = 'S';

  { Tags used XML Generated files }
  cxml_FileNameTag = 'Filename';
  cxml_RegTypeTag = 'RegType';
  cxml_FileIdTag = 'FileId';
  cxml_NoOfAnimalsTag = 'NoOfAnimals';
  cxml_HerdNoTag = 'HerdNo';
  cxml_AnimalNoTag = 'AnimalNo';
  cmxl_DOBTag = 'DOB';
  cmxl_DamTag = 'DamNo';

  { Birth Rec XML Generated file }
  cxml_NewAnimalRegInfoTag = 'NewAnimalRegInfo';
  cxml_ColourTag = 'Colour';
  cmxl_SexTag = 'Sex';
  cmxl_BreedTag = 'Breed';

  { Death Rec XML Generated file }
  cxml_DeadAnimalInfoTag = 'DeadAnimalInfo';
  cxml_DateOfDeathTag = 'DateOfDeath';
  cxml_MannerDisposalTag = 'MannerDisposal';
  cxml_PlaceDisposalTag = 'PlaceDisposal';

  { StillBirth Rec XML Generated file }
  cxml_AnimalInfo = 'AnimalInfo';
  cxml_CommentTag = 'Comment';

  { **** END Northern Ireland Births/Deaths/Still Births Registration Consts }

  cDateFormat_IRE = 'dd/mm/yyyy';

  cSex_Female = 'Female';
  cSex_Bull = 'Bull';
  cSex_Steer = 'Steer';
  cSex_Male = 'Male';

     { File Parsing delimiter }
   cSpaceDelimiter = ' ';
   cCommaDelimiter = ',';

   { Event Codes }
   cServiceCode  = 'S';
   cBullingCode  = 'B';
   cHealthCode   = 'H';
   cDryOffCode   = 'D';
   cPregDiagCode = 'P';
   cCalvingCode  = 'C'; // 01/12/2004
   cSaleDeathsCode = 'M'; // 12/05/2005
   cWeighingCode = 'W'; // 12/05/2005

   { Palour Link ImportFile Path }
   cPLFilePath = 'C:\PalourF.dat';

   { Nokia Message Output File }
   cPLNokiaMsgFile = 'C:\Kingswood Herd Management\plmsgs';

   { CD Backup Program }
   cCDBackupExeName = 'CDBackup.exe';

   { Global Preference's Consts }
   cGSRegPathHerd = 'SOFTWARE\Kingswood\Herd\Preferences\';

   cGSAISireUpdateRegPath = 'SOFTWARE\Kingswood\Herd\AISireUpdate\';


   cGSPromptCalfReg = 'PromptCalfReg';
   cGSSaveAnotherEvent = 'SaveAnotherEvent';
   cGSPhoneLinkOnStartup = 'PhoneLinkOnStartup';
   cGSNewVersionReminder = 'NewVersionReminder';
   cGSBackupReminder = 'BackupReminder';
   cGSBackupTestFile = 'BackupTestFile';
   cGSBackupSpanDisks = 'BackupSpanDisks';
   cGSBackupArchiveFile = 'BackupArchiveFile';
   cGSHerdProtection = 'HerdProtection';
   cGSNatIDToAnimalNo = 'NatIDToAnimalNo';
   cGSBladeRegistered = 'BladeRegistered';
   cGSRenumberAnimalNo = 'RenumberAnimalNo';
   cGSMandatoryBreedingEvents = 'MandatoryBreedingEvents';
   cGSReNumFormat = 'ReNumFormat';
   cGSMandatoryDryOffEvent = 'MandatoryDryOffEvent';
   cGSBackupStoreRegFiles = 'BackupStoreRegFiles';
   cGSBackupStorePedigreeImages = 'BackupStorePedigreeImages';
   cGSUseBarcodeScanner = 'UseBarcodeScanner';
   cGSDefaultMaleSex = 'DefaultMaleSex';
   cGSDefaultHealthComment = 'DefaultHealthComment';
   cGSNationalIDAnimalNo = 'NatIDAnimalNo';
   cGSAllowDuplicateTagNos = 'AllowDuplicateTags';
   cGSDefaultExitAfterSale = 'DefaultExitAfterSale';
   cGSDefaultMaleBreedingStatus = 'DefaultMaleBreedingStatus';
   cGSWeighingEventChangeAnimalFocusAfterSave = 'WeighingEventChangeAnimalFocusAfterSave';
   cGSUseIEPrefixForNatIDSearch = 'UseIEPrefixForNatIDSearch';
   cGSDisplayGettingStarted = 'DisplayGettingStarted';
   cGSAnimalGridSireField = 'AnimalGridSireField';

   cGSBeefBullAttrNoMonthsFrom = 'BeefBullAttrNoMonthsFrom';
   cGSBeefBullAttrNoMonthsTo = 'BeefBullAttrNoMonthsTo';
   cGSBeefBullAttrNoMonthsOver = 'BeefBullAttrNoMonthsOver';
   cGSBeefBullAttrColourBetween = 'BeefBullAttrColour1';
   cGSBeefBullAttrBoldBetween = 'BeefBullAttrBold1';

   cGSBeefBullAttrColourOver = 'BeefBullAttrColour2';
   cGSBeefBullAttrBoldOver = 'BeefBullAttrBold2';

   cGSBeefFemaleAttrNoMonthsFrom = 'BeefFemaleAttrNoMonthsFrom';
   cGSBeefFemaleAttrNoMonthsTo = 'BeefFemaleAttrNoMonthsTo';
   cGSBeefFemaleAttrNoMonthsOver = 'BeefFemaleAttrNoMonthsOver';
   cGSBeefFemaleAttrColourBetween = 'BeefFemaleAttrColour1';
   cGSBeefFemaleAttrBoldBetween = 'BeefFemaleAttrBold1';

   cGSBeefFemaleAttrColourOver = 'BeefFemaleAttrColour2';
   cGSBeefFemaleAttrBoldOver = 'BeefFemaleAttrBold2';

   cGSSteerAttrNoMonthsFrom = 'SteerAttrNoMonthsFrom';
   cGSSteerAttrNoMonthsTo = 'SteerAttrNoMonthsTo';
   cGSSteerAttrNoMonthsOver = 'SteerAttrNoMonthsOver';

   cGSSteerAttrColourBetween = 'SteerAttrColour1';
   cGSSteerAttrBoldBetween = 'SteerAttrBold1';

   cGSSteerAttrColourOver = 'SteerAttrColour2';
   cGSSteerAttrBoldOver = 'SteerAttrBold2';

   cGSDisplayTBTestDateWarningBeforeSale = 'DisplayTBTestDateWarningBeforeSale';
   cGSDisplayBruceTestDateWarningBeforeSale = 'DisplayBruceTestDateWarningBeforeSale';
   cGSDisplayMinimumDaysOnFarmWarningBeforeSale = 'DisplayMinimumDaysOnFarmWarningBeforeSale';
   cGSMinimumDaysToBeKeptOnFarmBeforeSale = 'MinimumDaysToBeKeptOnFarmBeforeSale';
   cGSDisplayAnimalComments = 'DisplayAnimalComments';
   cGSAnimalWeighingGraphXAxisValue = 'AnimalWeighingGraphXAxisValue';
   cGSAnimalWeighingGraphXAxisVariable = 'AnimalWeighingGraphXAxisVariable';

   cGSDisplayMovementFeedColsInGridView = 'DisplayMovementFeedColsInGridView';
   cGSDownloadMailAttachments = 'DownloadGMailAttachments';

   cGSAnimalGridHideSearchBar = 'AnimalGridHideSearchBar';

   cReg_ReadError = 'Failed to get %s Registry Data';

   cDefaultHealthCommentDrugUsed = 0;
   cDefaultHealthCommentFarmCode = 1;

   cBarCodeScannerOnCaption = 'Scan: On';
   cBarCodeScannerOffCaption = 'Scan: Off';

   cSpecies_Bovine = 'Bovine';
   cSpecies_Horses = 'Horses';
   cSpecies_Goats  = 'Goats';

   cMachineryDir = 'C:\Machinery';
   cMachineryExePath = 'C:\Machinery\Machinery.exe';

   NewFeatureHighlightControlColour = clRed;

   HUKILinmackTestServerIPAdd = '195.153.22.94';
   HUKILiveServerIPAdd = '195.153.22.90';


   CalfReg_Status_Emailed = 1;
   CalfReg_Status_Posted = 2;
   CalfReg_Status_Removed = 3;



   cGoToFertTreatmentChart = 1000;
   cGoToTagReplacementsMainScr = 1001;
   cGoToTagReplacementsRptScr = 1002;


   CTSWSDLL = 'ctsws.dll';

   cCalvingTableUpdateFailure = 'Cannot Update Calve(s) information, contact Kingswood';
   cNoFilterApplied = 'There is currently no Active Filter ( Animal Grid Filter ) to apply!';

   cFileOverwrite = 'File already exists, do you want to overwrite?';
   cFileCreated = 'File succesfully created - "%s"';
   cFileCreateError = 'Error creating file.';

   cCalvingAnimalWarning = 'The animal you are calving "%s" is under %d months of age as of "%s".';
   cContinueWithCalving = 'Do you want to continue with calving?';



   cCalvingAnimalUnder9Mths = cCalvingAnimalWarning;
   cCalvingAnimalUnder12Mths = cCalvingAnimalWarning;
   cCalvingAnimalUnder18Mths = cCalvingAnimalWarning+cCRLFx2+cContinueWithCalving;
   cCalvingAnimalUnder22Mths = cCalvingAnimalWarning+cCRLFx2+
                               'No Suckler Cow payment will be made.'+cCRLFx2+cContinueWithCalving;
   cCalvingAnimalUnder24Mths = cCalvingAnimalWarning+cCRLFx2+
                            'This may affect the average calving age of your herd.'+cCRLFx2+cContinueWithCalving;


   cSireAddedToDB = 'Sire has been added to the database.';
   cSireAlreadyExists = 'Sire has already been added, do you want to update the sire details?';


   cINTERNET_CONNECTION_NOT_ESTABLISHED = 'An internet connection could not be established.';

   cUSDateStyle = 'mm/dd/yyyy';
   cIrishDateStyle = 'dd/mm/yyyy';

   SQL_SELECT = 'SELECT';
   SQL_FROM = 'FROM';
   SQL_WHERE = 'WHERE';
   SQL_ORDERBY = 'ORDER BY';
   SQL_UPPER = 'UPPER';
   SQL_AND = 'AND';
   SQL_INNERJOIN = 'INNER JOIN';
   SQL_LEFTJOIN = 'LEFT JOIN';
   SQL_RIGHTJOIN = 'RIGHT JOIN';

   cMsg_FileNotFound = 'File "%s" could not be found';

   cKInstallerProgram = 'KInstaller.exe';
   cKInstallerUpdate = 'KInstaller.zip';

   
   cAdvisorDBName = 'ADVISORY';
   cAdvisoryAccessMsg = 'This action cannot be taken when accessed using the advisory database.';

   cUnitedDairiesURL = 'http://195.153.22.85/theCIS/Secure/UDF_Login.aspx?ReturnUrl=MainMenu.aspx';
   cNMRURL = 'http://www.nmr.co.uk/services/myfarm.asp';

type
  ValidTimeDOBRange  = 7..21;
  ValidRetensionDays = 2..3;
  TPremType          = (F,S,B);
  TMonthsOrDays      = (M,D,C); // M = No Months After Birth they are eligible
                                // D = Retension Days, C = Time Out In Months

  TAnimalCheck = (Entered,AllOk,Deleted);

  TIntegerArray = array of Integer;
  PIntegerArray = TIntegerArray;

  TStringArray = array of String;
  PStringArray = TStringArray;

  ErrorMsg = class(Exception);
  InvalidDate = class(ErrorMsg);
  InvalidPurchaseDate = class(InvalidDate);
  InvalidSaleDeathDate = class(InvalidDate);

  { Set Up Types to control the Paddock }
  TDiaryEventType = ( TSoilTest, TFertApplic, TSilageHarvest, TSlurryApplic,
                      TReSeeding, TTopping, TSpraying, TPaddockRotation, TNoDiaryEvent );

  { Set Up Types to control the Events - Used in conjunction with the above constants }
  TEventType = ( TService, TWeight, TDryOff, THealth, TCalving, TBulling, TPregDiag,
                 TPremium10, TPremium22, TPremiumBull, TSaleDeath, TPurchase, TMovement,
                 TReTag, TGeneralRemark, TInterHerd, TTBTestDate, TNoEvent, TStockBull, TNewID,
                 TAbortion, TCastrate, TConditionScore, TDiagnoseProblem, TEmbryoTransfer,
                 TMastitis, TToBeCulled, TWean, TInternalExam, TRunBullIn, TRunBullOut, TBruceTest,
                 TPreSale, TDisbudding, TMealFeeding, TDisbuddingNA, TCastrationNA ); // MoorePark
  { TGeneralRemark, TReTag DO NOT CREATE and event Record }

  { Set Up Types to control the General LookUp Query }
  TGenLookUpType = ( TNone, TServiceType, TServedBy, TPDType, TPDBy, TBirthType, TCalfType,
                     TAnimalColour, TObservedBy, THeatType, TApplicMethod, THealthCode,
                     TCulledCode, TMortality, TFeedCategory, TIntExamRes, TIntExamRea, TIntExamMet,
                     THealthReportDesc, TMedicineGroup );

  { Set Up Types to control the Events - Used in conjunction with the above constants }
  TCountry = ( Ireland, NIreland, Scotland, England, Poland, Other );

  TRemark = ( NatID, DOB, Colour, Breed, SaleDate, SalePlace,
              PurchDate, PurchPlace, Sex, Deletion, General,
              SaleDelete, PurchDelete, rHerdID, None );
  TFemaleStatus = (fsInMilk, fsDry, fsNotServed, fsServedNotPDd, fsPregnant, fsNotPregnant, fsNone); // SP 25/09/2002

  // TAnimalWelfareType Animal welfare Event Type's
  TAnimalWelfareType = (
              EABR, {Abortion}       // MoorePark
              ECST, {Castrate}
              ECON, {Condition Score}
              EDNP, {Diagnose Problem}
              EIMP, {Embryo Implant/Transfer}
              EMST, {Mastitis}
              ETBC, {To be Cull}
              EWNC, {Wean}
              EINT, {Internal Exam}
              ERBI, {Run Bull In}
              ERBO, {Run Bull Out}
              EMLF, {Meal Feeding}
              EDBU); {Disbudding }

  PPedigreeRec = ^TPedigreeRec;
  TPedigreeRec = record
     prAnimalIndex,
     prAnimalID,
     prDescAnimalID  : Integer;
     prAnimalNum : String[10];
     prAnimalHerdBookNum : String[20];
     prAnimalPedName : String[30];
     prAnimalCombo : String[4];
  end;


  THealthDryRecord = record
     EventType   : String[1];
     AnimalNo    : String[10];
     EventDate   : TDateTime;
     MedicineCode : String[10];
     HealthCode : String[10];
     DrugBatchNo : String[20];
  end;

  TServiceRecord = record
     EventType   : String[1];
     AnimalNo    : String[10];
     EventDate   : TDateTime;
     ServiceBull : String[10];
  end;

  TPregDiagRecord = record
     EventType : String[1];
     AnimalNo  : String[10];
     EventDate : TDateTime;
     Pregnant  : Boolean;
  end;

  TBullingRecord = record
     EventType : String[1];
     AnimalNo : String[10];
     EventDate : TDateTime;
     BullUsed : String[10];
  end;

  PCalvingsRecord = ^TCalvingsRecord;
  TCalvingsRecord = record
     EventType : String[1];
     AnimalNo : String[10];
     EventDate : TDateTime;
     CalfNo : String[20];
     CalfAnimalNo : String[10];
     CalfSex, CalfBreed : String[6];
     CalfColour : String[6];
     CalfBreedID, CalfColourID : Integer;
     CalfWeight : Double;
     CalfDead : Boolean;
     CalfMortality : Integer;
     CalfBreeding : Boolean;
     CalfDisposalPlace : Integer;
     CalfName : string[30];
  end;

  PSaleDeathRecord = ^TSaleDeathRecord;
  TSaleDeathRecord = record
     AnimalID : Integer;
     EventDate : TDateTime;
     Price, Weight : Double;
     Grade : String[15];
     CustID : Integer;
     Comment : String;
     case Sold : Boolean of
        False : ( DisposalPlace : Integer; CauseOfDeath : Integer );
  end;

  THerdPassword = array[0..9] of Byte;
  TGlobalSettings = record
     ShowCalfReg,
     SaveAnother,
     PhoneLinkOnStartup,
     NewVersionAtStartup,
     NewVersionReminder,
     NewVersionFieldsReps,
     BackupReminder,
     BackupTestFile,
     BackupSpanDisks,
     BackupArchiveFile : Boolean;
     HerdPassword : THerdPassword;
     NatIDToAnimalNo : Boolean;
     MilkTankReadDir : Array [0..255] of Char;
     BladeRegistered : Boolean;
     DisplayBreedCode : Boolean;
     RenumAnimalNo : Boolean;
     MandatoryBreedingEvents : Boolean;
     ReNumFormat : Array [0..3] of char;
     MandatoryDryOffEvent : Boolean; // enforce all dryoff events before calving animal.
     BackupStoreRegFiles : Boolean; // Indication to store Bandon/ICBF Registration Files.
     BackupStorePedigreeImages : Boolean;
     UseBarcodeScanner : Boolean;
     DefaultMaleSex : String[6];
     HealthCodeDefaultCommentIndex : Integer;
     NationalIDAnimalNumber : Integer;
     AllowDuplicateTags : Boolean;
     DefaultExitAfterSale : Boolean;
     DefaultMaleBreedingStatus : Boolean;
     WeighingEventChangeAnimalFocusAfterSave : Boolean;
     UseIEPrefixForNatIDSearch : Boolean;
     DisplayGettingStarted : Boolean;
     AnimalGridSireField : string[20];

     BeefBullAttrNoMonthsFrom : Integer;
     BeefBullAttrNoMonthsTo : Integer;
     BeefBullAttrNoMonthsOver : Integer;
     BeefBullAttrColourBetween : Integer;
     BeefBullAttrColourOver : Integer;
     BeefBullAttrBoldBetween : Boolean;
     BeefBullAttrBoldOver : Boolean;

     BeefFemaleAttrNoMonthsFrom : Integer;
     BeefFemaleAttrNoMonthsTo : Integer;
     BeefFemaleAttrNoMonthsOver : Integer;
     BeefFemaleAttrColourBetween : Integer;
     BeefFemaleAttrColourOver : Integer;
     BeefFemaleAttrBoldBetween : Boolean;
     BeefFemaleAttrBoldOver : Boolean;

     SteerAttrNoMonthsFrom : Integer;
     SteerAttrNoMonthsTo : Integer;
     SteerAttrNoMonthsOver : Integer;
     SteerAttrColourBetween : Integer;
     SteerAttrColourOver : Integer;
     SteerAttrBoldBetween : Boolean;
     SteerAttrBoldOver : Boolean;

     DisplayTBTestDateWarningBeforeSale : Boolean;
     DisplayBruceTestDateWarningBeforeSale : Boolean;
     DisplayMinimumDaysOnFarmWarningBeforeSale : Boolean;
     MinimumDaysToBeKeptOnFarmBeforeSale : Integer;
     DisplayAnimalComments : Boolean;
     AnimalWeighingGraphXAxisValue : Integer;
     AnimalWeighingGraphXAxisVariable : Boolean;

     DisplayMovementFeedColsInGridView : Boolean;

     DownloadMailAttachments : Boolean;
     AnimalGridHideSearchBar : Boolean;
  end;

  TActionReminderReport = (arDueService, arDuePD, arDueDryOff, arDueCalve);
  TActionReminderReports = Set of TActionReminderReport;
  TReportGenModules = ( rgmHerd, rgmHealth, rgmCowFertility, rgmPedigree, rgmCalfPerformance, rgmMilkPerformance, rgmInvalid );

  PPurchaseRecord = ^TPurchaseRecord;
  TPurchaseRecord = record
    Date : TDateTime;
    Weight, Price : Double;
    Supplier, Buyer : Integer;
    sSupplier, sSupplierHerdIdent, sBuyer : string;
  end;

  PWeighingRecord = ^TWeighingRecord;
  TWeighingRecord = record
    Date : TDateTime;
    Weight : Double;
  end;

  TNatIdStyle =  (Style1999,Style1996,StylePre1996,StyleUnKnown);
  TPDStatus = (pdUndefined, pdPregnant, pdNotPregnant);
  THealthParamType = (hptMedicineCode, hptHealthCode, hptMedicineBatchNo, htpInvalid);

  TNBASPermits = (NBAS31A,NBAS31B,NBAS31G,NBASNone);

  TCheckNationalIDRecord = record
  HerdNo : ShortString;
  case Inherd : Boolean of
     False : ( case Sold : Boolean of True : ( OldAID : Integer ) ) ;
  end;

  TTransferEventsDataRecord = record
    TransferEvents : Boolean;
    NewId, OldId : Integer;
  end;

  TPregnancyStatus = (psNotPregnant, psPregnant, psUndefined);

  TCalvingInfo = record
      ProjCalvingDate : TDateTime;
      PregStatus : TPregnancyStatus;
      NoCalves : Integer;
   end;

  TAnimalType = ( atNone, atInHerd, atNonHerdAncestor, atAIBullProvenDairy, atAIBullTestBeef);

 TStatusInfo = record
     NoDaysOnFarm : Integer;
     TBTestDate, BruceDate : TDateTime;
     CheckBrucellosis : Boolean;
     CheckTBTest : Boolean;
     CheckMinimumDaysOnFarm : Boolean;
     WithinDrugWithdrawalPeriod : Boolean;

  end;

  // CTSWS DLL function/procedure calls
  TGet_Cattle_On_Holding_Request = function(pHoldingLoc, pHoldingSLoc : pChar ) : Boolean; stdcall;
  TRegister_Births_Request = function(CTSBatchID : Integer) : Boolean; stdcall;
  TRegister_Movements_Request = function(CTSBatchID : Integer) : Boolean; stdcall;
  TSetURLType = procedure(AURLTypeIndex : Integer); stdcall;

  TSaleGrade = (sgNone, sgUP,sgUE,sgUM,sgRP,sgRE,sgRM,sgOP,sgOE,sgOM,sgPP);

  TPedigreeBreedCode = string[2];


var
   RequestAccountsData : Boolean = False;
   HUKIServerIPAdd : String = HUKILiveServerIPAdd;
   DLLHandle : THandle;
   bConnected : Boolean;
   SendMailResult : Integer;
   DebugMode : Boolean = False;

{   HUKILinmackTestServerIPAdd = '195.153.22.94';
   HUKILiveServerIPAdd = '195.153.22.90';
 }
implementation


initialization
   DebugMode := DirectoryExists('C:\Kingswood\Output\Winherd\Development\Compiled');

end.
