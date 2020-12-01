unit uHerdNewFeatures;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxPC, cxControls, StdCtrls, cxButtons, ExtCtrls, cxContainer, cxEdit,
  cxCheckBox, cxLabel, cxImage, KRoutines, GenTypesConst, Registry,
  uHerdLookup;

type
  TFeatureType = (ftAll, ftAIMSync, ftVetLink);
  TfmHerdNewFeatures = class(TForm)
    pcNewFeatures: TcxPageControl;
    tsAIMHerdRec: TcxTabSheet;
    tsVetLink: TcxTabSheet;
    pAIMHerdRecHead: TPanel;
    pVetLinkHead: TPanel;
    pBottomBar: TPanel;
    cbHideScreen: TcxCheckBox;
    lShowAppInformation: TcxLabel;
    btnLeft: TcxButton;
    btnRight: TcxButton;
    lAIMHerdRecInfo: TcxLabel;
    lVetLinkInfo: TcxLabel;
    imgVetLink: TcxImage;
    pAIMHerdImg: TPanel;
    imgAIM: TcxImage;
    procedure btnLeftClick(Sender: TObject);
    procedure btnRightClick(Sender: TObject);
    procedure pcNewFeaturesChange(Sender: TObject);
    procedure cbHideScreenPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFromStartup : Boolean;
    FCountry : TCountry;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm (const AFromStartup : Boolean = True);
  end;

var
  fmHerdNewFeatures: TfmHerdNewFeatures;

implementation

{$R *.DFM}

{ TfmHerdNewFeatures }

class procedure TfmHerdNewFeatures.ShowTheForm (const AFromStartup : Boolean = True);
begin
   with TfmHerdNewFeatures.Create(nil) do
      try
         FFromStartup := AFromStartup;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmHerdNewFeatures.btnLeftClick(Sender: TObject);
begin
   pcNewFeatures.ActivePageIndex := pcNewFeatures.ActivePageIndex-1;
end;

procedure TfmHerdNewFeatures.btnRightClick(Sender: TObject);
begin
   pcNewFeatures.ActivePageIndex := pcNewFeatures.ActivePageIndex+1;
end;

procedure TfmHerdNewFeatures.pcNewFeaturesChange(Sender: TObject);
begin
   btnLeft.Visible := ( pcNewFeatures.TabCount > 1 ) and ( pcNewFeatures.ActivePageIndex > 0 );
   btnRight.Visible := ( pcNewFeatures.ActivePageIndex < pcNewFeatures.TabCount-1);
   if ( pcNewFeatures.ActivePageIndex = tsAIMHerdRec.PageIndex ) then
      Caption := 'Sync with Dept. of Ag.'
   else if ( pcNewFeatures.ActivePageIndex = tsVetLink.PageIndex ) then
      Caption := 'VetLink';
end;

procedure TfmHerdNewFeatures.cbHideScreenPropertiesChange(Sender: TObject);
var
   dbName : String;
   Reg : TRegistry;
begin
   dbName := UPPERCASE(ExtractDirFromPath(kRoutines.DataPath));
   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey(cGSRegPathHerd+DBName, TRUE) then // Write stored Preferences
         begin
            if ( pcNewFeatures.ActivePageIndex = tsAIMHerdRec.PageIndex ) then
               Reg.WriteBool(cGSShowAIMSyncFeature,False)
            else if ( pcNewFeatures.ActivePageIndex = tsVetLink.PageIndex ) then
               Reg.WriteBool(cGSShowVetLinkFeature,False);
         end;
   finally
      FreeAndNil(Reg);
   end;
   if ( cbHideScreen.Checked ) then Close;
end;

procedure TfmHerdNewFeatures.FormActivate(Sender: TObject);
var
   dbName : String;
   Reg : TRegistry;
begin
   try
      cbHideScreen.Visible := FFromStartup;
      if ( not(FFromStartup) ) then
         begin
            if ( FCountry = Ireland ) then
               pcNewFeatures.ActivePageIndex := tsAIMHerdRec.PageIndex
            else
               pcNewFeatures.ActivePageIndex := tsVetLink.PageIndex;
            Exit;
         end;
      dbName := UPPERCASE(ExtractDirFromPath(kRoutines.DataPath));
      Reg := TRegistry.Create;
      try
         Reg.RootKey := HKEY_LOCAL_MACHINE;
         if Reg.OpenKey(cGSRegPathHerd+DBName, FALSE) then // Preferences Exist.
            begin
               tsAIMHerdRec.TabVisible := ( Reg.ValueExists(cGSShowAIMSyncFeature) ) and ( Reg.ReadBool(cGSShowAIMSyncFeature) );
               tsVetLink.TabVisible := ( Reg.ValueExists(cGSShowVetLinkFeature) ) and ( Reg.ReadBool(cGSShowVetLinkFeature) );
               if ( tsAIMHerdRec.TabVisible ) then
                  pcNewFeatures.ActivePageIndex := tsAIMHerdRec.PageIndex
               else if ( tsVetLink.TabVisible ) then
                  pcNewFeatures.ActivePageIndex := tsVetLink.PageIndex;
            end;
      finally
         FreeAndNil(Reg);
      end;
   finally
      if ( tsAIMHerdRec.TabVisible ) or ( tsVetLink.TabVisible ) then
         pcNewFeaturesChange(Sender);
      OnActivate := nil;
   end;
end;

procedure TfmHerdNewFeatures.FormCreate(Sender: TObject);
begin
   FCountry := HerdLookup.CountryByHerdID(HerdLookup.DefaultHerdID);
end;

end.
