{
   26/08/11 [V5.0 R0.3] /MK Additional Feature - On The Next Major Upgrade Set The WinData.DisplayNews To True.
}
unit uVersionHistory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, GenTypesConst, ExtCtrls,
  RxRichEd, ComCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  cxRichEdit, uRichEditWithLinks, ActnList, cxButtons;

type
  TCountries = set of TCountry;
  TfmVersionHistory = class(TForm)
    Panel1: TPanel;
    cbDoNotShowOnProgramStartup: TCheckBox;
    Button1: TButton;
    RichEdit: TRichEditWithLinks;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    actNext: TAction;
    actPrevious: TAction;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RichEditHyperlinkClicked(Sender: TObject; cpMin,
      cpMax: Integer; const lpstrText: String);
    procedure actNextUpdate(Sender: TObject);
    procedure actPreviousExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actPreviousUpdate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    RegisteredCountry : TCountry;
    VersionIndex : Integer;
    Versions : TStringList;
    FlpstrText : string;
    procedure WriteVersionHistory(AVersion : string);
  public
    { Public declarations }
  end;

  procedure ShowVersionHistory( Countries : TCountries );

var
  fmVersionHistory: TfmVersionHistory;

const
  Link1 = 'kingswood';
  Link2 = 'ICBF Downloads';
  cGmailLink = 'www.gmail.com';

  cVer3845 = 'V3.8 R4.5 - January 2008';
  cVer3860 = 'V3.8 R6.0 - April 2008';
  cVer3901 = 'V3.9 R0.1 - July 2008';
  cVer3940 = 'V3.9 R4.0 - Oct 2008';
  cVer3970 = 'V3.9 R7.0 - Apr 2010';
  cVer4102 = 'V4.1 R0.2 - Apr 2011';
  cVer5291 = 'V5.2 R9.1 - Apr 2014';

implementation

uses DairyData, RichEdit, ShellAPI, KRoutines, uFertTreatmentsReview, SetupAnimals,
  uTagReplacementForm, uFilters, MenuUnit, uICBFPCDownloadImporter;

{$R *.DFM}

  procedure ShowVersionHistory( Countries : TCountries );
  begin
     with TfmVersionHistory.Create(nil) do
       try
          ShowModal;
       finally
          Free;
       end;
  end;

procedure TfmVersionHistory.Button1Click(Sender: TObject);
begin
   WinData.DisplayNews := not cbDoNotShowOnProgramStartup.Checked;
   Close;
end;

procedure TfmVersionHistory.FormCreate(Sender: TObject);
begin
   RegisteredCountry := WinData.SystemRegisteredCountry;
   VersionIndex := 0;
   Versions := TStringList.Create;
   Versions.Add(cVer5291);
   Versions.Add(cVer4102);
   Versions.Add(cVer3970);
   Versions.Add(cVer3940);
   Versions.Add(cVer3901);
   Versions.Add(cVer3860);
   Versions.Add(cVer3845);
   WriteVersionHistory( Versions.Strings[VersionIndex]);
end;

procedure TfmVersionHistory.RichEditHyperlinkClicked(Sender: TObject; cpMin,
  cpMax: Integer; const lpstrText: String);
begin
   FlpstrText := lpstrText;
   Close;
end;

procedure TfmVersionHistory.WriteVersionHistory(AVersion: string);
var
   LinkText : string;
begin
   RichEdit.Lines.Clear;
   RichEdit.Lines.BeginUpdate;
   RichEdit.SelAttributes.Style := [fsBold,fsItalic];
   RichEdit.Lines.Add(AVersion);
   RichEdit.SelAttributes.Style := [];
   RichEdit.Lines.Add('');
   try

      //   26/08/11 [V5.0 R0.3] /MK Additional Feature - On The Next Major Upgrade Set This Boolean To True.
      //   WinData.DisplayNews := True;

      if ( AVersion = cVer5291 ) then
         begin
            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Links Button on Main Screen :-');
            RichEdit.Lines.Add('Brings together links to Marts, Factories, Vets, etc. under one menu.');
            RichEdit.Lines.Add('You must set up a dedicated Gmail address to avail of this option.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Automatic Updating of Herd Movements :-');
            RichEdit.Lines.Add('AIM Movements (under AIM/ICBF) allows clearing off of bull calves and cull cows.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('AIM Login :-');
            RichEdit.Lines.Add('You can now move from one AIM facility to another');
            RichEdit.Lines.Add('without re-entering password/pin.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Vet Link :-');
            RichEdit.Lines.Add('This is now up and running with all VMS vets.');
            RichEdit.Lines.Add('Check with your vet to see if he/she can provide you ');
            RichEdit.Lines.Add('with purchase file to update your vet register.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Bord Bia Button :-');
            RichEdit.Lines.Add('Brings together for ease of viewing/printing reports required for Bord Bia inspection.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Tesco Herd Scoring :-');
            RichEdit.Lines.Add('Quality Assurance data required by Tesco Scheme can now');
            RichEdit.Lines.Add('be exported from Kingswood Herd. (UK Herds Only)');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Cows 365 Link :-');
            RichEdit.Lines.Add('Scanning results and other breeding data can now be imported from');
            RichEdit.Lines.Add('Cows365 (Dr. Dan Ryan). There is an installation fee for this facility.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Vaccinations/Herd Tests :-');
            RichEdit.Lines.Add('Vaccinations with reminders can now be recorded for up to nine diseases.');
            RichEdit.Lines.Add('Also herd test results for Johnes and BVD');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('DairyMaster Link :-');
            RichEdit.Lines.Add('This parlour link has been extended to include the Moo Monitor and Drafting facilities.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Calving Interval :-');
            RichEdit.Lines.Add('This cow parameter can now be viewed from Main Grid.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Beef Data Program :-');
            RichEdit.Lines.Add('Survey events can now be entered under Block events.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Review Medicines :-');
            RichEdit.Lines.Add('This new screen makes it easier to manage medicine stocks, VPA numbers and batch numbers.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Feed Event Diary :-');
            RichEdit.Lines.Add('Allows viewing, printing and exporting to Excel of Feed Events.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Milk Yield Filter :-');
            RichEdit.Lines.Add('Available in Filter on Main Screen.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Planned Bull Event :-');
            RichEdit.Lines.Add('Available under On Farm Events (Block Events).');

            RichEdit.Lines.Add('');

         end
      else if AVersion = cVer4102 then
         begin

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Select Animal Option :-');
            RichEdit.Lines.Add('This option allows the user to quickly');
            RichEdit.Lines.Add('select various categories of animals for');
            RichEdit.Lines.Add('data entry or reporting e.g. cows, replacements or beef cattle.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Fertility Check Event :-');
            RichEdit.Lines.Add('Allows quick recording of cows post-calving');
            RichEdit.Lines.Add('fertility status (clean or infected). Various actions');
            RichEdit.Lines.Add('can be specified (Wash out, Cull or Start Fertility Program).');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Electronic Link To Animal Weighing :-');
            RichEdit.Lines.Add('All main-stream weighing equipment can now');
            RichEdit.Lines.Add('be accessed to provide accurate and');
            RichEdit.Lines.Add('efficient analysis of cattle weights.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Upgrading of Milking Parlour Links :-');
            RichEdit.Lines.Add('Further streamlining has been implemented');
            RichEdit.Lines.Add('in this increasingly critical facility');
            RichEdit.Lines.Add('for dairy farmers.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Dead Calf Registration (ROI) :-');
            RichEdit.Lines.Add('System for recording/registering of dead calves');
            RichEdit.Lines.Add('has been made more flexible.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('BCMS Link (Britain) :-');
            RichEdit.Lines.Add('Animal deaths can now be recorded');
            RichEdit.Lines.Add('using BCMS link with Kingswood Herd.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('APHIS Links (NI) :-');
            RichEdit.Lines.Add('New web services link allows real-time');
            RichEdit.Lines.Add('sending of calf registrations and');
            RichEdit.Lines.Add('cattle movements to APHIS website.');

            RichEdit.Lines.Add('');

         end

      else if AVersion = cVer3970 then
         begin

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Kingswood Online Backup :-');
            RichEdit.Lines.Add('For efficiency, ease-of operation and total security.');
            RichEdit.Lines.Add('You must have broadband access and be on Standing Order');
            RichEdit.Lines.Add('maintanence to avail of this unique facility');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Multiple Animal Events :-');
            RichEdit.Lines.Add('Allows all main events to be entered from a grid of');
            RichEdit.Lines.Add('eligible animals. Access from down arrow');
            RichEdit.Lines.Add('attached to each event icon.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Beef Profit Monitor:-');
            RichEdit.Lines.Add('Improved Sales/Purchase Analysis and');
            RichEdit.Lines.Add('Monthly Livestock Table for suckler and beef farmers.');

            RichEdit.Lines.Add('');

            LinkText := cGmailLink;
            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Milk Recording, Meat Factory and Mart Files By Gmail:-');
            RichEdit.Lines.Add('Much easier transfer of files for users with broadband access.');
            RichEdit.Lines.Add('To set up a Gmail address go to www.gmail.com.');
            RichEdit.Lines.Add('Then ring Kingswood support at');
            RichEdit.Lines.Add('01-4599491 for help in linking it to Kingswood Herd.');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);
            RichEdit.SetSelectionHyperlink(True);

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Beef Sire Register and Sales Catalogue:-');
            RichEdit.Lines.Add('Download latest beef sires from ICBF.');
            RichEdit.Lines.Add('Display animal ancestry details in new promotional format.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Dairy Sire Register Expansion :-');
            RichEdit.Lines.Add('Dairy Sire Register from ICBF now covers');
            RichEdit.Lines.Add('all dairy breeds, not just Holstein Freisian.');

            RichEdit.Lines.Add('');
            
            if (RegisteredCountry in [NIreland, Scotland, England]) then
               begin
                 RichEdit.SelAttributes.Style := [fsBold];
                 RichEdit.Lines.Add('UK-based Sire Register:-');
                 RichEdit.Lines.Add('Details of over 860 bulls available to Kingswood UK customers.');
                 RichEdit.Lines.Add('');
                 RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
                 RichEdit.SelLength := Length(LinkText);
                 RichEdit.SetSelectionHyperlink(False);
               end;
         end;

      if AVersion = cVer3940 then
         begin
            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Suckler Scheme Events Review :-');
            RichEdit.Lines.Add('Summarises Animal Welfare events both generated and notified ');
            RichEdit.Lines.Add('to ICBF. Also allows user to review status of calves and ');
            RichEdit.Lines.Add('examine emails sent to ICBF.');

            RichEdit.Lines.Add('');

            LinkText := cGmailLink;
            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Calf Reg For Broadband Users :-');
            RichEdit.Lines.Add('New Improved facility using Gmail for Kingswood customers ');
            RichEdit.Lines.Add('with broadband access.');
            RichEdit.Lines.Add('To set up a Gmail address specifically for calf registration');
            RichEdit.Lines.Add('use, go to www.gmail.com . Then ring Kingswood support at');
            RichEdit.Lines.Add('01-4599491 for help in linking it to Kingswood Herd.');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);
            RichEdit.SetSelectionHyperlink(True);

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Improved Backup/Restore Screen :-');
            RichEdit.Lines.Add('New layout makes it easier to select different backup media - ');
            RichEdit.Lines.Add('whether Memory Key, CD or Floppy Disk.');
            RichEdit.Lines.Add('Kingswood Online Backup coming soon.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Livestock Valuation Report :-');
            RichEdit.Lines.Add('New management report for customers with Beef Management option.');

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('User-defined colours in Animal Grid :-');
            RichEdit.Lines.Add('New preference option allows customers to define with which ');
            RichEdit.Lines.Add('colour and at what age animals get highlighted on the main grid');
         end;

      if AVersion = cVer3901 then
         begin
            if (RegisteredCountry = England) then
               begin
                 RichEdit.SelAttributes.Style := [fsBold];
                  RichEdit.Lines.Add('CTS Movements :-');
                  RichEdit.Lines.Add('Interactive link with British Cattle Movement Service');
                  RichEdit.Lines.Add('allows immediate processing of Birth, Death amd Movement details,');
                  RichEdit.Lines.Add('');
                  RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
                  RichEdit.SelLength := Length(LinkText);
                  RichEdit.SetSelectionHyperlink(False);
               end;

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Livestock Nutrients Report :-');
            RichEdit.Lines.Add('The projected version of this report now calculates figures');
            RichEdit.Lines.Add('on a 365 day basis (instead of monthly averages).');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('MartLink :-');
            RichEdit.Lines.Add('This facility has been improved to automatically cater for cases of unsold animals.');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Cart :-');
            RichEdit.Lines.Add('Facility to select and act on temporary collections of animals.');
            RichEdit.Lines.Add('Used currently with Lost Tag and On-Farm Group Events but will be');
            RichEdit.Lines.Add('extended for use in other areas of the program.');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);

            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold];
            RichEdit.Lines.Add('Organic Compliancy :-');
            RichEdit.Lines.Add('The program now caters for additional organic recording requirements re withdrawal periods etc.');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);

         end;

      if AVersion = cVer3860 then
         begin
            if (RegisteredCountry = Ireland) then
               begin
                  LinkText := Link2;
                  RichEdit.Lines.Add(LinkText + ' Import EBIs, service details and milk histories');
                  RichEdit.Lines.Add('from the ICBF national database.');
                  RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
                  RichEdit.SelLength := Length(LinkText);
                  RichEdit.SetSelectionHyperlink(True);

                  RichEdit.Lines.Add('');
               end;

            LinkText := 'Fertility Treatment Chart';
            RichEdit.Lines.Add(LinkText + ' Setup fertility programs and associated ');
            RichEdit.Lines.Add('treatments and assign them to cows in the Pregnany Diagnosis event.');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);
            RichEdit.SetSelectionHyperlink(True);

            RichEdit.Lines.Add('');

            LinkText := 'Grass Budget';
            RichEdit.Lines.Add(LinkText +' (Only in Kingswood Fields from V1.0 R4.9)');
            RichEdit.Lines.Add('Compare projected herd intake and grass growth with actual ');
            RichEdit.Lines.Add('measurements on a fortnightly basis.');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);
            RichEdit.SetSelectionHyperlink(True);

            RichEdit.Lines.Add('');

            LinkText := '''Go''';
            RichEdit.Lines.Add(LinkText+' buttons. Take you directly to dam and sire record');
            RichEdit.Lines.Add('cards from animal record card.');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);
            RichEdit.SetSelectionHyperlink(True);

            RichEdit.Lines.Add('');

            if (RegisteredCountry = Ireland) then
               begin
                  LinkText := 'Lost Tag Report';
                  RichEdit.Lines.Add(LinkText +' Takes in lost tag records from CowPad/MiniPad' );
                  RichEdit.Lines.Add('and generates a completed application form for Mullinahone Co-op.');
                  RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
                  RichEdit.SelLength := Length(LinkText);
                  RichEdit.SetSelectionHyperlink(True);
                  RichEdit.Lines.Add('');
               end;


            LinkText := 'Culling Event Filter';
            RichEdit.Lines.Add(LinkText +' Allows animals to be filtered by proposed culling date.');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);
            RichEdit.SetSelectionHyperlink(True);

            RichEdit.Lines.Add('');
         end
      else if AVersion = cVer3845 then
         begin
            RichEdit.Lines.Add('This new version of Kingswood Herd is fully compliant');
            RichEdit.Lines.Add('with the online requirments of the Suckler Cow Scheme.');
            RichEdit.Lines.Add('There are four new Animal Welfare events - Disbudding,');
            RichEdit.Lines.Add('Castration, Meal Feeding and Weaning. These should be');
            RichEdit.Lines.Add('updated as appropriate as well as entering calving');
            RichEdit.Lines.Add('details in the Calving event.');
            RichEdit.Lines.Add('');

            RichEdit.SelAttributes.Style := [fsBold,fsItalic];
            RichEdit.Lines.Add('NB:');
            RichEdit.SelAttributes.Style := [];
            RichEdit.Lines.Add('1. At regular intervals, you should go to the ICBF Animal');
            RichEdit.Lines.Add('Event Recording option and email details of all five events');
            RichEdit.Lines.Add('to the ICBF. This fulfills the online requirments of the');
            RichEdit.Lines.Add('Scheme.');

            RichEdit.Lines.Add('2. Please note that you must continue to send a SEPERATE');
            RichEdit.Lines.Add('email to EREG (button marked Bandon) in order to register');
            RichEdit.Lines.Add('your calves with the Dept.');
            RichEdit.Lines.Add('');
            RichEdit.Lines.Add('');
         end
   finally
      RichEdit.Lines.EndUpdate;
   end;
   RichEdit.Perform(EM_LINESCROLL,0, -RichEdit.Lines.Count-1 );
end;

procedure TfmVersionHistory.actNextUpdate(Sender: TObject);
begin
   actNext.Enabled := VersionIndex > 0;
end;

procedure TfmVersionHistory.actPreviousExecute(Sender: TObject);
begin
   if VersionIndex < Versions.Count-1 then
      begin
         Inc(VersionIndex);
         WriteVersionHistory( Versions.Strings[VersionIndex]);
      end;
end;

procedure TfmVersionHistory.actNextExecute(Sender: TObject);
begin
   if VersionIndex > 0 then
      begin
         Dec(VersionIndex);
         WriteVersionHistory( Versions.Strings[VersionIndex]);
      end;
end;

procedure TfmVersionHistory.actPreviousUpdate(Sender: TObject);
begin
   actPrevious.Enabled := VersionIndex < Versions.Count-1;
end;

procedure TfmVersionHistory.FormDestroy(Sender: TObject);
var
   iNewAnimalsAdded : Integer;
begin
   if FlpstrText = 'Fertility Treatment Chart' then
      begin
         //TfmFertTreatmentsReview.Execute
         SendMessage(MenuForm.Handle, WM_ShowReportsScreen, cGoToFertTreatmentChart, 0);
      end
   else if FlpstrText = 'Grass Budget' then
      WinData.CallProg.Fields
   else if FlpstrText = '''Go''' then
      begin
         if fSetUpAnimals <> nil then
            fSetUpAnimals.ShowForm(True);
      end
   else if FlpstrText = 'Lost Tag Report' then
      begin
         //TfmTagReplacementForm.Execute
         SendMessage(MenuForm.Handle, WM_ShowReportsScreen, cGoToTagReplacementsMainScr, 0);
      end
   else if FlpstrText = 'Culling Event Filter' then
      begin
         if fFilters <> nil then
            fFilters.ShowForm;
      end
   else if FlpstrText = Link2 then
      begin
         iNewAnimalsAdded := 0;
         TfmICBFPCDownloadImporter.Execute(0,True,iNewAnimalsAdded,True);
      end
   else if FlpstrText = cGmailLink then
      OpenUrl(cGmailLink);
end;

end.
