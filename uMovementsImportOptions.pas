//   11/06/20 [V5.9 R4.8] /MK Additional Feature - Added weighing events - Alan Gilligan.

unit uMovementsImportOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxCheckBox, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxLabel;

type
  TfmMovementsImportOptions = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cbBreedingEvents: TcxCheckBox;
    cbHealthEvents: TcxCheckBox;
    cbDamSireDetails: TcxCheckBox;
    cbMilkLactationDetails: TcxCheckBox;
    btnCancel: TcxButton;
    btnImport: TcxButton;
    cxLabel1: TcxLabel;
    lFilePath: TcxLabel;
    cbImportWeighingEvents: TcxCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    class function ShowImportOptions(const AFileName : string;
       var AImportBreedingEvents, AImportHealthEvents,
       AImportDamSireDetails, AImportMilkLactDetails,
       AImportWeighingEvents : Boolean) : Boolean;
  end;

var
  fmMovementsImportOptions: TfmMovementsImportOptions;

implementation

{$R *.DFM}

{ TfmMovementsImportOptions }

class function TfmMovementsImportOptions.ShowImportOptions(const AFileName : string;
  var AImportBreedingEvents, AImportHealthEvents, AImportDamSireDetails,
  AImportMilkLactDetails, AImportWeighingEvents: Boolean): Boolean;
begin
   with TfmMovementsImportOptions.Create(nil) do
      try
         lFilePath.Caption := ExtractFileName(AFileName);
         update;
         Result := ShowModal=mrOK;
         AImportBreedingEvents := cbBreedingEvents.Checked;
         AImportHealthEvents := cbHealthEvents.Checked;
         AImportDamSireDetails := cbDamSireDetails.Checked;
         AImportMilkLactDetails := cbMilkLactationDetails.Checked;
         AImportWeighingEvents := cbImportWeighingEvents.Checked;
      finally
         Free;
      end;
end;

end.
