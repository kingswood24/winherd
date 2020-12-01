unit uShowMessage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, GenTypesConst, ExtCtrls,
  RxRichEd, ComCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  cxRichEdit, uRichEditWithLinks, ActnList, cxButtons;

type
  TCountries = set of TCountry;
  TfNotification = class(TForm)
    Panel1: TPanel;
    cbShowAgain: TCheckBox;
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
  private
    { Private declarations }
    VersionIndex : Integer;
    Versions : TStringList;
    procedure WriteVersionHistory(AVersion : string);
  public
    { Public declarations }
  end;

  procedure ShowVersionHistory( Countries : TCountries );

var
  fNotification: TfNotification;

const
  Link1 = 'kingswood';

  cVer3709 = 'V3.7 R0.9';
  cVer3728 = 'V3.7 R2.8';
  cVer3845 = 'V3.8 R4.5';
  cVer3860 = 'V3.8 R6.0';

implementation

uses DairyData, RichEdit, ShellAPI, KRoutines, uFertTreatmentsReview, SetupAnimals,
  uTagReplacementForm, uFilters;

{$R *.DFM}

  procedure ShowVersionHistory( Countries : TCountries );
  begin
     with TfNotification.Create(nil) do
       try
          ShowModal;
       finally
          Free;
       end;
  end;

procedure TfNotification.Button1Click(Sender: TObject);
begin
   WinData.DisplayNews := not cbShowAgain.Checked;
   Close;
end;

procedure TfNotification.FormCreate(Sender: TObject);
begin
   VersionIndex := 0;
   Versions := TStringList.Create;
   Versions.Add(cVer3860);
   Versions.Add(cVer3845);
   Versions.Add(cVer3728);
   Versions.Add(cVer3709);
   WriteVersionHistory( Versions.Strings[VersionIndex]);
end;

procedure TfNotification.RichEditHyperlinkClicked(Sender: TObject; cpMin,
  cpMax: Integer; const lpstrText: String);
begin
   Close;
   if lpstrText = 'Fertility Treatment Chart' then
      TfmFertTreatmentsReview.Execute
   else if lpstrText = 'Grass Budget' then
      WinData.CallProg.Fields
   else if lpstrText = '''Go''' then
      begin
         if fSetUpAnimals <> nil then
            fSetUpAnimals.ShowForm(True);
      end
   else if lpstrText = 'Lost Tag Report' then
      TfmTagReplacementForm.Execute
   else if lpstrText = 'Culling Event Filter' then
      begin
         if fFilters <> nil then
            fFilters.ShowForm;
      end;
end;

procedure TfNotification.WriteVersionHistory(AVersion: string);
var
   LinkText : string;
begin
   RichEdit.Lines.Clear;
   RichEdit.Lines.BeginUpdate;
   RichEdit.SelAttributes.Style := [fsBold,fsItalic];
   RichEdit.Lines.Add(AVersion +' -');
   RichEdit.SelAttributes.Style := [];
   RichEdit.Lines.Add('');
   try
      if AVersion = cVer3860 then
         begin
            LinkText := 'Fertility Treatment Chart';
            RichEdit.Lines.Add(LinkText);
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);
            RichEdit.SetSelectionHyperlink(True);

            RichEdit.Lines.Add('');

            LinkText := 'Grass Budget';
            RichEdit.Lines.Add(LinkText +' available in Fields program V1.0 R4.9');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);
            RichEdit.SetSelectionHyperlink(True);

            RichEdit.Lines.Add('');

            LinkText := '''Go''';
            RichEdit.Lines.Add('Easily find Dam/Sire details with new '+LinkText+' buttons');
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);
            RichEdit.SetSelectionHyperlink(True);
            RichEdit.Lines.Add('in animal setup screen.');

            RichEdit.Lines.Add('');

            LinkText := 'Lost Tag Report';
            RichEdit.Lines.Add(LinkText);
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);
            RichEdit.SetSelectionHyperlink(True);

            RichEdit.Lines.Add('');

            LinkText := 'Culling Event Filter';
            RichEdit.Lines.Add(LinkText);
            RichEdit.SelStart  := Pos(LinkText, RichEdit.Text )-1;
            RichEdit.SelLength := Length(LinkText);
            RichEdit.SetSelectionHyperlink(True);

            RichEdit.Lines.Add('');

            RichEdit.Lines.Add('Minor UI Tweaks');
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
      else if AVersion = cVer3728 then
         begin
            RichEdit.Lines.Add('New! Calving Events can now be recorded with PhoneLink.');
            RichEdit.Lines.Add('Use the following format: C aaa bbbbb s');
            RichEdit.Lines.Add('C is the Event Code');
            RichEdit.Lines.Add('aaa is the animal no. of Dam');
            RichEdit.Lines.Add('bbbbb is the 5 digit tag no of calf');
            RichEdit.Lines.Add('S is the sex of calf - this can be M, B or F');
            RichEdit.Lines.Add('For more information on PhoneLink contact');
            RichEdit.Lines.Add('Technical Support - 01 4599491/info@kingswood.ie');
         end
      else if AVersion = cVer3709 then
         begin
            RichEdit.Lines.Add('Dawn Meats are now in a postion to send electronic');
            RichEdit.Lines.Add('sale sales to their farmer suppliers. If you');
            RichEdit.Lines.Add('wish to avail of this facility, please contact us, giving us');
            RichEdit.Lines.Add('your name, Herd Number (BTE)');
            RichEdit.Lines.Add('and e-mail address. Please go to Factory Sales to');
            RichEdit.Lines.Add('automatically send this e-mail');
         end
   finally
      RichEdit.Lines.EndUpdate;
   end;
   RichEdit.Perform(EM_LINESCROLL,0, -RichEdit.Lines.Count-1 );
end;

procedure TfNotification.actNextUpdate(Sender: TObject);
begin
   actNext.Enabled := VersionIndex > 0;
end;

procedure TfNotification.actPreviousExecute(Sender: TObject);
begin
   if VersionIndex < Versions.Count-1 then
      begin
         Inc(VersionIndex);
         WriteVersionHistory( Versions.Strings[VersionIndex]);
      end;
end;

procedure TfNotification.actNextExecute(Sender: TObject);
begin
   if VersionIndex > 0 then
      begin
         Dec(VersionIndex);
         WriteVersionHistory( Versions.Strings[VersionIndex]);
      end;
end;

procedure TfNotification.actPreviousUpdate(Sender: TObject);
begin
   actPrevious.Enabled := VersionIndex < Versions.Count-1;
end;

end.
