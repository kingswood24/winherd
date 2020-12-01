{
   06/07/11 [V4.1 R2.2] /MK Additional Feature - Added Slaney To Email List.

   21/05/15 [V5.4 R7.0] /MK Additional Feature - Added Ashbourne to cmbMartNames.

   22/09/17 [V5.7 R3.0] /MK Additional Feature - Added Ballinasloe to Liffey Meats.   
}

unit uRemittanceMarts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DaZMisc, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit;

type
  TfmRemittanceMarts = class(TForm)
    Button1: TButton;
    Button2: TButton;
    cmbMartNames: TcxComboBox;
    procedure cmbMartNamesChange(Sender: TObject);
  private
    { Private declarations }
    fMartName : string;
  public
    { Public declarations }
    class function SelectMart(AMartName : string) : string;
  end;

var
  fmRemittanceMarts: TfmRemittanceMarts;

implementation

{$R *.DFM}

{ TfmMarts }

class function TfmRemittanceMarts.SelectMart(AMartName : string) : string;
begin
   Result := '';
   Application.CreateForm(TfmRemittanceMarts, fmRemittanceMarts);
   with fmRemittanceMarts do
   try
      fMartName := '';
      cmbMartNames.Properties.Items.BeginUpdate;
      try
         cmbMartNames.Properties.Items.Clear;
         cmbMartNames.Properties.Items.Add('<Select Slaughter Plant>');
         if AMartName = iRemittanceMarts[2] then
            begin
               cmbMartNames.Properties.Items.Add('Midleton');
               cmbMartNames.Properties.Items.Add('Rathdowney');
               cmbMartNames.Properties.Items.Add('Charleville');
               cmbMartNames.Properties.Items.Add('Grannagh');
               cmbMartNames.Properties.Items.Add('Ballyhaunis');
               cmbMartNames.Properties.Items.Add('Ballaghderreen');
               cmbMartNames.ItemIndex := 0;
            end
         else if AMartName = iRemittanceMarts[1] then
            begin
               cmbMartNames.Properties.Items.Add('Cahir');
               cmbMartNames.Properties.Items.Add('Clones');
               cmbMartNames.Properties.Items.Add('Bandon');
               cmbMartNames.Properties.Items.Add('Nenagh');
               cmbMartNames.Properties.Items.Add('Rathkeale');
               cmbMartNames.Properties.Items.Add('Ferrybank');
            end
         else if AMartName = iRemittanceMarts[3] then
            begin
               cmbMartNames.Properties.Items.Add('Ballinasloe');
               cmbMartNames.Properties.Items.Add('Ballyjamesduff');
               cmbMartNames.Properties.Items.Add('Hacketstown');
             end
         else if AMartName = iRemittanceMarts[0] then
            begin
               cmbMartNames.Properties.Items.Add('Clonee');
               cmbMartNames.Properties.Items.Add('Athleague');
               cmbMartNames.Properties.Items.Add('Watergrasshill');
               cmbMartNames.Properties.Items.Add('Kilbeggan');
             end
         else if AMartName = iRemittanceMarts[4] then
            begin
               cmbMartNames.Properties.Items.Add('Dunbia');
            end
         else if AMartName = iRemittanceMarts[5] then
            begin
               cmbMartNames.Properties.Items.Add('Ballon');
            end
         else if AMartName = iRemittanceMarts[6] then
            begin
               cmbMartNames.Properties.Items.Add('Bunclody');
            end
         else if AMartName = iRemittanceMarts[7] then
            begin
               //   21/05/15 [V5.4 R7.0] /MK Additional Feature - Added Ashbourne to cmbMartNames.
               cmbMartNames.Properties.Items.Add('Ashbourne');
            end;
       finally
          cmbMartNames.ItemIndex := 0;
          cmbMartNames.Properties.Items.EndUpdate;
       end;

      if ShowModal = mrOK then
         Result := fMartName;
   finally
      FreeAndNil(fmRemittanceMarts);
   end;

end;

procedure TfmRemittanceMarts.cmbMartNamesChange(Sender: TObject);
begin
   if cmbMartNames.ItemIndex <> 0 then
      fMartName := cmbMartNames.Properties.Items[cmbMartNames.ItemIndex]
   else
      fMartName := '';
end;

end.
