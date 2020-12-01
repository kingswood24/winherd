{
   12/11/10 [V4.0 R5.6] /MK Additional Feature - If Country Is Ireland Then Enable ICBFBox and Check It.

   29/05/14 [V5.3 R1.6] /MK Change - Pass in TCountry to CreateAndShow.
                                   - If no MilkDiskParameter already set and TCountry is not Ireland then
                                     default MilkDiskLayoutID to DSMember.dat ID.
                                   - Customer prompted to save on Exit if MilkDiskLayout in Insert/Edit mode. 
}

unit uSetUpMilkDisk;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons, RXLookup,
  RXCtrls, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, kwDBNavigator,
  uHerdLookup, GenTypesConst, KDBRoutines;

type
  TfSetupMilkDisk = class(TForm)
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    EditDefaultName: TDBEdit;
    EditAnimalNoChars: TDBEdit;
    EditAnimalNoPos: TDBEdit;
    EditAnimalNoLen: TDBEdit;
    EditMilkYieldPos: TDBEdit;
    EditMilkYieldLen: TDBEdit;
    EditBFatPos: TDBEdit;
    EditBFatLen: TDBEdit;
    EditProtPos: TDBEdit;
    EditProtLen: TDBEdit;
    EditLactPos: TDBEdit;
    EditLactLen: TDBEdit;
    EditYieldPos: TDBEdit;
    EditYieldLen: TDBEdit;
    EditBFatPercPos: TDBEdit;
    EditBFatPercLen: TDBEdit;
    EditProtPercPos: TDBEdit;
    EditProtPercLen: TDBEdit;
    EditCumYieldPos: TDBEdit;
    EditCumYieldLen: TDBEdit;
    EditCumBFatPos: TDBEdit;
    EditCumBFatLen: TDBEdit;
    EditCumProtPos: TDBEdit;
    EditCumProtLen: TDBEdit;
    EditNoOfTestsPos: TDBEdit;
    EditNoOfTestsLen: TDBEdit;
    EditDaysInMilkPos: TDBEdit;
    EditDaysInMilkLen: TDBEdit;
    EditSCCPos: TDBEdit;
    EditSCCLen: TDBEdit;
    Date: TLabel;
    EditDatePos: TDBEdit;
    EditDateLen: TDBEdit;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbSave: TRxSpeedButton;
    sbHelp: TRxSpeedButton;
    ToolButton4: TToolButton;
    DBNavigator: TkwDBNavigator;
    RxDBGrid1: TRxDBGrid;
    Country: TDBEdit;
    rgCountry: TDBRadioGroup;
    Splitter1: TSplitter;
    cbICBFMMR: TCheckBox;
    Label2: TLabel;
    CumLactPos: TDBEdit;
    CumLactLen: TDBEdit;
    procedure bExitClick(Sender: TObject);
    procedure DBNavigatorClick(Sender: TObject; Button: TKNavigateBtn);
    procedure bSaveClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure rgCountryChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbICBFMMRClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FCountry : TCountry;
    { private declarations }
  public
    { public declarations }
  end;

{
var
  fSetupMilkDisk: TfSetupMilkDisk;
}

  procedure CreateAndShow ( ACountry : TCountry );

implementation
uses
    Dialogs,
    DairyData;

{$R *.DFM}

procedure CreateAndShow ( ACountry : TCountry );
begin
     with TfSetupMilkDisk.Create(nil) do
        try
           FCountry := ACountry;
           WinData.Defaults.Open;
           WinData.MilkDiskLayout.Open;
           try
              WinData.MilkDiskLayout.Locate('ID', WinData.Defaults.FieldByName('MilkLayout').Value, []);
           except
           end;
           ShowModal;
        finally
           WinData.Defaults.Close;
           WinData.MilkDiskLayout.Close;
           Free;
        end;
end;

procedure TfSetupMilkDisk.bExitClick(Sender: TObject);
begin
    Close;
end;

procedure TfSetupMilkDisk.DBNavigatorClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
     if ( Button = kwnbPost ) then
        with WinData Do
           try
              Defaults.Open;
              Defaults.Edit;
              Defaults.FieldByName('MilkLayout').Value := WinData.MilkDiskLayout.FieldByName('ID').Value;
              Defaults.Post;
           finally
              Defaults.Close;
           end;
end;

procedure TfSetupMilkDisk.bSaveClick(Sender: TObject);
begin
     // Set the Current Record as the Default
     with Windata.Defaults do
        try
           Open;
           First;
           if RecordCount = 0 then
              Insert
           else
              Edit;
           FieldByName('MilkLayout').Value := WinData.MilkDiskLayout.FieldByName('ID').AsInteger;
           Post;
           Close;
        except
           MessageDLG('Error assigning Default Layout',mtInformation,[mbOK],0);
        end;
end;

procedure TfSetupMilkDisk.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('milkdiskparameters');
end;

procedure TfSetupMilkDisk.rgCountryChange(Sender: TObject);
begin
   if rgCountry.ItemIndex = 0 then
      begin
         cbICBFMMR.Visible := True;
         cbICBFMMR.Checked := True;
      end
   else
      begin
         cbICBFMMR.Visible := False;
         cbICBFMMR.Checked := False;
      end;
end;

procedure TfSetupMilkDisk.FormActivate(Sender: TObject);

   function DSMemberMilkLayoutID : Integer;
   begin
      with GetQuery do
         try
            SQL.Add('SELECT ID');
            SQL.Add('FROM MilkDiskLayout');
            SQL.Add('WHERE Upper(DefaultName) = "DSMEMBER.DAT"');
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
   if ( WinData.Defaults.FieldByName('MilkLayout').AsInteger = 0 ) then
      if FCountry <> Ireland then
         if ( rgCountry.DataSource.DataSet.Locate('ID',DSMemberMilkLayoutID,[]) ) then
            begin
               rgCountry.DataSource.DataSet.Edit;
               case FCountry of
                  NIreland : rgCountry.ItemIndex := 1;
                  Scotland : rgCountry.ItemIndex := 2;
                  England : rgCountry.ItemIndex := 3;
               end;
            end;
   rgCountryChange(Sender);
end;

procedure TfSetupMilkDisk.cbICBFMMRClick(Sender: TObject);
begin
   WinData.ICBFMMR := (Sender as TCheckBox).Checked;
end;

procedure TfSetupMilkDisk.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := ( not(rgCountry.DataSource.DataSet.State in [dsInsert,dsEdit]) );
   if ( not(CanClose) ) then
      MessageDlg('You must save your changes before you exit!!',mtInformation,[mbOK],0);
end;

end.