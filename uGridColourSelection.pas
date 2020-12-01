{
   09/05/19 [V5.8 R9.2] /MK Change - Changed the word "Atrributes" to "Ages (In Months)" - GL/Una Carter suggestion.
}

unit uGridColourSelection;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxColorComboBox, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxGroupBox, cxCheckBox,
  cxLabel, cxSpinEdit;

type
  TfmGridColourSelection = class(TForm)
    cxGroupBox1: TcxGroupBox;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    cxGroupBox2: TcxGroupBox;
    seFemaleMonthFrom: TcxSpinEdit;
    cxLabel1: TcxLabel;
    ccbFemaleColourBetween: TcxColorComboBox;
    cxLabel2: TcxLabel;
    cbFemaleBoldBetween: TcxCheckBox;
    cxGroupBox3: TcxGroupBox;
    seBullMonthsFrom: TcxSpinEdit;
    cxLabel3: TcxLabel;
    ccbBullColourBetween: TcxColorComboBox;
    cbBullBoldBetween: TcxCheckBox;
    cxGroupBox4: TcxGroupBox;
    seSteerMonthsFrom: TcxSpinEdit;
    cxLabel5: TcxLabel;
    ccbSteerColourBetween: TcxColorComboBox;
    cbSteerBoldBetween: TcxCheckBox;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    seFemaleMonthTo: TcxSpinEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    seFemaleMonthOver: TcxSpinEdit;
    ccbFemaleColourOver: TcxColorComboBox;
    cxLabel9: TcxLabel;
    cbFemaleBoldOver: TcxCheckBox;
    cxLabel10: TcxLabel;
    seBullMonthsTo: TcxSpinEdit;
    seBullMonthsOver: TcxSpinEdit;
    cxLabel11: TcxLabel;
    ccbBullColourOver: TcxColorComboBox;
    cxLabel12: TcxLabel;
    cbBullBoldOver: TcxCheckBox;
    seSteerMonthsOver: TcxSpinEdit;
    cxLabel13: TcxLabel;
    ccbSteerColourOver: TcxColorComboBox;
    cxLabel14: TcxLabel;
    cbSteerBoldOver: TcxCheckBox;
    cxLabel15: TcxLabel;
    seSteerMonthsTo: TcxSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure seFemaleMonthToPropertiesChange(Sender: TObject);
    procedure seBullMonthsToPropertiesChange(Sender: TObject);
    procedure seSteerMonthsToPropertiesChange(Sender: TObject);
    procedure seFemaleMonthFromPropertiesChange(Sender: TObject);
    procedure seBullMonthsFromPropertiesChange(Sender: TObject);
    procedure seSteerMonthsFromPropertiesChange(Sender: TObject);
    procedure seFemaleMonthOverPropertiesChange(Sender: TObject);
    procedure seBullMonthsOverPropertiesChange(Sender: TObject);
    procedure seSteerMonthsOverPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFormShowing : Boolean;
    procedure LoadFromGlobalSettings;
    procedure SaveToGlobalSettings;

  public
    { Public declarations }
  end;

var
  fmGridColourSelection: TfmGridColourSelection;

implementation

uses DairyData, uHerdLookup;

{$R *.DFM}

{ TfmGridColourSelection }

procedure TfmGridColourSelection.LoadFromGlobalSettings;
begin
   with WinData.GlobalSettings do
      begin
         seFemaleMonthFrom.Value := WinData.GlobalSettings.BeefFemaleAttrNoMonthsFrom;
         seFemaleMonthTo.Value := WinData.GlobalSettings.BeefFemaleAttrNoMonthsTo;
         seFemaleMonthOver.Value := WinData.GlobalSettings.BeefFemaleAttrNoMonthsOver;
         ccbFemaleColourBetween.ColorValue := TColor(WinData.GlobalSettings.BeefFemaleAttrColourBetween);
         cbFemaleBoldBetween.Checked := WinData.GlobalSettings.BeefFemaleAttrBoldBetween;
         ccbFemaleColourOver.ColorValue := TColor(WinData.GlobalSettings.BeefFemaleAttrColourOver);
         cbFemaleBoldOver.Checked := WinData.GlobalSettings.BeefFemaleAttrBoldOver;

         seBullMonthsFrom.Value := WinData.GlobalSettings.BeefBullAttrNoMonthsFrom;
         seBullMonthsTo.Value := WinData.GlobalSettings.BeefBullAttrNoMonthsTo;
         seBullMonthsOver.Value := WinData.GlobalSettings.BeefBullAttrNoMonthsOver;
         ccbBullColourBetween.ColorValue := TColor(WinData.GlobalSettings.BeefBullAttrColourBetween);
         cbBullBoldBetween.Checked := WinData.GlobalSettings.BeefBullAttrBoldBetween;
         ccbBullColourOver.ColorValue := TColor(WinData.GlobalSettings.BeefBullAttrColourOver);
         cbBullBoldOver.Checked := WinData.GlobalSettings.BeefBullAttrBoldOver;


         seSteerMonthsFrom.Value := WinData.GlobalSettings.SteerAttrNoMonthsFrom;
         seSteerMonthsTo.Value := WinData.GlobalSettings.SteerAttrNoMonthsTo;
         seSteerMonthsOver.Value := WinData.GlobalSettings.SteerAttrNoMonthsOver;
         ccbSteerColourBetween.ColorValue := TColor(WinData.GlobalSettings.SteerAttrColourBetween);
         cbSteerBoldBetween.Checked := WinData.GlobalSettings.SteerAttrBoldBetween;
         ccbSteerColourOver.ColorValue := TColor(WinData.GlobalSettings.SteerAttrColourOver);
         cbSteerBoldOver.Checked := WinData.GlobalSettings.SteerAttrBoldOver;
      end;
end;

procedure TfmGridColourSelection.FormCreate(Sender: TObject);
begin
   FFormShowing := False;
   LoadFromGlobalSettings;
end;

procedure TfmGridColourSelection.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ModalResult = mrOK then
      SaveToGlobalSettings;
end;

procedure TfmGridColourSelection.SaveToGlobalSettings;
begin


   WinData.GlobalSettings.BeefFemaleAttrNoMonthsFrom := seFemaleMonthFrom.Value;
   WinData.GlobalSettings.BeefFemaleAttrNoMonthsTo := seFemaleMonthTo.Value;
   WinData.GlobalSettings.BeefFemaleAttrNoMonthsOver := seFemaleMonthOver.Value;
   WinData.GlobalSettings.BeefFemaleAttrColourBetween := Integer(ccbFemaleColourBetween.ColorValue);
   WinData.GlobalSettings.BeefFemaleAttrBoldBetween := cbFemaleBoldBetween.Checked;
   WinData.GlobalSettings.BeefFemaleAttrColourOver := Integer(ccbFemaleColourOver.ColorValue);
   WinData.GlobalSettings.BeefFemaleAttrBoldOver := cbFemaleBoldOver.Checked;

   WinData.GlobalSettings.BeefBullAttrNoMonthsFrom := seBullMonthsFrom.Value;
   WinData.GlobalSettings.BeefBullAttrNoMonthsTo := seBullMonthsTo.Value;
   WinData.GlobalSettings.BeefBullAttrNoMonthsOver := seBullMonthsOver.Value;
   WinData.GlobalSettings.BeefBullAttrColourBetween := Integer(ccbBullColourBetween.ColorValue);
   WinData.GlobalSettings.BeefBullAttrBoldBetween := cbBullBoldBetween.Checked;
   WinData.GlobalSettings.BeefBullAttrColourOver := Integer(ccbBullColourOver.ColorValue);
   WinData.GlobalSettings.BeefBullAttrBoldOver := cbBullBoldOver.Checked;

   WinData.GlobalSettings.SteerAttrNoMonthsFrom := seSteerMonthsFrom.Value;
   WinData.GlobalSettings.SteerAttrNoMonthsTo := seSteerMonthsTo.Value;
   WinData.GlobalSettings.SteerAttrNoMonthsOver := seSteerMonthsOver.Value;
   WinData.GlobalSettings.SteerAttrColourBetween := Integer(ccbSteerColourBetween.ColorValue);
   WinData.GlobalSettings.SteerAttrBoldBetween := cbSteerBoldBetween.Checked;
   WinData.GlobalSettings.SteerAttrColourOver := Integer(ccbSteerColourOver.ColorValue);
   WinData.GlobalSettings.SteerAttrBoldOver := cbSteerBoldOver.Checked;

   {
   WinData.GlobalSettings.NonBreedingFemaleHighlightNoMonths := seFemaleMonths.Value;
   WinData.GlobalSettings.NonBreedingFemaleHighlightColour := Integer(ccbFemaleColour.ColorValue);
   WinData.GlobalSettings.NonBreedingFemaleHighlightBold := cbFemaleBold.Checked;

   WinData.GlobalSettings.NonBreedingBullHighlightNoMonths := seBullMonths.Value;
   WinData.GlobalSettings.NonBreedingBullHighlightColour := Integer(ccbBullColour.ColorValue);
   WinData.GlobalSettings.NonBreedingBullHighlightBold := cbBullBold.Checked;

   WinData.GlobalSettings.SteerHighlightNoMonths := seSteerMonths.Value;
   WinData.GlobalSettings.SteerHighlightColour :=  Integer(ccbSteerColour.ColorValue);
   WinData.GlobalSettings.SteerHighlightBold := cbSteerBold.Checked;
   }
   WinData.SavePreferences;
end;

procedure TfmGridColourSelection.seFemaleMonthToPropertiesChange(
  Sender: TObject);
begin
   if FFormShowing then
      seFemaleMonthOver.Value := seFemaleMonthTo.Value;
end;

procedure TfmGridColourSelection.seBullMonthsToPropertiesChange(
  Sender: TObject);
begin
   if FFormShowing then
      seBullMonthsOver.Value := seBullMonthsTo.Value;
end;

procedure TfmGridColourSelection.seSteerMonthsToPropertiesChange(
  Sender: TObject);
begin
   if FFormShowing then
      seSteerMonthsOver.Value := seSteerMonthsTo.Value;
end;

procedure TfmGridColourSelection.seFemaleMonthFromPropertiesChange(
  Sender: TObject);
begin
   if FFormShowing then
      if seFemaleMonthFrom.Value > seFemaleMonthTo.Value then
         begin
            MessageDlg('From value must be less than to value',mtError,[mbOK],0);
            seFemaleMonthFrom.Value := seFemaleMonthTo.Value-1;
            if seFemaleMonthFrom.Value < 0 then
               seFemaleMonthFrom.Value := 0;
         end;
end;

procedure TfmGridColourSelection.seBullMonthsFromPropertiesChange(
  Sender: TObject);
begin
   if FFormShowing then
      if seBullMonthsFrom.Value > seBullMonthsTo.Value then
         begin
            MessageDlg('From value must be less than to value',mtError,[mbOK],0);
            seBullMonthsFrom.Value := seBullMonthsTo.Value-1;
            if seBullMonthsFrom.Value < 0 then
               seBullMonthsFrom.Value := 0;
         end;
end;

procedure TfmGridColourSelection.seSteerMonthsFromPropertiesChange(
  Sender: TObject);
begin
   if FFormShowing then
      if seSteerMonthsFrom.Value > seSteerMonthsTo.Value then
         begin
            MessageDlg('From value must be less than to value',mtError,[mbOK],0);
            seSteerMonthsFrom.Value := seSteerMonthsTo.Value-1;
            if seSteerMonthsFrom.Value < 0 then
               seSteerMonthsFrom.Value := 0;
         end;
end;

procedure TfmGridColourSelection.seFemaleMonthOverPropertiesChange(
  Sender: TObject);
begin
   if FFormShowing then
      seFemaleMonthTo.Value := seFemaleMonthOver.Value;
end;

procedure TfmGridColourSelection.seBullMonthsOverPropertiesChange(
  Sender: TObject);
begin
   if FFormShowing then
      seBullMonthsTo.Value := seBullMonthsOver.Value;
end;

procedure TfmGridColourSelection.seSteerMonthsOverPropertiesChange(
  Sender: TObject);
begin
   if FFormShowing then
      seSteerMonthsTo.Value := seSteerMonthsOver.Value;
end;

procedure TfmGridColourSelection.FormShow(Sender: TObject);
begin
   FFormShowing := True;
end;

end.
