{
   06/02/17 [V5.6 R4.4] /MK Bug Fix - If user clicks Don't Show Again then save the newly selected tag prefix - reported by SP.
                                    - Update the IsSynchronized in the Owners table to false when chan
}

unit uTagIdentifierSelection;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, cxControls, cxContainer, cxEdit, cxCheckBox, uGlobalSettings,
  DairyData, cxGroupBox, cxRadioGroup, db, dbTables, GenTypesConst, cxLabel,
  StdCtrls, cxButtons, cxTextEdit, cxCurrencyEdit, KDBRoutines, KRoutines;

type
  TfmTagIdentifierSelection = class(TForm)
    cxGroupBox1: TcxGroupBox;
    lInformation: TcxLabel;
    rgTagSelect: TcxRadioGroup;
    cbHideThisScreen: TcxCheckBox;
    lHerdDesginator: TcxLabel;
    teHerdDesignator: TcxTextEdit;
    Bevel1: TBevel;
    lDesignatorInfo: TcxLabel;
    btnOK: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cbHideThisScreenPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure teHerdDesignatorKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure rgTagSelectPropertiesChange(Sender: TObject);
  private
    FFormShowing,
    FTagPrefixChanged : Boolean;
    FTagDesginator,
    FTagPrefix,
    FOldTagDesignator : String;
    { Private declarations }
  public
    { Public declarations }
    class function ShowTheForm : Integer;
  end;

var
  fmTagIdentifierSelection: TfmTagIdentifierSelection;

implementation

{$R *.DFM}

{ TfmTagIdentifierSelection }

class function TfmTagIdentifierSelection.ShowTheForm : Integer;
begin
   with TfmTagIdentifierSelection.Create(nil) do
      try
         Result := ShowModal;
      finally
         Free;
      end;
end;

procedure TfmTagIdentifierSelection.FormCreate(Sender: TObject);
var
   sTagDesignator : String;
   i : Integer;
begin
   ModalResult := mrCancel;

   FFormShowing := False;
   FTagPrefixChanged := False;
   FTagDesginator := '';
   FTagPrefix := '';
   FOldTagDesignator := '';
   sTagDesignator := '';

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT TagPrefix, HerdIdentifier, SwitchedTagDesignator');
         SQL.Add('FROM Owners');
         SQL.Add('WHERE ID = '+IntToStr(WinData.UserDefaultHerdID)+'');
         try
            Open;
            FTagPrefix := Fields[0].AsString;
            FTagDesginator := StripAllSpaces(Fields[1].AsString);
            FOldTagDesignator := StripAllSpaces(Fields[2].AsString);
            rgTagSelect.Properties.Items[0].Caption := cTagPrefix_IE + ' xx xxxxx';
            rgTagSelect.Properties.Items[1].Caption := cTagPrefix_372 + ' xx xxxxx';
            if ( FTagPrefix = cTagPrefix_IE ) then
               begin
                  rgTagSelect.ItemIndex := 0;
                  sTagDesignator := '';
                  sTagDesignator := Copy(Trim(Fields[1].AsString),0,2) + ' ' + Copy(Trim(Fields[1].AsString),3,5);
                  if ( Length(sTagDesignator) > 0 ) then
                     rgTagSelect.Properties.Items[0].Caption := cTagPrefix_IE + ' ' + sTagDesignator;
                  if ( Length(FOldTagDesignator) > 0 ) then
                     begin
                        sTagDesignator := '';
                        sTagDesignator := Copy(Trim(FOldTagDesignator),0,2) + ' ' + Copy(Trim(FOldTagDesignator),3,5);
                        rgTagSelect.Properties.Items[1].Caption := cTagPrefix_372 + ' ' + sTagDesignator;
                     end;
               end
            else if ( FTagPrefix = cTagPrefix_372 ) then
               begin
                  rgTagSelect.ItemIndex := 1;
                  sTagDesignator := '';
                  sTagDesignator := Copy(Trim(Fields[1].AsString),0,2) + ' ' + Copy(Trim(Fields[1].AsString),3,5);
                  if ( Length(sTagDesignator) > 0 ) then
                     rgTagSelect.Properties.Items[1].Caption := cTagPrefix_372 + ' ' + sTagDesignator;
                  if ( Length(FOldTagDesignator) > 0 ) then
                     begin
                        sTagDesignator := '';
                        sTagDesignator := Copy(Trim(FOldTagDesignator),0,2) + ' ' + Copy(Trim(FOldTagDesignator),3,5);
                        rgTagSelect.Properties.Items[0].Caption := cTagPrefix_IE + ' ' + sTagDesignator;
                     end;
               end;
            teHerdDesignator.Text := FTagDesginator;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmTagIdentifierSelection.cbHideThisScreenPropertiesChange(
  Sender: TObject);
begin
   if ( FFormShowing ) and ( cbHideThisScreen.Checked ) then
      begin
         if ( FTagPrefixChanged ) then
            btnOKClick(Sender)
         else
            begin
               WinData.GlobalSettings.DisplayTagIdentifierSelector := not( cbHideThisScreen.Checked );
               WinData.SavePreferences;
               Close;
               ModalResult := mrOK;
            end;
      end;
end;

procedure TfmTagIdentifierSelection.FormShow(Sender: TObject);
begin
   FFormShowing := True;
end;

procedure TfmTagIdentifierSelection.FormActivate(Sender: TObject);
begin
   OnActivate := nil;
end;

procedure TfmTagIdentifierSelection.teHerdDesignatorKeyPress(
  Sender: TObject; var Key: Char);
begin
   if ( not(Key in [#8, '0'..'9']) ) then
      Key := #0;
end;

procedure TfmTagIdentifierSelection.rgTagSelectPropertiesChange(
  Sender: TObject);
begin
   if ( rgTagSelect.ItemIndex = 0 ) then
      begin
         FTagPrefixChanged := ( FTagPrefix <> cTagPrefix_IE );
         lDesignatorInfo.Caption := 'Enter in your IE herd designator (7 digits)';
      end
   else
      begin
         FTagPrefixChanged := ( FTagPrefix <> cTagPrefix_372 );
         lDesignatorInfo.Caption := 'Enter in your 372/EID-compatible herd designator (7 digits)';
      end;

   if ( FTagPrefixChanged ) then
      begin
         if ( Length(FOldTagDesignator) > 0 ) then
            teHerdDesignator.Text := FOldTagDesignator
         else
            teHerdDesignator.Text := '';
      end
   else
      teHerdDesignator.Text := FTagDesginator;
end;

procedure TfmTagIdentifierSelection.btnOKClick(Sender: TObject);
var
   qUpdateOwners : TQuery;
begin
   if ( Length(teHerdDesignator.Text) = 0 ) then
      begin
         MessageDlg('Please enter the designator for the selected tag format.',mtError,[mbOK],0);
         teHerdDesignator.SetFocus;
         SysUtils.Abort;
      end;
   if ( rgTagSelect.ItemIndex = 1 ) then
      if ( not(ValidEIDTagFormat(teHerdDesignator.Text)) ) then
         begin
            MessageDlg(cInvalid_Irish_BovineRange_HerdNo,mtError,[mbOK],0);
            SysUtils.Abort;
         end;
   if ( FTagPrefixChanged ) then
      if ( Length(teHerdDesignator.Text) > 0 ) then
         begin
            qUpdateOwners := TQuery.Create(nil);
            with qUpdateOwners do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('UPDATE Owners');
                  if ( rgTagSelect.ItemIndex = 0 ) then
                     SQL.Add('SET TagPrefix = "'+cTagPrefix_IE+'",')
                  else
                     SQL.Add('SET TagPrefix = "'+cTagPrefix_372+'",');
                  SQL.Add('HerdIdentifier = "'+teHerdDesignator.Text+'",');
                  SQL.Add('SwitchedTagDesignator = '+Trim(FTagDesginator)+',');
                  SQL.Add('IsSynchronized = False');
                  SQL.Add('WHERE ID = '+IntToStr(WinData.UserDefaultHerdID)+'');
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

   WinData.GlobalSettings.DisplayTagIdentifierSelector := not( cbHideThisScreen.Checked );
   WinData.SavePreferences;

   Close;
   ModalResult := mrOK;
end;

end.
