{
   02/08/16 [V5.5 R7.6] /MK Additional Feature - Added another TruTest option for XR5000.

   11/10/17 [V5.7 R3.8] /MK Change - Added check boxes for storing preferences to export date of birth and last weight - Darragh Carroll (4799).

   12/10/17 [V5.7 R3.9] /MK Change - ShowSettings - Removed var for FirstExport from TfmElectronicWeighingSettings as its not required any more.
}

unit uElectronicWeighingSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxCheckBox, cxTextEdit, cxLabel, cxMaskEdit, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons, uElecWeigh,
  GenTypesConst, uPreferences, cxShellBrowserDialog, KRoutines;

type
  TWeighingEquipmentSupplier = record
     Name : string;
     DefaultDirectory : string;
     ExportAnimalDataOnFirstUse : Boolean;
     ExportDateOfBirthToTruTest : Boolean;
     ExportLastWeightToTruTest : Boolean;
  end;

  TfmElectronicWeighingSettings = class(TForm)
    gbOptions: TcxGroupBox;
    cmboManufacturer: TcxComboBox;
    lManufacturer: TcxLabel;
    lInformation: TcxLabel;
    lOutputDirectory: TcxLabel;
    teOutputDirectory: TcxTextEdit;
    cbExportFileOnClose: TcxCheckBox;
    btnFindDirectory: TcxButton;
    btnOK: TcxButton;
    ShellBrowserDialog: TcxShellBrowserDialog;
    cbExportDateOfBirthTruTest: TcxCheckBox;
    cbExportLastWeightTruTest: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cmboManufacturerPropertiesChange(Sender: TObject);
    procedure btnFindDirectoryClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    EquipmentSuppliers : array[0..4] of TWeighingEquipmentSupplier;
  public
    { Public declarations }
    class procedure ShowSettings(var ExportAnimalInfo : Boolean);
  end;

var
  fmElectronicWeighingSettings: TfmElectronicWeighingSettings;

implementation

{$R *.DFM}

procedure TfmElectronicWeighingSettings.FormCreate(Sender: TObject);
var
   i : Integer;
begin
   EquipmentSuppliers[0].Name := 'Gallagher''s';
   EquipmentSuppliers[0].DefaultDirectory := 'C:\Program Files\';
   EquipmentSuppliers[0].ExportAnimalDataOnFirstUse := True;
   EquipmentSuppliers[0].ExportDateOfBirthToTruTest := True;
   EquipmentSuppliers[0].ExportLastWeightToTruTest := False;

   EquipmentSuppliers[1].Name := 'Tru Test (3000)';
   EquipmentSuppliers[1].DefaultDirectory := 'c:\program files\tru-test\Link2000\';
   EquipmentSuppliers[1].ExportAnimalDataOnFirstUse := True;
   EquipmentSuppliers[1].ExportDateOfBirthToTruTest := True;
   EquipmentSuppliers[1].ExportLastWeightToTruTest := False;

   EquipmentSuppliers[2].Name := 'Tru Test (EZI Weigh)';
   EquipmentSuppliers[2].DefaultDirectory := 'c:\program files\tru-test\Link2000\';
   EquipmentSuppliers[2].ExportAnimalDataOnFirstUse := True;
   EquipmentSuppliers[2].ExportDateOfBirthToTruTest := True;
   EquipmentSuppliers[2].ExportLastWeightToTruTest := False;

   EquipmentSuppliers[3].Name := 'Tru Test (XR5000)';
   EquipmentSuppliers[3].DefaultDirectory := 'c:\program files\tru-test\Link5000\';
   EquipmentSuppliers[3].ExportAnimalDataOnFirstUse := True;
   EquipmentSuppliers[3].ExportDateOfBirthToTruTest := True;
   EquipmentSuppliers[3].ExportLastWeightToTruTest := True;

   EquipmentSuppliers[4].Name := 'Digi-Star';
   EquipmentSuppliers[4].DefaultDirectory := 'C:\';
   EquipmentSuppliers[4].ExportAnimalDataOnFirstUse := False;
   EquipmentSuppliers[4].ExportDateOfBirthToTruTest := False;
   EquipmentSuppliers[4].ExportLastWeightToTruTest := False;

   cmboManufacturer.Properties.Items.Clear;
   for i := 0 to 4 do
      cmboManufacturer.Properties.Items.Add(EquipmentSuppliers[i].Name);
end;

procedure TfmElectronicWeighingSettings.cmboManufacturerPropertiesChange(Sender: TObject);
begin
   if ( cmboManufacturer.ItemIndex in [0..3] ) then
      begin
         teOutputDirectory.Text := EquipmentSuppliers[cmboManufacturer.ItemIndex].DefaultDirectory;
         cbExportFileOnClose.Checked := EquipmentSuppliers[cmboManufacturer.ItemIndex].ExportAnimalDataOnFirstUse;
      end;

   //   15/08/12 [V5.0 R8.5] /MK Bug Fix - Program was only saving WeighingProducer if reg key did not exist.
   //                                      This was stopping the user from changing producers.
   if ( cmboManufacturer.ItemIndex = 0 ) then
      Preferences.ValueAsString[cGSElectronicWeighingProducer] := 'Gallagher'
   else if ( cmboManufacturer.ItemIndex = 1 ) then
      Preferences.ValueAsString[cGSElectronicWeighingProducer] := 'TruTest'
   else if ( cmboManufacturer.ItemIndex = 2 ) then
      Preferences.ValueAsString[cGSElectronicWeighingProducer] := 'TruTestEZI'
   else if ( cmboManufacturer.ItemIndex = 3 ) then
      Preferences.ValueAsString[cGSElectronicWeighingProducer] := 'TruTest5000'
   else if ( cmboManufacturer.ItemIndex = 4 ) then
      Preferences.ValueAsString[cGSElectronicWeighingProducer] := 'DigiStar';

   Preferences.ValueAsString[cGSElectronicWeighingProducerPath] := teOutputDirectory.Text;

   if ( Preferences.PreferenceExists(cGSElectronicWeighingExportTruTestDateOfBirth) ) then
      cbExportDateOfBirthTruTest.Checked := Preferences.ValueAsBoolean[cGSElectronicWeighingExportTruTestDateOfBirth]
   else
      begin
         cbExportDateOfBirthTruTest.Checked := EquipmentSuppliers[cmboManufacturer.ItemIndex].ExportDateOfBirthToTruTest;
         Preferences.ValueAsBoolean[cGSElectronicWeighingExportTruTestDateOfBirth] := cbExportDateOfBirthTruTest.Checked;
      end;

   if ( Preferences.PreferenceExists(cGSElectronicWeighingExportTruTestLastWeight) ) then
      cbExportLastWeightTruTest.Checked := Preferences.ValueAsBoolean[cGSElectronicWeighingExportTruTestLastWeight]
   else
      begin
         cbExportLastWeightTruTest.Checked := EquipmentSuppliers[cmboManufacturer.ItemIndex].ExportLastWeightToTruTest;
         Preferences.ValueAsBoolean[cGSElectronicWeighingExportTruTestLastWeight] := cbExportLastWeightTruTest.Checked;
      end;
end;

class procedure TfmElectronicWeighingSettings.ShowSettings(var ExportAnimalInfo : Boolean);
begin
   with TfmElectronicWeighingSettings.Create(nil) do
      try
         if ( Preferences.PreferenceExists(cGSElectronicWeighingProducer) ) then
            begin
               if ( Preferences.ValueAsString[cGSElectronicWeighingProducer] = 'Gallagher' ) then
                  cmboManufacturer.ItemIndex := 0
               else if ( Preferences.ValueAsString[cGSElectronicWeighingProducer] = 'TruTest' ) then
                  cmboManufacturer.ItemIndex := 1
               else if ( Preferences.ValueAsString[cGSElectronicWeighingProducer] = 'TruTestEZI' ) then
                  cmboManufacturer.ItemIndex := 2
               else if ( Preferences.ValueAsString[cGSElectronicWeighingProducer] = 'TruTest5000' ) then
                  cmboManufacturer.ItemIndex := 3
               else if ( Preferences.ValueAsString[cGSElectronicWeighingProducer] = 'DigiStar' ) then
                  cmboManufacturer.ItemIndex := 4;
            end;

         if ( Preferences.PreferenceExists(cGSElectronicWeighingExportTruTestDateOfBirth) ) then
            cbExportDateOfBirthTruTest.Checked := Preferences.ValueAsBoolean[cGSElectronicWeighingExportTruTestDateOfBirth];

         if ( Preferences.PreferenceExists(cGSElectronicWeighingExportTruTestLastWeight) ) then
            cbExportLastWeightTruTest.Checked := Preferences.ValueAsBoolean[cGSElectronicWeighingExportTruTestLastWeight];

         ShowModal;

         ExportAnimalInfo := cbExportFileOnClose.Checked;

         if ( ModalResult = mrOK ) then
            begin
               Preferences.ValueAsBoolean[cGSElectronicWeighingExportTruTestDateOfBirth] := cbExportDateOfBirthTruTest.Checked;
               Preferences.ValueAsBoolean[cGSElectronicWeighingExportTruTestLastWeight] := cbExportLastWeightTruTest.Checked;
            end;

      finally
         Free;
      end;
end;

procedure TfmElectronicWeighingSettings.btnFindDirectoryClick(
  Sender: TObject);
begin
   if ( ShellBrowserDialog.Execute ) and ( DirExists(ShellBrowserDialog.Path) ) then
      begin
         teOutputDirectory.Text := ShellBrowserDialog.Path;
         Preferences.ValueAsString[cGSElectronicWeighingProducerPath] := ShellBrowserDialog.Path;
      end;
end;

procedure TfmElectronicWeighingSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := ( ( cmboManufacturer.ItemIndex > -1 ) and ( teOutputDirectory.Text <> '' ) );
   if ( not(CanClose) ) then
      if ( MessageDlg('You must select an Equipment Manufacturer to continue with the Electronice Weighing.'+cCRLF+
                      'Are you sure you want to exit without entering this information',mtWarning,[mbYes,mbNo],0) = mrYes ) then
         CanClose := True;
end;

end.
